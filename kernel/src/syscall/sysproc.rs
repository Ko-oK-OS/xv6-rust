use crate::process::*;

pub fn sys_fork() -> isize {
    unsafe{
        fork()
    }
}