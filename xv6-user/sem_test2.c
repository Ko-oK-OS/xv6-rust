#include "include/types.h"
#include "include/fcntl.h"
#include "user.h"

int main(){
    int id = sem_get(36);
    // sem_init(id, 2);

    sem_up(id);


    
    fprintf(1, "[sem_test2 exit]\n");
    exit(0);
}