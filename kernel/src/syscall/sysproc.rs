use crate::{interrupt::trap::TICKS_LOCK, process::*};
use super::*;

pub fn sys_fork() -> SysResult {
    let ret = unsafe{ fork()? };
    Ok(ret as usize)
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

pub fn sys_exit() -> SysResult {
    let mut status = 0;
    arg_int(0, &mut status)?;
    unsafe {
        PROC_MANAGER.exit(status)
    }
}



pub fn sys_sleep() -> SysResult {
    let mut time_span: usize = 0;
    arg_int(0, &mut time_span)?;

    let mut ticks_guard = unsafe {
        TICKS_LOCK.acquire()
    };
    let now_time = *ticks_guard;
    let mut cur_time = *ticks_guard;
    while cur_time - now_time < time_span {
        let my_proc = unsafe {
            CPU_MANAGER.myproc().expect("Fail to get my procsss")
        };
        if my_proc.killed() {
            drop(ticks_guard);           
            return Err(())
        } else {
            my_proc.sleep(0, ticks_guard);
            ticks_guard = unsafe {
                TICKS_LOCK.acquire()
            }
        }
        cur_time = *ticks_guard;
    }
    drop(ticks_guard);
    Ok(0)
}

pub fn sys_wait() -> SysResult {
    let mut addr = 0;
    arg_addr(0, &mut addr)?;
    println!("[Debug] addr: {}", addr);
    match unsafe {
        PROC_MANAGER.wait(addr)
    } {
        Some(pid) => {
            Ok(pid)
        },

        None => {
            Err(())
        }
    }
}

pub fn sys_kill() -> SysResult {
    let mut pid = 0;
    arg_int(0, &mut pid)?;
    unsafe {
        PROC_MANAGER.kill(pid)
    }
}
