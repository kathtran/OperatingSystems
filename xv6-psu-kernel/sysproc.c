#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return proc->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;
  
  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;
  
  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

int
sys_date(void)
{
   struct rtcdate *r;

   if(argptr(0, (void*)&r, sizeof(*r)) < 0)
     return -1;
   cmostime(r);
   return 0;
}

int
sys_getuid(void)
{
  return proc->uid;
}

int
sys_getgid(void)
{
  return proc->gid;
}

int
sys_getppid(void)
{
  return proc->ppid;
}

int
sys_setuid(void)
{
  int uid;
  struct proc *p;

  if(argint(0, &uid) < 0 || argptr(1, (void*)&p, sizeof(*p)) < 0)
    return -1;
  p->uid = uid;
  return 0;
}

int
sys_setgid(void)
{
  int gid;
  struct proc *p;

  if(argint(0, &gid) < 0 || argptr(1, (void*)&p, sizeof(*p)) < 0)
    return -1;
  p->gid = gid;
  return 0;
}
