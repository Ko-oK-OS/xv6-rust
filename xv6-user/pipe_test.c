#include "include/types.h"
#include "include/stat.h"
#include "user.h"

int main(){
    int p[2];
    
    pipe(p);
    const char* str = "hello";

    printf("%x   %x\n", p[0], p[1]);

    
    
    if(fork() == 0){
   
        printf("***** %d \n", (long)str);

        close(1);
        dup(p[1]);

        close(p[0]);
        close(p[1]);

        
        
        write(1, str, 6);

        

        printf("child exit\n");

        return 1;
    }else{
        wait(0);

        char buf[6];
        close(0);
        dup(p[0]);
      

        close(p[0]);
        close(p[1]);

        read(0, buf, 6);

        printf("$$$$$ %s \n", buf);

        printf("parent exit\n");

        return 2;
    }
}