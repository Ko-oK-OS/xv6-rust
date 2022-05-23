#include "include/types.h"
#include "include/stat.h"
#include "user.h"

int main(){

    int fd = mkfifo("TEST");

    char* buf = "Hello, World!";
    fifo_write(fd, buf, 14);


    printf("Write Finished\n");
    exit(0);
}