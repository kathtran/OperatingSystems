9400 #include "types.h"
9401 #include "user.h"
9402 #include "date.h"
9403 
9404 #define MAXARGS 20
9405 
9406 int
9407 main(int argc, char *argv[]) {
9408   int i;
9409   char *p[MAXARGS];
9410   struct rtcdate r1, r2;
9411   int pid;
9412 
9413   if (argc >= (MAXARGS)) {  // we count from 0
9414     printf(2, "Error: too many args\n");
9415     exit();
9416   }
9417 
9418   for (i=0; i<argc-1; i++) {
9419     p[i] = argv[i+1];
9420   }
9421   p[i] = '\0';
9422 
9423   if (date(&r1) != 0) {
9424     printf(2, "sys_date failed\n");
9425     exit();
9426   }
9427 
9428   pid = fork();
9429   if (pid < 0) {
9430     printf(2, "fork() failed\n");
9431     exit();
9432   } else if (pid == 0) {  // child
9433     exec(p[0], p);
9434     printf(2, "Error: exec failed. %s probably needs full path\n", p[0]);
9435     exit();
9436   } else {                // parent
9437     wait();
9438     if (date(&r2) != 0) {
9439       printf(2, "date failed");
9440       exit();
9441     }
9442   }
9443 
9444   uint min, sec;
9445 
9446 
9447 
9448 
9449 
9450   if (r1.second > r2.second) {
9451     min = r2.minute - r1.minute - 1;
9452     sec = r1.second - r2.second;
9453   } else {
9454     min = r2.minute - r1.minute;
9455     sec = r2.second - r1.second;
9456   }
9457 
9458   printf(1, "\n%dm%ds\n", min, sec);
9459 
9460   exit();
9461 }
9462 
9463 
9464 
9465 
9466 
9467 
9468 
9469 
9470 
9471 
9472 
9473 
9474 
9475 
9476 
9477 
9478 
9479 
9480 
9481 
9482 
9483 
9484 
9485 
9486 
9487 
9488 
9489 
9490 
9491 
9492 
9493 
9494 
9495 
9496 
9497 
9498 
9499 
