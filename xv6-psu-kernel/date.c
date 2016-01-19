#include "types.h"
#include "user.h"
#include "date.h"

int
main(int argc, char *argv[])
{
  struct rtcdate r;

  if (date(&r)) {
    printf(2, "date_failed\n");
    exit();
  }

  char *months[] = {
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  };

  printf(1, "%s %d %d:%d:%d UTC %d\n",
         months[r.month-1], r.day, r.hour, r.minute, r.second, r.year);

  exit();
}
