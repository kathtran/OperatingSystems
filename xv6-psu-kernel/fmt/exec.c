6400 #include "types.h"
6401 #include "param.h"
6402 #include "memlayout.h"
6403 #include "mmu.h"
6404 #include "proc.h"
6405 #include "defs.h"
6406 #include "x86.h"
6407 #include "elf.h"
6408 
6409 int
6410 exec(char *path, char **argv)
6411 {
6412   char *s, *last;
6413   int i, off;
6414   uint argc, sz, sp, ustack[3+MAXARG+1];
6415   struct elfhdr elf;
6416   struct inode *ip;
6417   struct proghdr ph;
6418   pde_t *pgdir, *oldpgdir;
6419 
6420   begin_op();
6421   if((ip = namei(path)) == 0){
6422     end_op();
6423     return -1;
6424   }
6425   ilock(ip);
6426   pgdir = 0;
6427 
6428   // Check ELF header
6429   if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
6430     goto bad;
6431   if(elf.magic != ELF_MAGIC)
6432     goto bad;
6433 
6434   if((pgdir = setupkvm()) == 0)
6435     goto bad;
6436 
6437   // Load program into memory.
6438   sz = 0;
6439   for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
6440     if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
6441       goto bad;
6442     if(ph.type != ELF_PROG_LOAD)
6443       continue;
6444     if(ph.memsz < ph.filesz)
6445       goto bad;
6446     if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
6447       goto bad;
6448     if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
6449       goto bad;
6450   }
6451   iunlockput(ip);
6452   end_op();
6453   ip = 0;
6454 
6455   // Allocate two pages at the next page boundary.
6456   // Make the first inaccessible.  Use the second as the user stack.
6457   sz = PGROUNDUP(sz);
6458   if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
6459     goto bad;
6460   clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
6461   sp = sz;
6462 
6463   // Push argument strings, prepare rest of stack in ustack.
6464   for(argc = 0; argv[argc]; argc++) {
6465     if(argc >= MAXARG)
6466       goto bad;
6467     sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
6468     if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
6469       goto bad;
6470     ustack[3+argc] = sp;
6471   }
6472   ustack[3+argc] = 0;
6473 
6474   ustack[0] = 0xffffffff;  // fake return PC
6475   ustack[1] = argc;
6476   ustack[2] = sp - (argc+1)*4;  // argv pointer
6477 
6478   sp -= (3+argc+1) * 4;
6479   if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
6480     goto bad;
6481 
6482   // Save program name for debugging.
6483   for(last=s=path; *s; s++)
6484     if(*s == '/')
6485       last = s+1;
6486   safestrcpy(proc->name, last, sizeof(proc->name));
6487 
6488   // Commit to the user image.
6489   oldpgdir = proc->pgdir;
6490   proc->pgdir = pgdir;
6491   proc->sz = sz;
6492   proc->tf->eip = elf.entry;  // main
6493   proc->tf->esp = sp;
6494   switchuvm(proc);
6495   freevm(oldpgdir);
6496   return 0;
6497 
6498 
6499 
6500  bad:
6501   if(pgdir)
6502     freevm(pgdir);
6503   if(ip){
6504     iunlockput(ip);
6505     end_op();
6506   }
6507   return -1;
6508 }
6509 
6510 
6511 
6512 
6513 
6514 
6515 
6516 
6517 
6518 
6519 
6520 
6521 
6522 
6523 
6524 
6525 
6526 
6527 
6528 
6529 
6530 
6531 
6532 
6533 
6534 
6535 
6536 
6537 
6538 
6539 
6540 
6541 
6542 
6543 
6544 
6545 
6546 
6547 
6548 
6549 
