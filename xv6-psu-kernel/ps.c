#include "types.h"
#include "user.h"
#include "uproc.h"

#define MAX 10

int
main(int argc, char *argv[])
{
  struct uproc table[MAX];
  int rc = getprocs(MAX, table);
  int i;

  if (rc < 0) {
    printf(2, "getprocs_failed\n");
    exit();
  }

  for (i = 0; i < rc; i++) {
    printf(1, "PID: %d  UID: %d  GID: %d  PPID: %d\nSTATE: %s  SIZE: %d  NAME: %s  PRIORITY: %d\n",
           table[i].pid, table[i].uid, table[i].gid, table[i].ppid,
           table[i].state, table[i].sz, table[i].name, table[i].priority);
  }

  exit();
}
