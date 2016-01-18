#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <string.h>
#include <time.h>

#define MAXARGS 20

int
main(int argc, char ∗argv[]) {
  int i, status;
  char ∗p[MAXARGS];
  struct timespec t1 , t2 ;
  pid t pid;

  if (argc > (MAXARGS−1)) { // we count from 0
    fprintf(stderr , ”Error: too many args\n”);
    return EXIT FAILURE;
  }

  for (i=0; i<argc−1; i++) {
    p[i] = strdup(argv[i+1]);
  }
p[i] =NULL;
if (clock gettime(CLOCKREALTIME, &t1) != 0) { fprintf(stderr ,
”clock gettime failed at line %d\n”, LINE ); return EXIT FAILURE;
}
pid = fork (); if (pid < 0) {
fprintf(stderr , ”fork() failed\n”); return EXIT FAILURE;
} else if (pid == 0) { // child execv(p[0] , p);
fprintf(stderr ,
”Error: execv failed . %s probably needs full path\n”, p[0]); return EXIT FAILURE;
} else {
waitpid(pid, &status, 0);
if (clock gettime(CLOCKREALTIME, &t2) != 0) {
fprintf(stderr , ”clock gettime failed at line %d\n”, LINE ); return EXIT FAILURE;
} }
long tmp1 , tmp2 ;
if (t1.tv nsec > t2.tv nsec){ tmp1 = t2.tv sec−t1.tv sec−1; tmp2 = t1.tv nsec − t2.tv nsec;
                                             }
4
else {
tmp1 = t2.tv sec−t1.tv sec; tmp2 = t2.tv nsec − t1.tv nsec;
}
printf(”%02ld.%2ld seconds\n”, tmp1, tmp2/100000);
return EXIT SUCCESS; }
