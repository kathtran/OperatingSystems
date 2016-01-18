#include "types.h"
#include "user.h"
#include "date.h"

#define MAXARGS 20

int
main(int argc, char *argv[]) {
  int i;
  char *p[MAXARGS];
  struct rtcdate r1, r2;
  int pid;

  if (argc >= (MAXARGS)) {  // we count from 0
    printf(2, "Error: too many args\n");
    exit();
  }

  for (i=0; i<argc-1; i++) {
    p[i] = strcpy(p[i], argv[i+1]);
  }
  p[i] = '\0';

  if (date(&r1) != 0) {
    printf(2, "sys_date failed\n");
    exit();
  }

  pid = fork();
  if (pid < 0) {
    printf(2, "fork() failed\n");
    exit();
  } else if (pid == 0) {  // child
    exec(p[0], p);
    printf(2, "Error: exec failed. %s probably needs full path\n", p[0]);
    exit();
  } else {                // parent
    wait();
    if (date(&r2) != 0) {
      printf(2, "date failed");
      exit();
    }
  }

  uint min, sec;

  if (r1.second > r2.second) {
    min = r2.minute - r1.minute - 1;
    sec = r1.second - r2.second;
  } else {
    min = r2.minute - r1.minute;
    sec = r2.second - r1.second;
  }

  printf(1, "\n%dm%ds\n", min, sec);

  exit();
}
