8400 # Initial process execs /init.
8401 
8402 #include "syscall.h"
8403 #include "traps.h"
8404 
8405 
8406 # exec(init, argv)
8407 .globl start
8408 start:
8409   pushl $argv
8410   pushl $init
8411   pushl $0  // where caller pc would be
8412   movl $SYS_exec, %eax
8413   int $T_SYSCALL
8414 
8415 # for(;;) exit();
8416 exit:
8417   movl $SYS_exit, %eax
8418   int $T_SYSCALL
8419   jmp exit
8420 
8421 # char init[] = "/init\0";
8422 init:
8423   .string "/init\0"
8424 
8425 # char *argv[] = { init, 0 };
8426 .p2align 2
8427 argv:
8428   .long init
8429   .long 0
8430 
8431 
8432 
8433 
8434 
8435 
8436 
8437 
8438 
8439 
8440 
8441 
8442 
8443 
8444 
8445 
8446 
8447 
8448 
8449 
