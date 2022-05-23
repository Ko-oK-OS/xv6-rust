#include "include/types.h"
#include "include/stat.h"
#include "user.h"

int main(){
    void *p = malloc(16);
    char *pp = (char*)p;

    for(int i = 0; i < 15; i++){
        pp[i] = 'r';
    }
    pp[15] = 0;

    printf("%s", pp);

    free(p);

    exit(0);
}