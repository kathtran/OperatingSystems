struct uproc {
  int pid;
  uint uid;
  uint gid;
  uint ppid;
  enum procstate state;
  uint sz;
  char *name;
};
