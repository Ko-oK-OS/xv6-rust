#include "include/types.h"
#include "include/stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
  char byte = 0;
  struct stat stat;

  if(dup(-1) != -1 ||
     read(-1, &byte, 1) != -1 ||
     write(-1, &byte, 1) != -1 ||
     close(-1) != -1 ||
     fstat(-1, &stat) != -1){
    printf("bad fd test failed\n");
    exit(1);
  }

  printf("bad fd test OK\n");
  exit(0);
}
