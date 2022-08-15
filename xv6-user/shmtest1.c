#include "include/types.h"
#include "include/fcntl.h"
#include "user.h"

int main(){
    int shmid;
    char *shmaddr;
    int pid;

    shmid = shm_get("Test", 4096, 1);

    printf("In shmtest1 the id is %x\n", shmid);
    // if(shmid < 0){
    //     printf("In shmget, shmid < 1\n");
    //     return -1;
    // }

    // printf("Process1 The shm has get\n");

    // if(pid == 0){
    

    // printf("********\n");
    shmaddr = (char*)shm_map(shmid, (long)0, 0);
    if(shmaddr == 0){
        printf("In shmat, shmaddr is NULL\n");
    }
    printf("Process 1, the shmaddr is %x, and write abcdefg\n", (long)shmaddr);
    strcpy(shmaddr, "abcdefg");
    


    printf("________Start Sleep_________\n");
    
    int i = 0;
    for(int i = 0; i < 1000000; i++);
    // sleep(1000);
    printf("Process 1, FINISH\n");

    shm_unmap(shmid);
    // shm_put(shmid);
       
    // }else{
    //     sleep(3);
    //     printf(1, "###########\n");
    //     shmaddr = (char*)shm_map(shmid, 0, 0);
    //     printf(1, "$$$$$$ %s $$$$$\n", shmaddr);
    //     wait();
    //     shm_put(shmid);
    // }   
    return 0;
}