#include "include/types.h"
#include "include/fcntl.h"
#include "user.h"


int main(){
    int id = msg_alloc("MSG");

    printf("Process 1, send msg: Hello World\n");
    msg_send(id, "Hello World", 12);


    return 0;
}