#ifndef UTHTEAD_H
#define UTHREAD_H

#include "ucontext.h"

#define STACK_SIZE 4096
#define MAX_THREADS 3

typedef void (*Func)();
enum ThreadState {FREE, RUNNABLE, RUNNING};


// typedef struct {
//     long ra;
//     long sp;

//     long s0;
//     long s1;
//     long s2;
//     long s3;
//     long s4;
//     long s5;
//     long s6;
//     long s7;
//     long s8;
//     long s9;
//     long s10;
//     long s11;
// } ucontext;

typedef struct uthread_t {
    ucontext ctx;
    Func func;
    void *arg;
    enum ThreadState state;
    char *stack;
}uthread_t;

typedef struct scheduler {
    ucontext ctx;
    int running_thread;
    uthread_t threads[MAX_THREADS];
} scheduler;


void scheduler_init(scheduler *sched);
int uthread_create(scheduler *sched, Func func);
void run(scheduler *schedule);
void uthread_yield(scheduler *schedule);
void uthread_exit(scheduler *schedule);
int getThread(scheduler *schedule);

#endif