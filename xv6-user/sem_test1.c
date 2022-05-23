#include "include/types.h"
#include "include/fcntl.h"
#include "user.h"

int main(){
    int id = sem_get(-1);
    sem_init(id, 2);

    sem_down(id);
    sem_down(id);
    sem_down(id);

    int i = 0;
    for(; i < 1000; i++){};
    fprintf(1, "[sem_test1 exit]\n");
    for(; i < 1000; i++){};
    exit(0);
}