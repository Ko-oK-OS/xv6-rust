#include "include/types.h"
#include "include/fcntl.h"
#include "user.h"

int main(int argc, char **argv)
{
	if (argc != 2){
        printf("Usage: %s <file>\n", argv[0]);
        exit(-1);
    }

	char *f = argv[1];
	int fd;
	fd = open(f, O_CREATE);
	if (fd < 0){
        printf("Open %s fail.\n", f);
        exit(-1);
    }
    fd = close(fd);
    if(fd){
        printf("Close %s fail.\n", f);
        exit(-1);
    }
	exit(0);
}