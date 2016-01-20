4600 #include "types.h"
4601 #include "defs.h"
4602 #include "param.h"
4603 #include "spinlock.h"
4604 #include "fs.h"
4605 #include "buf.h"
4606 
4607 // Simple logging that allows concurrent FS system calls.
4608 //
4609 // A log transaction contains the updates of multiple FS system
4610 // calls. The logging system only commits when there are
4611 // no FS system calls active. Thus there is never
4612 // any reasoning required about whether a commit might
4613 // write an uncommitted system call's updates to disk.
4614 //
4615 // A system call should call begin_op()/end_op() to mark
4616 // its start and end. Usually begin_op() just increments
4617 // the count of in-progress FS system calls and returns.
4618 // But if it thinks the log is close to running out, it
4619 // sleeps until the last outstanding end_op() commits.
4620 //
4621 // The log is a physical re-do log containing disk blocks.
4622 // The on-disk log format:
4623 //   header block, containing block #s for block A, B, C, ...
4624 //   block A
4625 //   block B
4626 //   block C
4627 //   ...
4628 // Log appends are synchronous.
4629 
4630 // Contents of the header block, used for both the on-disk header block
4631 // and to keep track in memory of logged block# before commit.
4632 struct logheader {
4633   int n;
4634   int block[LOGSIZE];
4635 };
4636 
4637 struct log {
4638   struct spinlock lock;
4639   int start;
4640   int size;
4641   int outstanding; // how many FS sys calls are executing.
4642   int committing;  // in commit(), please wait.
4643   int dev;
4644   struct logheader lh;
4645 };
4646 
4647 
4648 
4649 
4650 struct log log;
4651 
4652 static void recover_from_log(void);
4653 static void commit();
4654 
4655 void
4656 initlog(int dev)
4657 {
4658   if (sizeof(struct logheader) >= BSIZE)
4659     panic("initlog: too big logheader");
4660 
4661   struct superblock sb;
4662   initlock(&log.lock, "log");
4663   readsb(dev, &sb);
4664   log.start = sb.logstart;
4665   log.size = sb.nlog;
4666   log.dev = dev;
4667   recover_from_log();
4668 }
4669 
4670 // Copy committed blocks from log to their home location
4671 static void
4672 install_trans(void)
4673 {
4674   int tail;
4675 
4676   for (tail = 0; tail < log.lh.n; tail++) {
4677     struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
4678     struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
4679     memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
4680     bwrite(dbuf);  // write dst to disk
4681     brelse(lbuf);
4682     brelse(dbuf);
4683   }
4684 }
4685 
4686 // Read the log header from disk into the in-memory log header
4687 static void
4688 read_head(void)
4689 {
4690   struct buf *buf = bread(log.dev, log.start);
4691   struct logheader *lh = (struct logheader *) (buf->data);
4692   int i;
4693   log.lh.n = lh->n;
4694   for (i = 0; i < log.lh.n; i++) {
4695     log.lh.block[i] = lh->block[i];
4696   }
4697   brelse(buf);
4698 }
4699 
4700 // Write in-memory log header to disk.
4701 // This is the true point at which the
4702 // current transaction commits.
4703 static void
4704 write_head(void)
4705 {
4706   struct buf *buf = bread(log.dev, log.start);
4707   struct logheader *hb = (struct logheader *) (buf->data);
4708   int i;
4709   hb->n = log.lh.n;
4710   for (i = 0; i < log.lh.n; i++) {
4711     hb->block[i] = log.lh.block[i];
4712   }
4713   bwrite(buf);
4714   brelse(buf);
4715 }
4716 
4717 static void
4718 recover_from_log(void)
4719 {
4720   read_head();
4721   install_trans(); // if committed, copy from log to disk
4722   log.lh.n = 0;
4723   write_head(); // clear the log
4724 }
4725 
4726 // called at the start of each FS system call.
4727 void
4728 begin_op(void)
4729 {
4730   acquire(&log.lock);
4731   while(1){
4732     if(log.committing){
4733       sleep(&log, &log.lock);
4734     } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
4735       // this op might exhaust log space; wait for commit.
4736       sleep(&log, &log.lock);
4737     } else {
4738       log.outstanding += 1;
4739       release(&log.lock);
4740       break;
4741     }
4742   }
4743 }
4744 
4745 
4746 
4747 
4748 
4749 
4750 // called at the end of each FS system call.
4751 // commits if this was the last outstanding operation.
4752 void
4753 end_op(void)
4754 {
4755   int do_commit = 0;
4756 
4757   acquire(&log.lock);
4758   log.outstanding -= 1;
4759   if(log.committing)
4760     panic("log.committing");
4761   if(log.outstanding == 0){
4762     do_commit = 1;
4763     log.committing = 1;
4764   } else {
4765     // begin_op() may be waiting for log space.
4766     wakeup(&log);
4767   }
4768   release(&log.lock);
4769 
4770   if(do_commit){
4771     // call commit w/o holding locks, since not allowed
4772     // to sleep with locks.
4773     commit();
4774     acquire(&log.lock);
4775     log.committing = 0;
4776     wakeup(&log);
4777     release(&log.lock);
4778   }
4779 }
4780 
4781 // Copy modified blocks from cache to log.
4782 static void
4783 write_log(void)
4784 {
4785   int tail;
4786 
4787   for (tail = 0; tail < log.lh.n; tail++) {
4788     struct buf *to = bread(log.dev, log.start+tail+1); // log block
4789     struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
4790     memmove(to->data, from->data, BSIZE);
4791     bwrite(to);  // write the log
4792     brelse(from);
4793     brelse(to);
4794   }
4795 }
4796 
4797 
4798 
4799 
4800 static void
4801 commit()
4802 {
4803   if (log.lh.n > 0) {
4804     write_log();     // Write modified blocks from cache to log
4805     write_head();    // Write header to disk -- the real commit
4806     install_trans(); // Now install writes to home locations
4807     log.lh.n = 0;
4808     write_head();    // Erase the transaction from the log
4809   }
4810 }
4811 
4812 // Caller has modified b->data and is done with the buffer.
4813 // Record the block number and pin in the cache with B_DIRTY.
4814 // commit()/write_log() will do the disk write.
4815 //
4816 // log_write() replaces bwrite(); a typical use is:
4817 //   bp = bread(...)
4818 //   modify bp->data[]
4819 //   log_write(bp)
4820 //   brelse(bp)
4821 void
4822 log_write(struct buf *b)
4823 {
4824   int i;
4825 
4826   if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
4827     panic("too big a transaction");
4828   if (log.outstanding < 1)
4829     panic("log_write outside of trans");
4830 
4831   acquire(&log.lock);
4832   for (i = 0; i < log.lh.n; i++) {
4833     if (log.lh.block[i] == b->blockno)   // log absorbtion
4834       break;
4835   }
4836   log.lh.block[i] = b->blockno;
4837   if (i == log.lh.n)
4838     log.lh.n++;
4839   b->flags |= B_DIRTY; // prevent eviction
4840   release(&log.lock);
4841 }
4842 
4843 
4844 
4845 
4846 
4847 
4848 
4849 
