#include "include/types.h"
#include "include/fcntl.h"
#include "user.h"



int main(){
    int shmid;
    char *shmaddr;
    int pid;

    shmid = shm_get("Test", 4096, 0);

    printf("In shmtest2 the id is %x\n", shmid);
    // if(shmid < 0){
    //     printf("In shmget, shmid < 1\n");
    //     return -1;
    // }

    // printf("Process2 The shm has get\n");


    // printf(1, "********\n");
    // shmaddr = (char*)shm_map(shmid, 0, 0);
    // if(shmaddr == 0){
    //     printf(2, "In shmat, shmaddr is NULL\n");
    // }
    // printf(1, "PID0, the shmaddr is %x\n", (uint)shmaddr);
    // strcpy(shmaddr, "abcdefg");
    // printf(1, "SHMTEST : here 1\n");
    // shm_unmap(shmaddr);
    // printf(1, "SHMTEST : here 2\n");


    
    // printf("###########\n");
    shmaddr = (char*)shm_map(shmid, (long)0, 0);
    printf("Process 2, the shm addr is %x, and the content is %s\n", (long)shmaddr, shmaddr);
    
    printf("Process 2, FINISH\n");
    shm_unmap(shmaddr);
    shm_put(shmid);
    
    return 0;
}