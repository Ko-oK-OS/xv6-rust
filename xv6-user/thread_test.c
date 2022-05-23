#include "include/types.h"
#include "include/fcntl.h"
#include "user.h"

// void *func1(void *arg){
//     int num = *(int*)arg;
//     printf("Thread Create Success %d !!!!\n", num);

//     exit(0);
// }

void func1(){
    printf("FUNC1\n");
}

void *func();


int main(){
    printf("Start create thread\n");

    // int num = 9;

    // printf("In thread_test, func: %d\n", (long)&func);
    func1();

    thread_create((void(*)())&func);
    
    thread_join();


    printf("###thread test is success!!!\n");
    exit(0);
   

    

    // printf("^^^^^, parent \n");
    // while(1){
    //     printf("hehe");
    // }
    // for(int i = 0; i < 100000; i++);
    
}


void *func(){
    // int num = *(int*)arg;
    printf("***Thread Function is Executing !!!!\n");

    // while(1){
    //     printf("rand");
    // }
    exit(0);
}