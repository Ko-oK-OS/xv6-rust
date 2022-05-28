#include "include/types.h"
#include "include/fcntl.h"
#include "user.h"

int main(){
    int id = msg_get("MSG");

    char buf[16];

    msg_recv(id, (void*)buf, 12);


    printf("%s\n", buf);

    printf("msg test OK!\n");

    return 0;
}