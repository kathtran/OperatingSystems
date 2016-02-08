#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{
  struct uproc *u;
  int max = 20;

  if (getprocs(max, &u)) {
    printf(2, "getprocs_failed\n");
    exit();
  }

  exit();
}
