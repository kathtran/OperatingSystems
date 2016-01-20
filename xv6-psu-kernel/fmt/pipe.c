6550 #include "types.h"
6551 #include "defs.h"
6552 #include "param.h"
6553 #include "mmu.h"
6554 #include "proc.h"
6555 #include "fs.h"
6556 #include "file.h"
6557 #include "spinlock.h"
6558 
6559 #define PIPESIZE 512
6560 
6561 struct pipe {
6562   struct spinlock lock;
6563   char data[PIPESIZE];
6564   uint nread;     // number of bytes read
6565   uint nwrite;    // number of bytes written
6566   int readopen;   // read fd is still open
6567   int writeopen;  // write fd is still open
6568 };
6569 
6570 int
6571 pipealloc(struct file **f0, struct file **f1)
6572 {
6573   struct pipe *p;
6574 
6575   p = 0;
6576   *f0 = *f1 = 0;
6577   if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
6578     goto bad;
6579   if((p = (struct pipe*)kalloc()) == 0)
6580     goto bad;
6581   p->readopen = 1;
6582   p->writeopen = 1;
6583   p->nwrite = 0;
6584   p->nread = 0;
6585   initlock(&p->lock, "pipe");
6586   (*f0)->type = FD_PIPE;
6587   (*f0)->readable = 1;
6588   (*f0)->writable = 0;
6589   (*f0)->pipe = p;
6590   (*f1)->type = FD_PIPE;
6591   (*f1)->readable = 0;
6592   (*f1)->writable = 1;
6593   (*f1)->pipe = p;
6594   return 0;
6595 
6596 
6597 
6598 
6599 
6600  bad:
6601   if(p)
6602     kfree((char*)p);
6603   if(*f0)
6604     fileclose(*f0);
6605   if(*f1)
6606     fileclose(*f1);
6607   return -1;
6608 }
6609 
6610 void
6611 pipeclose(struct pipe *p, int writable)
6612 {
6613   acquire(&p->lock);
6614   if(writable){
6615     p->writeopen = 0;
6616     wakeup(&p->nread);
6617   } else {
6618     p->readopen = 0;
6619     wakeup(&p->nwrite);
6620   }
6621   if(p->readopen == 0 && p->writeopen == 0){
6622     release(&p->lock);
6623     kfree((char*)p);
6624   } else
6625     release(&p->lock);
6626 }
6627 
6628 
6629 int
6630 pipewrite(struct pipe *p, char *addr, int n)
6631 {
6632   int i;
6633 
6634   acquire(&p->lock);
6635   for(i = 0; i < n; i++){
6636     while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
6637       if(p->readopen == 0 || proc->killed){
6638         release(&p->lock);
6639         return -1;
6640       }
6641       wakeup(&p->nread);
6642       sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
6643     }
6644     p->data[p->nwrite++ % PIPESIZE] = addr[i];
6645   }
6646   wakeup(&p->nread);  //DOC: pipewrite-wakeup1
6647   release(&p->lock);
6648   return n;
6649 }
6650 int
6651 piperead(struct pipe *p, char *addr, int n)
6652 {
6653   int i;
6654 
6655   acquire(&p->lock);
6656   while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
6657     if(proc->killed){
6658       release(&p->lock);
6659       return -1;
6660     }
6661     sleep(&p->nread, &p->lock); //DOC: piperead-sleep
6662   }
6663   for(i = 0; i < n; i++){  //DOC: piperead-copy
6664     if(p->nread == p->nwrite)
6665       break;
6666     addr[i] = p->data[p->nread++ % PIPESIZE];
6667   }
6668   wakeup(&p->nwrite);  //DOC: piperead-wakeup
6669   release(&p->lock);
6670   return i;
6671 }
6672 
6673 
6674 
6675 
6676 
6677 
6678 
6679 
6680 
6681 
6682 
6683 
6684 
6685 
6686 
6687 
6688 
6689 
6690 
6691 
6692 
6693 
6694 
6695 
6696 
6697 
6698 
6699 
