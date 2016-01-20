5900 //
5901 // File-system system calls.
5902 // Mostly argument checking, since we don't trust
5903 // user code, and calls into file.c and fs.c.
5904 //
5905 
5906 #include "types.h"
5907 #include "defs.h"
5908 #include "param.h"
5909 #include "stat.h"
5910 #include "mmu.h"
5911 #include "proc.h"
5912 #include "fs.h"
5913 #include "file.h"
5914 #include "fcntl.h"
5915 
5916 // Fetch the nth word-sized system call argument as a file descriptor
5917 // and return both the descriptor and the corresponding struct file.
5918 static int
5919 argfd(int n, int *pfd, struct file **pf)
5920 {
5921   int fd;
5922   struct file *f;
5923 
5924   if(argint(n, &fd) < 0)
5925     return -1;
5926   if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
5927     return -1;
5928   if(pfd)
5929     *pfd = fd;
5930   if(pf)
5931     *pf = f;
5932   return 0;
5933 }
5934 
5935 // Allocate a file descriptor for the given file.
5936 // Takes over file reference from caller on success.
5937 static int
5938 fdalloc(struct file *f)
5939 {
5940   int fd;
5941 
5942   for(fd = 0; fd < NOFILE; fd++){
5943     if(proc->ofile[fd] == 0){
5944       proc->ofile[fd] = f;
5945       return fd;
5946     }
5947   }
5948   return -1;
5949 }
5950 int
5951 sys_dup(void)
5952 {
5953   struct file *f;
5954   int fd;
5955 
5956   if(argfd(0, 0, &f) < 0)
5957     return -1;
5958   if((fd=fdalloc(f)) < 0)
5959     return -1;
5960   filedup(f);
5961   return fd;
5962 }
5963 
5964 int
5965 sys_read(void)
5966 {
5967   struct file *f;
5968   int n;
5969   char *p;
5970 
5971   if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
5972     return -1;
5973   return fileread(f, p, n);
5974 }
5975 
5976 int
5977 sys_write(void)
5978 {
5979   struct file *f;
5980   int n;
5981   char *p;
5982 
5983   if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
5984     return -1;
5985   return filewrite(f, p, n);
5986 }
5987 
5988 int
5989 sys_close(void)
5990 {
5991   int fd;
5992   struct file *f;
5993 
5994   if(argfd(0, &fd, &f) < 0)
5995     return -1;
5996   proc->ofile[fd] = 0;
5997   fileclose(f);
5998   return 0;
5999 }
6000 int
6001 sys_fstat(void)
6002 {
6003   struct file *f;
6004   struct stat *st;
6005 
6006   if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
6007     return -1;
6008   return filestat(f, st);
6009 }
6010 
6011 // Create the path new as a link to the same inode as old.
6012 int
6013 sys_link(void)
6014 {
6015   char name[DIRSIZ], *new, *old;
6016   struct inode *dp, *ip;
6017 
6018   if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
6019     return -1;
6020 
6021   begin_op();
6022   if((ip = namei(old)) == 0){
6023     end_op();
6024     return -1;
6025   }
6026 
6027   ilock(ip);
6028   if(ip->type == T_DIR){
6029     iunlockput(ip);
6030     end_op();
6031     return -1;
6032   }
6033 
6034   ip->nlink++;
6035   iupdate(ip);
6036   iunlock(ip);
6037 
6038   if((dp = nameiparent(new, name)) == 0)
6039     goto bad;
6040   ilock(dp);
6041   if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
6042     iunlockput(dp);
6043     goto bad;
6044   }
6045   iunlockput(dp);
6046   iput(ip);
6047 
6048   end_op();
6049 
6050   return 0;
6051 
6052 bad:
6053   ilock(ip);
6054   ip->nlink--;
6055   iupdate(ip);
6056   iunlockput(ip);
6057   end_op();
6058   return -1;
6059 }
6060 
6061 // Is the directory dp empty except for "." and ".." ?
6062 static int
6063 isdirempty(struct inode *dp)
6064 {
6065   int off;
6066   struct dirent de;
6067 
6068   for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
6069     if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
6070       panic("isdirempty: readi");
6071     if(de.inum != 0)
6072       return 0;
6073   }
6074   return 1;
6075 }
6076 
6077 
6078 
6079 
6080 
6081 
6082 
6083 
6084 
6085 
6086 
6087 
6088 
6089 
6090 
6091 
6092 
6093 
6094 
6095 
6096 
6097 
6098 
6099 
6100 int
6101 sys_unlink(void)
6102 {
6103   struct inode *ip, *dp;
6104   struct dirent de;
6105   char name[DIRSIZ], *path;
6106   uint off;
6107 
6108   if(argstr(0, &path) < 0)
6109     return -1;
6110 
6111   begin_op();
6112   if((dp = nameiparent(path, name)) == 0){
6113     end_op();
6114     return -1;
6115   }
6116 
6117   ilock(dp);
6118 
6119   // Cannot unlink "." or "..".
6120   if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
6121     goto bad;
6122 
6123   if((ip = dirlookup(dp, name, &off)) == 0)
6124     goto bad;
6125   ilock(ip);
6126 
6127   if(ip->nlink < 1)
6128     panic("unlink: nlink < 1");
6129   if(ip->type == T_DIR && !isdirempty(ip)){
6130     iunlockput(ip);
6131     goto bad;
6132   }
6133 
6134   memset(&de, 0, sizeof(de));
6135   if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
6136     panic("unlink: writei");
6137   if(ip->type == T_DIR){
6138     dp->nlink--;
6139     iupdate(dp);
6140   }
6141   iunlockput(dp);
6142 
6143   ip->nlink--;
6144   iupdate(ip);
6145   iunlockput(ip);
6146 
6147   end_op();
6148 
6149   return 0;
6150 bad:
6151   iunlockput(dp);
6152   end_op();
6153   return -1;
6154 }
6155 
6156 static struct inode*
6157 create(char *path, short type, short major, short minor)
6158 {
6159   uint off;
6160   struct inode *ip, *dp;
6161   char name[DIRSIZ];
6162 
6163   if((dp = nameiparent(path, name)) == 0)
6164     return 0;
6165   ilock(dp);
6166 
6167   if((ip = dirlookup(dp, name, &off)) != 0){
6168     iunlockput(dp);
6169     ilock(ip);
6170     if(type == T_FILE && ip->type == T_FILE)
6171       return ip;
6172     iunlockput(ip);
6173     return 0;
6174   }
6175 
6176   if((ip = ialloc(dp->dev, type)) == 0)
6177     panic("create: ialloc");
6178 
6179   ilock(ip);
6180   ip->major = major;
6181   ip->minor = minor;
6182   ip->nlink = 1;
6183   iupdate(ip);
6184 
6185   if(type == T_DIR){  // Create . and .. entries.
6186     dp->nlink++;  // for ".."
6187     iupdate(dp);
6188     // No ip->nlink++ for ".": avoid cyclic ref count.
6189     if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
6190       panic("create dots");
6191   }
6192 
6193   if(dirlink(dp, name, ip->inum) < 0)
6194     panic("create: dirlink");
6195 
6196   iunlockput(dp);
6197 
6198   return ip;
6199 }
6200 int
6201 sys_open(void)
6202 {
6203   char *path;
6204   int fd, omode;
6205   struct file *f;
6206   struct inode *ip;
6207 
6208   if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
6209     return -1;
6210 
6211   begin_op();
6212 
6213   if(omode & O_CREATE){
6214     ip = create(path, T_FILE, 0, 0);
6215     if(ip == 0){
6216       end_op();
6217       return -1;
6218     }
6219   } else {
6220     if((ip = namei(path)) == 0){
6221       end_op();
6222       return -1;
6223     }
6224     ilock(ip);
6225     if(ip->type == T_DIR && omode != O_RDONLY){
6226       iunlockput(ip);
6227       end_op();
6228       return -1;
6229     }
6230   }
6231 
6232   if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
6233     if(f)
6234       fileclose(f);
6235     iunlockput(ip);
6236     end_op();
6237     return -1;
6238   }
6239   iunlock(ip);
6240   end_op();
6241 
6242   f->type = FD_INODE;
6243   f->ip = ip;
6244   f->off = 0;
6245   f->readable = !(omode & O_WRONLY);
6246   f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
6247   return fd;
6248 }
6249 
6250 int
6251 sys_mkdir(void)
6252 {
6253   char *path;
6254   struct inode *ip;
6255 
6256   begin_op();
6257   if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
6258     end_op();
6259     return -1;
6260   }
6261   iunlockput(ip);
6262   end_op();
6263   return 0;
6264 }
6265 
6266 int
6267 sys_mknod(void)
6268 {
6269   struct inode *ip;
6270   char *path;
6271   int len;
6272   int major, minor;
6273 
6274   begin_op();
6275   if((len=argstr(0, &path)) < 0 ||
6276      argint(1, &major) < 0 ||
6277      argint(2, &minor) < 0 ||
6278      (ip = create(path, T_DEV, major, minor)) == 0){
6279     end_op();
6280     return -1;
6281   }
6282   iunlockput(ip);
6283   end_op();
6284   return 0;
6285 }
6286 
6287 
6288 
6289 
6290 
6291 
6292 
6293 
6294 
6295 
6296 
6297 
6298 
6299 
6300 int
6301 sys_chdir(void)
6302 {
6303   char *path;
6304   struct inode *ip;
6305 
6306   begin_op();
6307   if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
6308     end_op();
6309     return -1;
6310   }
6311   ilock(ip);
6312   if(ip->type != T_DIR){
6313     iunlockput(ip);
6314     end_op();
6315     return -1;
6316   }
6317   iunlock(ip);
6318   iput(proc->cwd);
6319   end_op();
6320   proc->cwd = ip;
6321   return 0;
6322 }
6323 
6324 int
6325 sys_exec(void)
6326 {
6327   char *path, *argv[MAXARG];
6328   int i;
6329   uint uargv, uarg;
6330 
6331   if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
6332     return -1;
6333   }
6334   memset(argv, 0, sizeof(argv));
6335   for(i=0;; i++){
6336     if(i >= NELEM(argv))
6337       return -1;
6338     if(fetchint(uargv+4*i, (int*)&uarg) < 0)
6339       return -1;
6340     if(uarg == 0){
6341       argv[i] = 0;
6342       break;
6343     }
6344     if(fetchstr(uarg, &argv[i]) < 0)
6345       return -1;
6346   }
6347   return exec(path, argv);
6348 }
6349 
6350 int
6351 sys_pipe(void)
6352 {
6353   int *fd;
6354   struct file *rf, *wf;
6355   int fd0, fd1;
6356 
6357   if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
6358     return -1;
6359   if(pipealloc(&rf, &wf) < 0)
6360     return -1;
6361   fd0 = -1;
6362   if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
6363     if(fd0 >= 0)
6364       proc->ofile[fd0] = 0;
6365     fileclose(rf);
6366     fileclose(wf);
6367     return -1;
6368   }
6369   fd[0] = fd0;
6370   fd[1] = fd1;
6371   return 0;
6372 }
6373 
6374 
6375 
6376 
6377 
6378 
6379 
6380 
6381 
6382 
6383 
6384 
6385 
6386 
6387 
6388 
6389 
6390 
6391 
6392 
6393 
6394 
6395 
6396 
6397 
6398 
6399 
