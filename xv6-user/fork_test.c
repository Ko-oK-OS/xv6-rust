#include "include/types.h"
#include "include/stat.h"
#include "user.h"

#define N 1

void
forktest(void)
{
  int n, pid;

  printf("fork test\n");

  for(n=0; n<N; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0){
      printf("I am child\n");
      void * p = malloc(4096);
      free(p);
      exit(0);
      
    }
    
      
  }

  if(n == N){
    // printf("fork claimed to work N times!\n");
    exit(1);
  }

  for(; n > 0; n--){
    if(wait(0) < 0){
    //   printf("wait stopped early\n");
      exit(1);
    }
  }

  if(wait(0) != -1){
    // printf("wait got too many\n");
    exit(1);
  }

  printf("fork test OK\n");
}

int
main(void)
{
  forktest();
  exit(0);
}