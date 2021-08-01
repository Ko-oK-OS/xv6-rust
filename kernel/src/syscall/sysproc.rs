use crate::process::*;
use super::*;

pub fn sys_fork() -> SysResult {
    unsafe {
        fork()
    }
}

pub fn sys_getpid() -> SysResult {
    let my_proc = unsafe{ CPU_MANAGER.myproc().unwrap() };
    let proc_data= my_proc.data.acquire();
    let pid = proc_data.pid;
    drop(proc_data);
    Ok(pid)
}


pub fn sys_sbrk() -> SysResult {
    let mut size: usize = 0;

    // get syscall argument
    arg_int(0, &mut size)?;

    let my_proc = unsafe{ CPU_MANAGER.myproc().unwrap() };
    let addr = my_proc.extern_data.get_mut().size;
    match my_proc.grow_proc(size as isize) {
        Ok(()) => {
            return Ok(addr)
        }

        Err(err) => {
            panic!("err: {:?}", err);
        }
    }

    
}

// pub fn sys_sleep() -> usize {

// }