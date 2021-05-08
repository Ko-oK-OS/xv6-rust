mod sysproc;
mod sysnet;
pub use sysproc::*;
pub use sysnet::*;

use crate::{println, process::*};

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
pub fn argraw(id: usize) -> usize {
    let tf = unsafe{
        &mut *CPU_MANAGER.myproc().unwrap().
        extern_data.get_mut().trapframe
    };

    match id {
        0 => { tf.a0 }

        1 => { tf.a1 }

        2 => { tf.a2 }

        3 => { tf.a3 }

        4 => { tf.a4 }

        5 => { tf.a5 }

        _ => {
            panic!("argraw(): cannot get arguments out of limit!");
        }
    }
}

// Fetch the nth arguments in current syscall
pub fn argint(id: usize, arg: &mut usize) -> usize {
    // get arguments by call argraw
    *arg = argraw(id);
    0
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