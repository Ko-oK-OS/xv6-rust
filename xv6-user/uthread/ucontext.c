#include "ucontext.h"


void swapcontext(ucontext *o, ucontext *n){
    // ((void (*)(ucontext*)))getcontext(o);
    // ((void (*)(ucontext*)))setcontext(n);

    getcontext(o);
    setcontext(n);
}

void makecontext(ucontext *ctx, long func, long stack){
    ctx->ra = (long)func;
    ctx->sp = (long)stack;
}