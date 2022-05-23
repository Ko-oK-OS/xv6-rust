#include "include/types.h"
#include "include/stat.h"
#include "include/param.h"
#include "user.h"

#define PGSIZE 4096
int thread_create(void (*start_routine)(void *)){
  void *stack;

  // printf("In thread.c, start malloc\n");gi
  stack = malloc(4096);
  printf("In thread.c, func: %d, stack: %d\n", (long)start_routine, (long)stack);
  printf("the size of long is %d\n", sizeof(long));

  int ret = clone(start_routine, stack);

  // for(int i = 0; i < 100000; i++);

  printf("In thread the ret is %d\n", ret);
  return ret;
}

int thread_join(){
    long stack;
    printf("In thread_join the stack varible addr is %d", (long)&stack);
    int ret = join(&stack);

    printf("In thread.c the stack address is %d, the ret is %d\n", stack, ret);

    // free((void*)stack);
    return 0;
}