4200 // Simple PIO-based (non-DMA) IDE driver code.
4201 
4202 #include "types.h"
4203 #include "defs.h"
4204 #include "param.h"
4205 #include "memlayout.h"
4206 #include "mmu.h"
4207 #include "proc.h"
4208 #include "x86.h"
4209 #include "traps.h"
4210 #include "spinlock.h"
4211 #include "fs.h"
4212 #include "buf.h"
4213 
4214 #define SECTOR_SIZE   512
4215 #define IDE_BSY       0x80
4216 #define IDE_DRDY      0x40
4217 #define IDE_DF        0x20
4218 #define IDE_ERR       0x01
4219 
4220 #define IDE_CMD_READ  0x20
4221 #define IDE_CMD_WRITE 0x30
4222 
4223 // idequeue points to the buf now being read/written to the disk.
4224 // idequeue->qnext points to the next buf to be processed.
4225 // You must hold idelock while manipulating queue.
4226 
4227 static struct spinlock idelock;
4228 static struct buf *idequeue;
4229 
4230 static int havedisk1;
4231 static void idestart(struct buf*);
4232 
4233 // Wait for IDE disk to become ready.
4234 static int
4235 idewait(int checkerr)
4236 {
4237   int r;
4238 
4239   while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
4240     ;
4241   if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
4242     return -1;
4243   return 0;
4244 }
4245 
4246 
4247 
4248 
4249 
4250 void
4251 ideinit(void)
4252 {
4253   int i;
4254 
4255   initlock(&idelock, "ide");
4256   picenable(IRQ_IDE);
4257   ioapicenable(IRQ_IDE, ncpu - 1);
4258   idewait(0);
4259 
4260   // Check if disk 1 is present
4261   outb(0x1f6, 0xe0 | (1<<4));
4262   for(i=0; i<1000; i++){
4263     if(inb(0x1f7) != 0){
4264       havedisk1 = 1;
4265       break;
4266     }
4267   }
4268 
4269   // Switch back to disk 0.
4270   outb(0x1f6, 0xe0 | (0<<4));
4271 }
4272 
4273 // Start the request for b.  Caller must hold idelock.
4274 static void
4275 idestart(struct buf *b)
4276 {
4277   if(b == 0)
4278     panic("idestart");
4279   if(b->blockno >= FSSIZE)
4280     panic("incorrect blockno");
4281   int sector_per_block =  BSIZE/SECTOR_SIZE;
4282   int sector = b->blockno * sector_per_block;
4283 
4284   if (sector_per_block > 7) panic("idestart");
4285 
4286   idewait(0);
4287   outb(0x3f6, 0);  // generate interrupt
4288   outb(0x1f2, sector_per_block);  // number of sectors
4289   outb(0x1f3, sector & 0xff);
4290   outb(0x1f4, (sector >> 8) & 0xff);
4291   outb(0x1f5, (sector >> 16) & 0xff);
4292   outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
4293   if(b->flags & B_DIRTY){
4294     outb(0x1f7, IDE_CMD_WRITE);
4295     outsl(0x1f0, b->data, BSIZE/4);
4296   } else {
4297     outb(0x1f7, IDE_CMD_READ);
4298   }
4299 }
4300 // Interrupt handler.
4301 void
4302 ideintr(void)
4303 {
4304   struct buf *b;
4305 
4306   // First queued buffer is the active request.
4307   acquire(&idelock);
4308   if((b = idequeue) == 0){
4309     release(&idelock);
4310     // cprintf("spurious IDE interrupt\n");
4311     return;
4312   }
4313   idequeue = b->qnext;
4314 
4315   // Read data if needed.
4316   if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
4317     insl(0x1f0, b->data, BSIZE/4);
4318 
4319   // Wake process waiting for this buf.
4320   b->flags |= B_VALID;
4321   b->flags &= ~B_DIRTY;
4322   wakeup(b);
4323 
4324   // Start disk on next buf in queue.
4325   if(idequeue != 0)
4326     idestart(idequeue);
4327 
4328   release(&idelock);
4329 }
4330 
4331 
4332 
4333 
4334 
4335 
4336 
4337 
4338 
4339 
4340 
4341 
4342 
4343 
4344 
4345 
4346 
4347 
4348 
4349 
4350 // Sync buf with disk.
4351 // If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
4352 // Else if B_VALID is not set, read buf from disk, set B_VALID.
4353 void
4354 iderw(struct buf *b)
4355 {
4356   struct buf **pp;
4357 
4358   if(!(b->flags & B_BUSY))
4359     panic("iderw: buf not busy");
4360   if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
4361     panic("iderw: nothing to do");
4362   if(b->dev != 0 && !havedisk1)
4363     panic("iderw: ide disk 1 not present");
4364 
4365   acquire(&idelock);  //DOC:acquire-lock
4366 
4367   // Append b to idequeue.
4368   b->qnext = 0;
4369   for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
4370     ;
4371   *pp = b;
4372 
4373   // Start disk if necessary.
4374   if(idequeue == b)
4375     idestart(b);
4376 
4377   // Wait for request to finish.
4378   while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
4379     sleep(b, &idelock);
4380   }
4381 
4382   release(&idelock);
4383 }
4384 
4385 
4386 
4387 
4388 
4389 
4390 
4391 
4392 
4393 
4394 
4395 
4396 
4397 
4398 
4399 
