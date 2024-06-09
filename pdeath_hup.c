#include <assert.h>
#include <signal.h>
#include <stdio.h>
#include <sys/prctl.h>
#include <unistd.h>

int main(int argc, char *const *argv) {
  if (argc <= 1) {
    puts("There must be a command to run");
    return 1;
  }

  int err = prctl(PR_SET_PDEATHSIG, SIGHUP);
  assert(err == 0);  /* The only possible error could be EINVAL */

  (void)execvp(argv[1], argv + 1);

  perror("pdeath_hup");
  return 2;
}
