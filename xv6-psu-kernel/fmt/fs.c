4850 // File system implementation.  Five layers:
4851 //   + Blocks: allocator for raw disk blocks.
4852 //   + Log: crash recovery for multi-step updates.
4853 //   + Files: inode allocator, reading, writing, metadata.
4854 //   + Directories: inode with special contents (list of other inodes!)
4855 //   + Names: paths like /usr/rtm/xv6/fs.c for convenient naming.
4856 //
4857 // This file contains the low-level file system manipulation
4858 // routines.  The (higher-level) system call implementations
4859 // are in sysfile.c.
4860 
4861 #include "types.h"
4862 #include "defs.h"
4863 #include "param.h"
4864 #include "stat.h"
4865 #include "mmu.h"
4866 #include "proc.h"
4867 #include "spinlock.h"
4868 #include "fs.h"
4869 #include "buf.h"
4870 #include "file.h"
4871 
4872 #define min(a, b) ((a) < (b) ? (a) : (b))
4873 static void itrunc(struct inode*);
4874 struct superblock sb;   // there should be one per dev, but we run with one dev
4875 
4876 // Read the super block.
4877 void
4878 readsb(int dev, struct superblock *sb)
4879 {
4880   struct buf *bp;
4881 
4882   bp = bread(dev, 1);
4883   memmove(sb, bp->data, sizeof(*sb));
4884   brelse(bp);
4885 }
4886 
4887 // Zero a block.
4888 static void
4889 bzero(int dev, int bno)
4890 {
4891   struct buf *bp;
4892 
4893   bp = bread(dev, bno);
4894   memset(bp->data, 0, BSIZE);
4895   log_write(bp);
4896   brelse(bp);
4897 }
4898 
4899 
4900 // Blocks.
4901 
4902 // Allocate a zeroed disk block.
4903 static uint
4904 balloc(uint dev)
4905 {
4906   int b, bi, m;
4907   struct buf *bp;
4908 
4909   bp = 0;
4910   for(b = 0; b < sb.size; b += BPB){
4911     bp = bread(dev, BBLOCK(b, sb));
4912     for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
4913       m = 1 << (bi % 8);
4914       if((bp->data[bi/8] & m) == 0){  // Is block free?
4915         bp->data[bi/8] |= m;  // Mark block in use.
4916         log_write(bp);
4917         brelse(bp);
4918         bzero(dev, b + bi);
4919         return b + bi;
4920       }
4921     }
4922     brelse(bp);
4923   }
4924   panic("balloc: out of blocks");
4925 }
4926 
4927 // Free a disk block.
4928 static void
4929 bfree(int dev, uint b)
4930 {
4931   struct buf *bp;
4932   int bi, m;
4933 
4934   readsb(dev, &sb);
4935   bp = bread(dev, BBLOCK(b, sb));
4936   bi = b % BPB;
4937   m = 1 << (bi % 8);
4938   if((bp->data[bi/8] & m) == 0)
4939     panic("freeing free block");
4940   bp->data[bi/8] &= ~m;
4941   log_write(bp);
4942   brelse(bp);
4943 }
4944 
4945 
4946 
4947 
4948 
4949 
4950 // Inodes.
4951 //
4952 // An inode describes a single unnamed file.
4953 // The inode disk structure holds metadata: the file's type,
4954 // its size, the number of links referring to it, and the
4955 // list of blocks holding the file's content.
4956 //
4957 // The inodes are laid out sequentially on disk at
4958 // sb.startinode. Each inode has a number, indicating its
4959 // position on the disk.
4960 //
4961 // The kernel keeps a cache of in-use inodes in memory
4962 // to provide a place for synchronizing access
4963 // to inodes used by multiple processes. The cached
4964 // inodes include book-keeping information that is
4965 // not stored on disk: ip->ref and ip->flags.
4966 //
4967 // An inode and its in-memory represtative go through a
4968 // sequence of states before they can be used by the
4969 // rest of the file system code.
4970 //
4971 // * Allocation: an inode is allocated if its type (on disk)
4972 //   is non-zero. ialloc() allocates, iput() frees if
4973 //   the link count has fallen to zero.
4974 //
4975 // * Referencing in cache: an entry in the inode cache
4976 //   is free if ip->ref is zero. Otherwise ip->ref tracks
4977 //   the number of in-memory pointers to the entry (open
4978 //   files and current directories). iget() to find or
4979 //   create a cache entry and increment its ref, iput()
4980 //   to decrement ref.
4981 //
4982 // * Valid: the information (type, size, &c) in an inode
4983 //   cache entry is only correct when the I_VALID bit
4984 //   is set in ip->flags. ilock() reads the inode from
4985 //   the disk and sets I_VALID, while iput() clears
4986 //   I_VALID if ip->ref has fallen to zero.
4987 //
4988 // * Locked: file system code may only examine and modify
4989 //   the information in an inode and its content if it
4990 //   has first locked the inode. The I_BUSY flag indicates
4991 //   that the inode is locked. ilock() sets I_BUSY,
4992 //   while iunlock clears it.
4993 //
4994 // Thus a typical sequence is:
4995 //   ip = iget(dev, inum)
4996 //   ilock(ip)
4997 //   ... examine and modify ip->xxx ...
4998 //   iunlock(ip)
4999 //   iput(ip)
5000 //
5001 // ilock() is separate from iget() so that system calls can
5002 // get a long-term reference to an inode (as for an open file)
5003 // and only lock it for short periods (e.g., in read()).
5004 // The separation also helps avoid deadlock and races during
5005 // pathname lookup. iget() increments ip->ref so that the inode
5006 // stays cached and pointers to it remain valid.
5007 //
5008 // Many internal file system functions expect the caller to
5009 // have locked the inodes involved; this lets callers create
5010 // multi-step atomic operations.
5011 
5012 struct {
5013   struct spinlock lock;
5014   struct inode inode[NINODE];
5015 } icache;
5016 
5017 void
5018 iinit(int dev)
5019 {
5020   initlock(&icache.lock, "icache");
5021   readsb(dev, &sb);
5022   cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d inodestart %d bmap start %d\n", sb.size,
5023           sb.nblocks, sb.ninodes, sb.nlog, sb.logstart, sb.inodestart, sb.bmapstart);
5024 }
5025 
5026 static struct inode* iget(uint dev, uint inum);
5027 
5028 
5029 
5030 
5031 
5032 
5033 
5034 
5035 
5036 
5037 
5038 
5039 
5040 
5041 
5042 
5043 
5044 
5045 
5046 
5047 
5048 
5049 
5050 // Allocate a new inode with the given type on device dev.
5051 // A free inode has a type of zero.
5052 struct inode*
5053 ialloc(uint dev, short type)
5054 {
5055   int inum;
5056   struct buf *bp;
5057   struct dinode *dip;
5058 
5059   for(inum = 1; inum < sb.ninodes; inum++){
5060     bp = bread(dev, IBLOCK(inum, sb));
5061     dip = (struct dinode*)bp->data + inum%IPB;
5062     if(dip->type == 0){  // a free inode
5063       memset(dip, 0, sizeof(*dip));
5064       dip->type = type;
5065       log_write(bp);   // mark it allocated on the disk
5066       brelse(bp);
5067       return iget(dev, inum);
5068     }
5069     brelse(bp);
5070   }
5071   panic("ialloc: no inodes");
5072 }
5073 
5074 // Copy a modified in-memory inode to disk.
5075 void
5076 iupdate(struct inode *ip)
5077 {
5078   struct buf *bp;
5079   struct dinode *dip;
5080 
5081   bp = bread(ip->dev, IBLOCK(ip->inum, sb));
5082   dip = (struct dinode*)bp->data + ip->inum%IPB;
5083   dip->type = ip->type;
5084   dip->major = ip->major;
5085   dip->minor = ip->minor;
5086   dip->nlink = ip->nlink;
5087   dip->size = ip->size;
5088   memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
5089   log_write(bp);
5090   brelse(bp);
5091 }
5092 
5093 
5094 
5095 
5096 
5097 
5098 
5099 
5100 // Find the inode with number inum on device dev
5101 // and return the in-memory copy. Does not lock
5102 // the inode and does not read it from disk.
5103 static struct inode*
5104 iget(uint dev, uint inum)
5105 {
5106   struct inode *ip, *empty;
5107 
5108   acquire(&icache.lock);
5109 
5110   // Is the inode already cached?
5111   empty = 0;
5112   for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
5113     if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
5114       ip->ref++;
5115       release(&icache.lock);
5116       return ip;
5117     }
5118     if(empty == 0 && ip->ref == 0)    // Remember empty slot.
5119       empty = ip;
5120   }
5121 
5122   // Recycle an inode cache entry.
5123   if(empty == 0)
5124     panic("iget: no inodes");
5125 
5126   ip = empty;
5127   ip->dev = dev;
5128   ip->inum = inum;
5129   ip->ref = 1;
5130   ip->flags = 0;
5131   release(&icache.lock);
5132 
5133   return ip;
5134 }
5135 
5136 // Increment reference count for ip.
5137 // Returns ip to enable ip = idup(ip1) idiom.
5138 struct inode*
5139 idup(struct inode *ip)
5140 {
5141   acquire(&icache.lock);
5142   ip->ref++;
5143   release(&icache.lock);
5144   return ip;
5145 }
5146 
5147 
5148 
5149 
5150 // Lock the given inode.
5151 // Reads the inode from disk if necessary.
5152 void
5153 ilock(struct inode *ip)
5154 {
5155   struct buf *bp;
5156   struct dinode *dip;
5157 
5158   if(ip == 0 || ip->ref < 1)
5159     panic("ilock");
5160 
5161   acquire(&icache.lock);
5162   while(ip->flags & I_BUSY)
5163     sleep(ip, &icache.lock);
5164   ip->flags |= I_BUSY;
5165   release(&icache.lock);
5166 
5167   if(!(ip->flags & I_VALID)){
5168     bp = bread(ip->dev, IBLOCK(ip->inum, sb));
5169     dip = (struct dinode*)bp->data + ip->inum%IPB;
5170     ip->type = dip->type;
5171     ip->major = dip->major;
5172     ip->minor = dip->minor;
5173     ip->nlink = dip->nlink;
5174     ip->size = dip->size;
5175     memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
5176     brelse(bp);
5177     ip->flags |= I_VALID;
5178     if(ip->type == 0)
5179       panic("ilock: no type");
5180   }
5181 }
5182 
5183 // Unlock the given inode.
5184 void
5185 iunlock(struct inode *ip)
5186 {
5187   if(ip == 0 || !(ip->flags & I_BUSY) || ip->ref < 1)
5188     panic("iunlock");
5189 
5190   acquire(&icache.lock);
5191   ip->flags &= ~I_BUSY;
5192   wakeup(ip);
5193   release(&icache.lock);
5194 }
5195 
5196 
5197 
5198 
5199 
5200 // Drop a reference to an in-memory inode.
5201 // If that was the last reference, the inode cache entry can
5202 // be recycled.
5203 // If that was the last reference and the inode has no links
5204 // to it, free the inode (and its content) on disk.
5205 // All calls to iput() must be inside a transaction in
5206 // case it has to free the inode.
5207 void
5208 iput(struct inode *ip)
5209 {
5210   acquire(&icache.lock);
5211   if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
5212     // inode has no links and no other references: truncate and free.
5213     if(ip->flags & I_BUSY)
5214       panic("iput busy");
5215     ip->flags |= I_BUSY;
5216     release(&icache.lock);
5217     itrunc(ip);
5218     ip->type = 0;
5219     iupdate(ip);
5220     acquire(&icache.lock);
5221     ip->flags = 0;
5222     wakeup(ip);
5223   }
5224   ip->ref--;
5225   release(&icache.lock);
5226 }
5227 
5228 // Common idiom: unlock, then put.
5229 void
5230 iunlockput(struct inode *ip)
5231 {
5232   iunlock(ip);
5233   iput(ip);
5234 }
5235 
5236 
5237 
5238 
5239 
5240 
5241 
5242 
5243 
5244 
5245 
5246 
5247 
5248 
5249 
5250 // Inode content
5251 //
5252 // The content (data) associated with each inode is stored
5253 // in blocks on the disk. The first NDIRECT block numbers
5254 // are listed in ip->addrs[].  The next NINDIRECT blocks are
5255 // listed in block ip->addrs[NDIRECT].
5256 
5257 // Return the disk block address of the nth block in inode ip.
5258 // If there is no such block, bmap allocates one.
5259 static uint
5260 bmap(struct inode *ip, uint bn)
5261 {
5262   uint addr, *a;
5263   struct buf *bp;
5264 
5265   if(bn < NDIRECT){
5266     if((addr = ip->addrs[bn]) == 0)
5267       ip->addrs[bn] = addr = balloc(ip->dev);
5268     return addr;
5269   }
5270   bn -= NDIRECT;
5271 
5272   if(bn < NINDIRECT){
5273     // Load indirect block, allocating if necessary.
5274     if((addr = ip->addrs[NDIRECT]) == 0)
5275       ip->addrs[NDIRECT] = addr = balloc(ip->dev);
5276     bp = bread(ip->dev, addr);
5277     a = (uint*)bp->data;
5278     if((addr = a[bn]) == 0){
5279       a[bn] = addr = balloc(ip->dev);
5280       log_write(bp);
5281     }
5282     brelse(bp);
5283     return addr;
5284   }
5285 
5286   panic("bmap: out of range");
5287 }
5288 
5289 
5290 
5291 
5292 
5293 
5294 
5295 
5296 
5297 
5298 
5299 
5300 // Truncate inode (discard contents).
5301 // Only called when the inode has no links
5302 // to it (no directory entries referring to it)
5303 // and has no in-memory reference to it (is
5304 // not an open file or current directory).
5305 static void
5306 itrunc(struct inode *ip)
5307 {
5308   int i, j;
5309   struct buf *bp;
5310   uint *a;
5311 
5312   for(i = 0; i < NDIRECT; i++){
5313     if(ip->addrs[i]){
5314       bfree(ip->dev, ip->addrs[i]);
5315       ip->addrs[i] = 0;
5316     }
5317   }
5318 
5319   if(ip->addrs[NDIRECT]){
5320     bp = bread(ip->dev, ip->addrs[NDIRECT]);
5321     a = (uint*)bp->data;
5322     for(j = 0; j < NINDIRECT; j++){
5323       if(a[j])
5324         bfree(ip->dev, a[j]);
5325     }
5326     brelse(bp);
5327     bfree(ip->dev, ip->addrs[NDIRECT]);
5328     ip->addrs[NDIRECT] = 0;
5329   }
5330 
5331   ip->size = 0;
5332   iupdate(ip);
5333 }
5334 
5335 // Copy stat information from inode.
5336 void
5337 stati(struct inode *ip, struct stat *st)
5338 {
5339   st->dev = ip->dev;
5340   st->ino = ip->inum;
5341   st->type = ip->type;
5342   st->nlink = ip->nlink;
5343   st->size = ip->size;
5344 }
5345 
5346 
5347 
5348 
5349 
5350 // Read data from inode.
5351 int
5352 readi(struct inode *ip, char *dst, uint off, uint n)
5353 {
5354   uint tot, m;
5355   struct buf *bp;
5356 
5357   if(ip->type == T_DEV){
5358     if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
5359       return -1;
5360     return devsw[ip->major].read(ip, dst, n);
5361   }
5362 
5363   if(off > ip->size || off + n < off)
5364     return -1;
5365   if(off + n > ip->size)
5366     n = ip->size - off;
5367 
5368   for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
5369     bp = bread(ip->dev, bmap(ip, off/BSIZE));
5370     m = min(n - tot, BSIZE - off%BSIZE);
5371     memmove(dst, bp->data + off%BSIZE, m);
5372     brelse(bp);
5373   }
5374   return n;
5375 }
5376 
5377 
5378 
5379 
5380 
5381 
5382 
5383 
5384 
5385 
5386 
5387 
5388 
5389 
5390 
5391 
5392 
5393 
5394 
5395 
5396 
5397 
5398 
5399 
5400 // Write data to inode.
5401 int
5402 writei(struct inode *ip, char *src, uint off, uint n)
5403 {
5404   uint tot, m;
5405   struct buf *bp;
5406 
5407   if(ip->type == T_DEV){
5408     if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
5409       return -1;
5410     return devsw[ip->major].write(ip, src, n);
5411   }
5412 
5413   if(off > ip->size || off + n < off)
5414     return -1;
5415   if(off + n > MAXFILE*BSIZE)
5416     return -1;
5417 
5418   for(tot=0; tot<n; tot+=m, off+=m, src+=m){
5419     bp = bread(ip->dev, bmap(ip, off/BSIZE));
5420     m = min(n - tot, BSIZE - off%BSIZE);
5421     memmove(bp->data + off%BSIZE, src, m);
5422     log_write(bp);
5423     brelse(bp);
5424   }
5425 
5426   if(n > 0 && off > ip->size){
5427     ip->size = off;
5428     iupdate(ip);
5429   }
5430   return n;
5431 }
5432 
5433 
5434 
5435 
5436 
5437 
5438 
5439 
5440 
5441 
5442 
5443 
5444 
5445 
5446 
5447 
5448 
5449 
5450 // Directories
5451 
5452 int
5453 namecmp(const char *s, const char *t)
5454 {
5455   return strncmp(s, t, DIRSIZ);
5456 }
5457 
5458 // Look for a directory entry in a directory.
5459 // If found, set *poff to byte offset of entry.
5460 struct inode*
5461 dirlookup(struct inode *dp, char *name, uint *poff)
5462 {
5463   uint off, inum;
5464   struct dirent de;
5465 
5466   if(dp->type != T_DIR)
5467     panic("dirlookup not DIR");
5468 
5469   for(off = 0; off < dp->size; off += sizeof(de)){
5470     if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
5471       panic("dirlink read");
5472     if(de.inum == 0)
5473       continue;
5474     if(namecmp(name, de.name) == 0){
5475       // entry matches path element
5476       if(poff)
5477         *poff = off;
5478       inum = de.inum;
5479       return iget(dp->dev, inum);
5480     }
5481   }
5482 
5483   return 0;
5484 }
5485 
5486 
5487 
5488 
5489 
5490 
5491 
5492 
5493 
5494 
5495 
5496 
5497 
5498 
5499 
5500 // Write a new directory entry (name, inum) into the directory dp.
5501 int
5502 dirlink(struct inode *dp, char *name, uint inum)
5503 {
5504   int off;
5505   struct dirent de;
5506   struct inode *ip;
5507 
5508   // Check that name is not present.
5509   if((ip = dirlookup(dp, name, 0)) != 0){
5510     iput(ip);
5511     return -1;
5512   }
5513 
5514   // Look for an empty dirent.
5515   for(off = 0; off < dp->size; off += sizeof(de)){
5516     if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
5517       panic("dirlink read");
5518     if(de.inum == 0)
5519       break;
5520   }
5521 
5522   strncpy(de.name, name, DIRSIZ);
5523   de.inum = inum;
5524   if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
5525     panic("dirlink");
5526 
5527   return 0;
5528 }
5529 
5530 
5531 
5532 
5533 
5534 
5535 
5536 
5537 
5538 
5539 
5540 
5541 
5542 
5543 
5544 
5545 
5546 
5547 
5548 
5549 
5550 // Paths
5551 
5552 // Copy the next path element from path into name.
5553 // Return a pointer to the element following the copied one.
5554 // The returned path has no leading slashes,
5555 // so the caller can check *path=='\0' to see if the name is the last one.
5556 // If no name to remove, return 0.
5557 //
5558 // Examples:
5559 //   skipelem("a/bb/c", name) = "bb/c", setting name = "a"
5560 //   skipelem("///a//bb", name) = "bb", setting name = "a"
5561 //   skipelem("a", name) = "", setting name = "a"
5562 //   skipelem("", name) = skipelem("////", name) = 0
5563 //
5564 static char*
5565 skipelem(char *path, char *name)
5566 {
5567   char *s;
5568   int len;
5569 
5570   while(*path == '/')
5571     path++;
5572   if(*path == 0)
5573     return 0;
5574   s = path;
5575   while(*path != '/' && *path != 0)
5576     path++;
5577   len = path - s;
5578   if(len >= DIRSIZ)
5579     memmove(name, s, DIRSIZ);
5580   else {
5581     memmove(name, s, len);
5582     name[len] = 0;
5583   }
5584   while(*path == '/')
5585     path++;
5586   return path;
5587 }
5588 
5589 
5590 
5591 
5592 
5593 
5594 
5595 
5596 
5597 
5598 
5599 
5600 // Look up and return the inode for a path name.
5601 // If parent != 0, return the inode for the parent and copy the final
5602 // path element into name, which must have room for DIRSIZ bytes.
5603 // Must be called inside a transaction since it calls iput().
5604 static struct inode*
5605 namex(char *path, int nameiparent, char *name)
5606 {
5607   struct inode *ip, *next;
5608 
5609   if(*path == '/')
5610     ip = iget(ROOTDEV, ROOTINO);
5611   else
5612     ip = idup(proc->cwd);
5613 
5614   while((path = skipelem(path, name)) != 0){
5615     ilock(ip);
5616     if(ip->type != T_DIR){
5617       iunlockput(ip);
5618       return 0;
5619     }
5620     if(nameiparent && *path == '\0'){
5621       // Stop one level early.
5622       iunlock(ip);
5623       return ip;
5624     }
5625     if((next = dirlookup(ip, name, 0)) == 0){
5626       iunlockput(ip);
5627       return 0;
5628     }
5629     iunlockput(ip);
5630     ip = next;
5631   }
5632   if(nameiparent){
5633     iput(ip);
5634     return 0;
5635   }
5636   return ip;
5637 }
5638 
5639 struct inode*
5640 namei(char *path)
5641 {
5642   char name[DIRSIZ];
5643   return namex(path, 0, name);
5644 }
5645 
5646 
5647 
5648 
5649 
5650 struct inode*
5651 nameiparent(char *path, char *name)
5652 {
5653   return namex(path, 1, name);
5654 }
5655 
5656 
5657 
5658 
5659 
5660 
5661 
5662 
5663 
5664 
5665 
5666 
5667 
5668 
5669 
5670 
5671 
5672 
5673 
5674 
5675 
5676 
5677 
5678 
5679 
5680 
5681 
5682 
5683 
5684 
5685 
5686 
5687 
5688 
5689 
5690 
5691 
5692 
5693 
5694 
5695 
5696 
5697 
5698 
5699 
