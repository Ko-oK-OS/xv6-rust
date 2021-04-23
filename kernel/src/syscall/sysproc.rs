use crate::process::*;

pub fn sys_fork() -> isize {
    unsafe{
        fork()
    }
}

// pub fn sys_exit() -> isize {

// }