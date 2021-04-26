use crate::process::*;
use super::*;

pub fn sys_fork() -> isize {
    unsafe{
        fork()
    }
}

// pub fn sys_exit() -> isize {

// }

pub fn sys_sbrk() -> usize {
    let mut size: usize = 0;

    // get syscall argument
    argint(0, &mut size);

    let my_proc = unsafe{ CPU_MANAGER.myproc().unwrap() };
    let addr = my_proc.extern_data.get_mut().size;
    match my_proc.growproc(size as isize) {
        Ok(()) => {
            return addr
        }

        Err(err) => {
            panic!("err: {:?}", err);
        }
    }

    
}