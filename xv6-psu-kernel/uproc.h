struct uproc {
  int pid;
  uint uid;
  uint gid;
  uint ppid;
  char state[20];
  uint sz;
  char name[20];
  int priority;
};
