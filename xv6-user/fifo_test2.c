#include "include/types.h"
#include "include/stat.h"
#include "user.h"

int main(){
    char buf[14];
    int fd = fifo_get("TEST");

    fifo_read(fd, buf, 14);

    printf("Process 2, read [%s] from fifo", buf);

    fifo_put(fd);

    exit(0);
}