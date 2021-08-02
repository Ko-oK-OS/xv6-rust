#![no_std]
#![no_main]

use user::{
    fork,
    open,
    mknod,
    dup,
    exit,
    exec,
    wait,
    O_RDWR,
    CONSOLE,
    println
};


#[no_mangle]
fn main() {
    println!("Hello init");
    let argv = &["sh".as_ptr(), 0 as *const u8];
    let mut pid;
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
            // this call to wait() returns if the shell exits,
            // or if a parentless process exits.
            let wpid : isize = wait(0 as *mut u8 as isize);
            if wpid == pid {
                break;
            }else if wpid < 0 {
                //error
                exit(1);
            }else {
                //do nothing
            }
            
        }
    }
}
