#![no_std]
#![no_main]

use user::{
    fork,
    open,
    close,
    mknod,
    dup,
    exit,
    exec,
    O_RDWR,
    CONSOLE
};


#[no_mangle]
fn main() {
    let pid;
    if open("console", O_RDWR) < 0 {
        mknod("console", CONSOLE, 0);
        open("console", O_RDWR);
    }

    dup(0);
    dup(0);
    loop {
        pid = fork();
        if pid < 0 {
            exit(1);
        }

        if pid == 0 {
            exec("sh", argv);
            exit(1);
        }

        loop {
            let mut temp:isize=0;
            let wpid:isize=wait(&mut temp);
            if wpid==pid {
                break;
            }else if wpid<0 {
                //error
                exit(1);
            }else {
                //do nothing
            }
            
        }
    }
}
