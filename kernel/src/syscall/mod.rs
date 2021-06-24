mod sysproc;
mod sysnet;
mod sysfile;
pub use sysproc::*;
pub use sysnet::*;
pub use sysfile::*;

use crate::{println, process::*};
use crate::fs::VFS;

use core::mem::size_of;

type SyscallFn = fn() -> isize;

pub const SYSCALL_NUM:usize = 1;

pub static SYSCALL:[SyscallFn; SYSCALL_NUM] = [
    sys_fork
];


// Fetch the uint64 at addr from the current process.
pub fn fetchaddr(addr: usize, arg: *mut u8, len: usize) -> Result<(), &'static str> {
    let my_proc = unsafe{ CPU_MANAGER.myproc().unwrap() };
    let extern_data = my_proc.extern_data.get_mut(); 

    if addr > extern_data.size || addr + size_of::<usize>() > extern_data.size {
        return Err("addr size is out of process!");
    }

    let pg = extern_data.pagetable.as_mut().unwrap();

    if pg.copy_in(arg, addr, len).is_err() {
        return Err("Fail copy data from pagetable!")
    }
    
    
    Ok(())
}


// Fetch the syscall arguments
pub fn argraw(id: usize) -> Result<usize, &'static str> {
    let tf = unsafe{
        &mut *CPU_MANAGER.myproc().unwrap().
        extern_data.get_mut().trapframe
    };

    match id {
        0 => { Ok(tf.a0) }

        1 => { Ok(tf.a1) }

        2 => { Ok(tf.a2) }

        3 => { Ok(tf.a3) }

        4 => { Ok(tf.a4) }

        5 => { Ok(tf.a5) }

        _ => {
            panic!("argraw(): cannot get arguments out of limit!");
        }
    }
}

// Fetch the nth arguments in current syscall
pub fn argint(id: usize, arg: &mut usize) -> Result<(), &'static str> {
    // get arguments by call argraw
    *arg = argraw(id).unwrap();
    Ok(())
}

pub fn argfd(id: usize, pfd: &mut usize, pfs: &mut VFS) -> Result<(), &'static str> {
    Ok(())
}

pub unsafe fn syscall() {
    let my_proc = CPU_MANAGER.myproc().unwrap();

    let extern_data = my_proc.extern_data.get_mut();
    let tf = &mut *extern_data.trapframe;
    let id = tf.a7;

    if id > 0 && id < SYSCALL_NUM {
        tf.a0 = SYSCALL[id]() as usize;
    }else {
        let guard = my_proc.data.acquire();
        let pid = guard.pid;
        drop(guard);
        println!("{} {}: Unknown syscall {}", pid, extern_data.name, id);
        // use max usize mean syscall failure
        tf.a0 = 2^64-1;
    }
}