3500 #include "types.h"
3501 #include "defs.h"
3502 #include "param.h"
3503 #include "memlayout.h"
3504 #include "mmu.h"
3505 #include "proc.h"
3506 #include "x86.h"
3507 #include "syscall.h"
3508 
3509 // User code makes a system call with INT T_SYSCALL.
3510 // System call number in %eax.
3511 // Arguments on the stack, from the user call to the C
3512 // library system call function. The saved user %esp points
3513 // to a saved program counter, and then the first argument.
3514 
3515 // Fetch the int at addr from the current process.
3516 int
3517 fetchint(uint addr, int *ip)
3518 {
3519   if(addr >= proc->sz || addr+4 > proc->sz)
3520     return -1;
3521   *ip = *(int*)(addr);
3522   return 0;
3523 }
3524 
3525 // Fetch the nul-terminated string at addr from the current process.
3526 // Doesn't actually copy the string - just sets *pp to point at it.
3527 // Returns length of string, not including nul.
3528 int
3529 fetchstr(uint addr, char **pp)
3530 {
3531   char *s, *ep;
3532 
3533   if(addr >= proc->sz)
3534     return -1;
3535   *pp = (char*)addr;
3536   ep = (char*)proc->sz;
3537   for(s = *pp; s < ep; s++)
3538     if(*s == 0)
3539       return s - *pp;
3540   return -1;
3541 }
3542 
3543 // Fetch the nth 32-bit system call argument.
3544 int
3545 argint(int n, int *ip)
3546 {
3547   return fetchint(proc->tf->esp + 4 + 4*n, ip);
3548 }
3549 
3550 // Fetch the nth word-sized system call argument as a pointer
3551 // to a block of memory of size n bytes.  Check that the pointer
3552 // lies within the process address space.
3553 int
3554 argptr(int n, char **pp, int size)
3555 {
3556   int i;
3557 
3558   if(argint(n, &i) < 0)
3559     return -1;
3560   if((uint)i >= proc->sz || (uint)i+size > proc->sz)
3561     return -1;
3562   *pp = (char*)i;
3563   return 0;
3564 }
3565 
3566 // Fetch the nth word-sized system call argument as a string pointer.
3567 // Check that the pointer is valid and the string is nul-terminated.
3568 // (There is no shared writable memory, so the string can't change
3569 // between this check and being used by the kernel.)
3570 int
3571 argstr(int n, char **pp)
3572 {
3573   int addr;
3574   if(argint(n, &addr) < 0)
3575     return -1;
3576   return fetchstr(addr, pp);
3577 }
3578 
3579 extern int sys_chdir(void);
3580 extern int sys_close(void);
3581 extern int sys_dup(void);
3582 extern int sys_exec(void);
3583 extern int sys_exit(void);
3584 extern int sys_fork(void);
3585 extern int sys_fstat(void);
3586 extern int sys_getpid(void);
3587 extern int sys_kill(void);
3588 extern int sys_link(void);
3589 extern int sys_mkdir(void);
3590 extern int sys_mknod(void);
3591 extern int sys_open(void);
3592 extern int sys_pipe(void);
3593 extern int sys_read(void);
3594 extern int sys_sbrk(void);
3595 extern int sys_sleep(void);
3596 extern int sys_unlink(void);
3597 extern int sys_wait(void);
3598 extern int sys_write(void);
3599 extern int sys_uptime(void);
3600 extern int sys_date(void);
3601 
3602 static int (*syscalls[])(void) = {
3603 [SYS_fork]    sys_fork,
3604 [SYS_exit]    sys_exit,
3605 [SYS_wait]    sys_wait,
3606 [SYS_pipe]    sys_pipe,
3607 [SYS_read]    sys_read,
3608 [SYS_kill]    sys_kill,
3609 [SYS_exec]    sys_exec,
3610 [SYS_fstat]   sys_fstat,
3611 [SYS_chdir]   sys_chdir,
3612 [SYS_dup]     sys_dup,
3613 [SYS_getpid]  sys_getpid,
3614 [SYS_sbrk]    sys_sbrk,
3615 [SYS_sleep]   sys_sleep,
3616 [SYS_uptime]  sys_uptime,
3617 [SYS_open]    sys_open,
3618 [SYS_write]   sys_write,
3619 [SYS_mknod]   sys_mknod,
3620 [SYS_unlink]  sys_unlink,
3621 [SYS_link]    sys_link,
3622 [SYS_mkdir]   sys_mkdir,
3623 [SYS_close]   sys_close,
3624 [SYS_date]    sys_date
3625 };
3626 
3627 void
3628 syscall(void)
3629 {
3630   int num;
3631 
3632   num = proc->tf->eax;
3633   if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
3634     proc->tf->eax = syscalls[num]();
3635     #ifdef PRINT_SYSCALLS
3636     static char* syscallnames[] = {
3637       [SYS_fork]    "fork",
3638       [SYS_exit]    "exit",
3639       [SYS_wait]    "wait",
3640       [SYS_pipe]    "pipe",
3641       [SYS_read]    "read",
3642       [SYS_kill]    "kill",
3643       [SYS_exec]    "exec",
3644       [SYS_fstat]   "fstat",
3645       [SYS_chdir]   "chdir",
3646       [SYS_dup]     "dup",
3647       [SYS_getpid]  "getpid",
3648       [SYS_sbrk]    "sbrk",
3649       [SYS_sleep]   "sleep",
3650       [SYS_uptime]  "uptime",
3651       [SYS_open]    "open",
3652       [SYS_write]   "write",
3653       [SYS_mknod]   "mknod",
3654       [SYS_unlink]  "unlink",
3655       [SYS_link]    "link",
3656       [SYS_mkdir]   "mkdir",
3657       [SYS_close]   "close",
3658       [SYS_date]    "date"
3659     };
3660     char* syscall = syscallnames[num];
3661     cprintf("%s -> %d\n",
3662             syscall, proc->tf->eax);
3663     #endif
3664   } else {
3665     cprintf("%d %s: unknown sys call %d\n",
3666             proc->pid, proc->name, num);
3667     proc->tf->eax = -1;
3668   }
3669 }
3670 
3671 
3672 
3673 
3674 
3675 
3676 
3677 
3678 
3679 
3680 
3681 
3682 
3683 
3684 
3685 
3686 
3687 
3688 
3689 
3690 
3691 
3692 
3693 
3694 
3695 
3696 
3697 
3698 
3699 
