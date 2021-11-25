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
use core::str::from_utf8;
use alloc::sync::Arc;

type SyscallFn = fn() -> SysResult;

pub const SYSCALL_NUM:usize = 21;

pub static SYSCALL:[SyscallFn; SYSCALL_NUM] = [
    sys_fork,
    sys_exit,
    sys_wait,
    sys_pipe,
    sys_read,
    sys_kill,
    sys_exec,
    sys_fstat,
    sys_chdir,
    sys_dup,
    sys_getpid,
    sys_sbrk,
    sys_sleep,
    sys_uptime,
    sys_open,
    sys_write, 
    sys_mknod,
    sys_unlink,
    sys_link, 
    sys_mkdir,
    sys_close
];

pub type SysResult = Result<usize, ()>;


pub const SHUTDOWN: usize = 8;
pub const REBOOT: usize = 9;

#[inline]
pub fn kernel_env_call(
    which: usize,
    arg0: usize,
    arg1: usize,
    arg2: usize,   
) -> usize {
    let mut ret;
    unsafe {
        llvm_asm!("ecall"
            : "={x10}" (ret)
            : "{x10}" (arg0), "{x11}" (arg1), "{x12}" (arg2), "{x17}" (which)
            : "memory"
            : "volatile"
        );
    }
    ret
}


/// Fetch the uint64 at addr from the current process.
pub fn fetch_addr(addr: usize, buf: &mut [u8], len: usize) -> Result<(), ()> {
    let my_proc = unsafe{ CPU_MANAGER.myproc().unwrap() };
    let extern_data = my_proc.extern_data.get_mut(); 

    if addr > extern_data.size || addr + size_of::<usize>() > extern_data.size {
        println!("addr size is out of process!");
        return Err(());
    }

    let pg = extern_data.pagetable.as_mut().unwrap();

    if pg.copy_in(buf.as_mut_ptr(), addr, len).is_err() {
        println!("Fail copy data from pagetable!");
        return Err(())
    }
    
    
    Ok(())
}

/// Fetch the null-terminated string at addr from the current process. 
/// Returns lenght of string, not including null
pub fn fetch_str(addr: usize, buf: &mut [u8], max_len: usize) -> Result<(), ()> {
    let my_proc = unsafe {
        CPU_MANAGER.myproc().unwrap()
    };

    let extern_data = unsafe{ 
        &mut *my_proc.extern_data.get()
    };
    let pgt = extern_data.pagetable.as_mut().unwrap();
    if pgt.copy_in_str(buf.as_mut_ptr(), addr, max_len).is_err() {
        println!("Fail to copy in str");
        return Err(())
    }
    Ok(())

}

/// Fetch the syscall arguments
pub fn arg_raw(id: usize) -> Result<usize, ()> {
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
pub fn arg_int(id: usize, arg: &mut usize) -> Result<(), ()> {
    // get arguments by call argraw
    *arg = arg_raw(id)?;
    Ok(())
}



/// Retrieve an argument as a pointer. 
/// Doesn't check for legality, since
/// copy_in / copy_out will do that. 
pub fn arg_addr(id: usize, ptr: &mut usize) -> Result<(), ()> {
    *ptr = arg_raw(id)?;
    Ok(())
}

/// Fetch the nth word-size system call argument as a file descriptor
/// and return both the descriptor and the corresponding struct file. 
pub fn arg_fd(id: usize, fd: &mut usize) -> Result<(), ()> {
    // Get file descriptor
    arg_int(id, fd)?;
    // Check the fd is valid
    let my_proc = unsafe {
        CPU_MANAGER.myproc().unwrap()
    };
    let extern_data = unsafe{ &mut *my_proc.extern_data.get() };
    let open_files = &mut extern_data.open_files;
    if *fd >= NOFILE || *fd > open_files.len() {
        println!("arg_fd: file decsriptor is invalid");
        return Err(())
    } else {
        // Get file by file descriptor
        // *file = *Arc::clone(&open_files[*fd].unwrap());
        Ok(())
    }
}


/// Fetch the nth word-size system call argument as a null-terminated string. 
/// Copies into buf, at most max. 
/// Returns string length if OK (including null)
pub fn arg_str(id: usize, buf: &mut [u8], max_len: usize) -> Result<(), ()> {
    let mut addr = 0;
    arg_addr(id, &mut addr)?;
    fetch_str(addr, buf, max_len)?;
    Ok(())
}

#[no_mangle]
pub unsafe fn syscall() {
    let my_proc = CPU_MANAGER.myproc().unwrap();

    let extern_data = my_proc.extern_data.get_mut();
    let tf = &mut *extern_data.trapframe;
    let id = tf.a7;

    if id > 0 && id < SYSCALL_NUM {
        // tf.a0 = SYSCALL[id - 1]().expect("Fail to syscall");
        match SYSCALL[id - 1]()  {
            Ok(res) => {
                tf.a0 = res
            }
            Err(()) => {
                tf.a0 = -1 as isize as usize
            }
        }
    }else {
        let guard = my_proc.data.acquire();
        let pid = guard.pid;
        drop(guard);
        println!("{} {}: Unknown syscall {}", pid, from_utf8(&extern_data.name).unwrap(), id);
        // use max usize mean syscall failure
        tf.a0 = -1 as isize as usize
    }
}

pub fn sys_uptime() -> SysResult {
    Ok(0)
}