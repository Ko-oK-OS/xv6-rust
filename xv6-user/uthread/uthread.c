#include "uthread.h"
#include "include/types.h"
#include "include/stat.h"
#include "user.h"

extern void uswtch(ucontext *o, ucontext *n);

void scheduler_init(scheduler *sched){
    printf("scheduler init\n");
    int i = 0;
    for(i = 0; i < MAX_THREADS; i++){
        sched->threads[i].state = FREE;
    }
}

int getThread(scheduler *schedule){
    int id = -1;
    for(id = 0; id < MAX_THREADS; id++){
        if(schedule->threads[id].state == RUNNABLE){
            return id;
        }
    }
    return id;
}


int uthread_create(scheduler *sched, Func func){
    int id = 0;
    for(id = 0; id < MAX_THREADS; id++){
        if(sched->threads[id].state == FREE){
            break;
        }
    }

    if(id >= MAX_THREADS){
        return -1;
    }

    uthread_t *t = &(sched->threads[id]);

    
    t->func = func;
    // t->arg = arg;
    char *stack = malloc(4096);
    t->stack = stack;

    t->state = RUNNABLE;

    ucontext *ctx = &t->ctx;
    ctx->ra = (long)func;
    ctx->sp = (long)(stack) + STACK_SIZE - 1;

    printf("In create, id %x, func %x, stack %x\n", id, (long)func, (long)stack);

    return id;
}

void runScheduler(scheduler *schedule){
    // while(1){
        
    //     volatile int start = -1;
    //     volatile int i = 0;
    //     volatile int exitFlag = 0;
    //     for(i = 0; i < MAX_THREADS; i++){
    //         if(start == i){
    //             exitFlag = 1;
    //             break;
    //         }
    //         if(schedule->threads[i].state != RUNNABLE){
    //             continue;
    //         }
    //         printf("ss");
    //         start = i;
    //         uthread_t *t = &(schedule->threads[i]);
    //         printf("id %x, func %x, stack %x\n", i, (long)t->func, (long)t->stack);
    //         printf("ra %x, sp %x\n", (long)t->ctx.ra, (long)t->ctx.sp);
    //         schedule->running_thread = i;
    //         uswtch(&schedule->ctx, &t->ctx);
    //         schedule->running_thread = -1;
    //     }

    //     if(exitFlag){
    //         break;
    //     }
    // }

    while(1){
        if(isFinished(schedule)){
            break;
        }else{
            int i = 0;
            for(i = 0; i < MAX_THREADS; i++){
                if(schedule->threads[i].state == RUNNABLE){
                    break;
                }
            }
            uthread_t *t = &(schedule->threads[i]);
            schedule->running_thread = i;
            uswtch(&schedule->ctx, &t->ctx);
            schedule->running_thread = -1;
            printf("***\n");
        }
    }
}

int isFinished(scheduler *s){
    int i = 0;
    for(i = 0; i < MAX_THREADS; i++){
        if(s->threads[i].state != FREE){
            return 0;
        }
    }
    return 1;
}

void uthread_yield(scheduler *schedule){
    int id = schedule->running_thread;
    uthread_t *t = &(schedule->threads[id]);
    t->state = RUNNABLE;
    swapcontext(&t->ctx, &schedule->ctx);
}

void uthread_exit(scheduler *schedule){
    printf("uthread_exit\n");
    int id = schedule->running_thread;
    uthread_t *t = &(schedule->threads[id]);
    t->state = FREE;
    setcontext(&schedule->ctx);
}

