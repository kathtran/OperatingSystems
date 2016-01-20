#include "types.h"
#include "user.h"
#include "date.h"
#include "syscall.h"

#define MAXARGS 20

void _testdate();
void _testsimpletime(char *input);

// user program that runs tests
int
main(int argc, char *argv[]) {

  // testing date system call
  printf(1, "<--- STARTING TESTS FOR _DATE --->\n");

  printf(1, "RUNNING DATE_SYSCALL_TEST\n");
  _testdate();
  printf(1, "<--- TEST FOR DATE RAN SUCCESSFULLY --->\n\n");

  // testing simpletime command
  printf(1, "<--- STARTING TESTS FOR _SIMPLETIME --->\n");

  printf(1, "RUNNING TIME_CMD_TEST_DATE\n");
  _testsimpletime("date");
  printf(1, "TIME_CMD_TEST_DATE OK\n");

  printf(1, "RUNNING TIME_CMD_TEST_LS\n");
  _testsimpletime("ls");
  printf(1, "TIME_CMD_TEST_LS OK\n");

  printf(1, "RUNNING TIME_CMD_TEST_TOOMANYARGS\n");
  _testsimpletime("toomanyargs");
  printf(1, "TIME_CMD_TEST_TOOMANYARGS OK\n");

  printf(1, "RUNNING TIME_CMD_TEST_INVALIDARGS\n");
  _testsimpletime("testinvalidcommand");
  printf(1, "TIME_CMD_TEST_INVALIDARGS OK\n");

  printf(1, "<--- TESTS FOR SIMPLETIME RAN SUCCESSFULLY --->\n");

  exit();
}

// function to run date system call
void
_testdate() {
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
}

// function to run simpletime command
void
_testsimpletime(char *input) {
  char *argv[1];
  argv[0] = "placeholder";  

  if (!strcmp(input, "date")) {
    exec("simpletime date", argv); 
  } else if (!strcmp(input, "ls")) {
    exec("simpletime ls", argv); 
  } else if (!strcmp(input, "toomanyargs")) {
    exec("simpletime 1 2 3 4 5 6 7 8 9 10 1 2 3 4 5 6 7 8 9 10 1", argv);
  } else if (!strcmp(input, "testinvalidcommand")) {
    exec("simpletime test", argv);
  } else
    exit();
}
