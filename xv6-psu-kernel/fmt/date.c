9350 #include "types.h"
9351 #include "user.h"
9352 #include "date.h"
9353 
9354 int
9355 main(int argc, char *argv[])
9356 {
9357   struct rtcdate r;
9358 
9359   if (date(&r)) {
9360     printf(2, "date_failed\n");
9361     exit();
9362   }
9363 
9364   char *months[] = {
9365     "Jan",
9366     "Feb",
9367     "Mar",
9368     "Apr",
9369     "May",
9370     "Jun",
9371     "Jul",
9372     "Aug",
9373     "Sep",
9374     "Oct",
9375     "Nov",
9376     "Dec"
9377   };
9378 
9379   printf(1, "%s %d %d:%d:%d UTC %d\n",
9380          months[r.month-1], r.day, r.hour, r.minute, r.second, r.year);
9381 
9382   exit();
9383 }
9384 
9385 
9386 
9387 
9388 
9389 
9390 
9391 
9392 
9393 
9394 
9395 
9396 
9397 
9398 
9399 
