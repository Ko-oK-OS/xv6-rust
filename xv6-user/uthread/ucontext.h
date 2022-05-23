#ifndef UCONTEXT_H
#define UCONTEXT_H




// typedef struct {
//     void *sp;
//     // int ss_flags;
//     long size;
// } stack_t;

// typedef struct {
//     long gregset[14];
// } mcontext_t;

// typedef struct ucontext_t {
//     struct ucontext_t *uc_link;
//     stack_t uc_stack;
// } ucontext_t;

typedef struct {
    long ra;
    long sp;

    long s0;
    long s1;
    long s2;
    long s3;
    long s4;
    long s5;
    long s6;
    long s7;
    long s8;
    long s9;
    long s10;
    long s11;
} ucontext;

// extern char getcontext[];
// extern char setcontext[];

extern void getcontext(ucontext *ctx);
extern void setcontext(ucontext *ctx);

void swapcontext(ucontext *o, ucontext *n);
void makecontext(ucontext *ctx, long func, long stack);



#endif