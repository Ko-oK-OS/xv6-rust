mod sysproc;
mod sysnet;
mod sysfile;
pub use sysproc::*;
pub use sysnet::*;
pub use sysfile::*;

use crate::define::fs::NOFILE;
use crate::{println, process::*};
use crate::fs::VFile;

use core::borrow::BorrowMut;
use core::mem::size_of;
use core::ops::IndexMut;

type SyscallFn = fn() -> isize;

pub const SYSCALL_NUM:usize = 1;

pub static SYSCALL:[SyscallFn; SYSCALL_NUM] = [
    sys_fork
];


/// Fetch the uint64 at addr from the current process.
pub fn fetch_addr(addr: usize, buf: &mut [u8], len: usize) -> Result<(), &'static str> {
    let my_proc = unsafe{ CPU_MANAGER.myproc().unwrap() };
    let extern_data = my_proc.extern_data.get_mut(); 

    if addr > extern_data.size || addr + size_of::<usize>() > extern_data.size {
        return Err("addr size is out of process!");
    }

    let pg = extern_data.pagetable.as_mut().unwrap();

    if pg.copy_in(buf.as_mut_ptr(), addr, len).is_err() {
        return Err("Fail copy data from pagetable!")
    }
    
    
    Ok(())
}

/// Fetch the null-terminated string at addr from the current process. 
/// Returns lenght of string, not including null
pub fn fetch_str(addr: usize, buf: &mut [u8], max_len: usize) -> Result<(), &'static str> {
    let my_proc = unsafe {
        CPU_MANAGER.myproc().unwrap()
    };

    let extern_data = unsafe{ 
        &*my_proc.extern_data.get()
    };
    let pgt = extern_data.pagetable.as_ref().unwrap();
    pgt.copy_in_str(buf.as_mut_ptr(), addr, max_len)?;
    Ok(())

}

/// Fetch the syscall arguments
pub fn arg_raw(id: usize) -> Result<usize, &'static str> {
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

/// Fetch the nth arguments in current syscall
pub fn arg_int(id: usize, arg: &mut usize) -> Result<(), &'static str> {
    // get arguments by call argraw
    *arg = arg_raw(id)?;
    Ok(())
}

/// Retrieve an argument as a pointer. 
/// Doesn't check for legality, since
/// copy_in / copy_out will do that. 
pub fn arg_addr(id: usize, ptr: &mut usize) -> Result<(), &'static str> {
    *ptr = arg_raw(id)?;
    Ok(())
}

/// Fetch the nth word-size system call argument as a file descriptor
/// and return both the descriptor and the corresponding struct file. 
pub fn arg_fd(id: usize, fd: &mut usize, file: &mut VFile) -> Result<(), &'static str> {
    // Get file descriptor
    arg_int(id, fd)?;
    // Check the fd is valid
    let my_proc = unsafe {
        CPU_MANAGER.myproc().unwrap()
    };
    let extern_data = unsafe{ &*my_proc.extern_data.get() };
    let open_file = &extern_data.ofile;
    if *fd >= NOFILE || *fd > open_file.len() {
        Err("arg_fd: file decsriptor is invalid")
    } else {
        // Get file by file descriptor
        *file = unsafe{ 
            *open_file[*fd].as_ptr() 
        };
        Ok(())
    }
}


/// Fetch the nth word-size system call argument as a null-terminated string. 
/// Copies into buf, at most max. 
/// Returns string length if OK (including null)
pub fn arg_str(id: usize, buf: &mut [u8], max_len: usize) -> Result<(), &'static str> {
    let mut addr = 0;
    arg_addr(id, &mut addr)?;
    fetch_str(addr, buf, max_len)?;
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