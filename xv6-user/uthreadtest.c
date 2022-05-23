#include "uthread/uthread.h"
#include "include/types.h"
#include "include/fcntl.h"
#include "user.h"

scheduler s;

void func1(){
    printf("func1 exec\n");

    uthread_exit(&s);
}

void func2(){
    printf("func2 exec\n");
    uthread_exit(&s);
}

// void print(){
//     printf("Function print exec!!!  the num is %x", *(int*)arg);

//     while(1);
// }

int main(){

    /*Test get set context*/


    // volatile int cnt = 0;    
    // ucontext ctx1, ctx2;

    // getcontext(&ctx1);
    // printf("CTX1\n");
    // getcontext(&ctx2);
    // printf("CTX2\n");

    // if(cnt == 0){
    //     cnt++;
    //     swapcontext(&ctx1, &ctx2);
    // }

    

    // ucontext ctx;
    // ctx.ra = (long)&func1;
    // void *stack = malloc(4096);
    // ctx.sp = (long)stack + 4096 - 1;

    // setcontext(&ctx);

    // printf("Finish\n");
    


    printf("haha\n");
    scheduler_init(&s);

    uthread_create(&s, func1);
    uthread_create(&s, func2);

    // int id = getThread(&s);
    // uthread_t *t = &(s.threads[id]);

    // printf("%x %x", t->ctx.ra, t->ctx.sp);

    // setcontext(&t->ctx);
    runScheduler(&s);

    exit(0);
}