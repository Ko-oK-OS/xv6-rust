#include "include/types.h"
#include "include/stat.h"
#include "user.h"

int main(){
    char buf[14];
    int fd = fifo_get("TEST");
    fifo_read(fd, buf, 14);

    printf("%s", buf);

    fifo_put(fd);

    exit(0);
}