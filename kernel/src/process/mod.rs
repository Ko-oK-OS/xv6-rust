use core::ptr::{ copy_nonoverlapping, NonNull };
use core::mem::size_of;
use alloc::sync::Arc;
use alloc::vec;
use array_macro::array;

use crate::define::fs::{NFILE, ROOTDEV};
use crate::trap::user_trap_ret;
use crate::fs::{ LOG, ICACHE, init };
use crate::syscall::SysResult;


pub mod cpu;
mod context;
mod trapframe;
mod manager;
mod elf;
mod process;
pub use context::*;
pub use trapframe::*;
pub use cpu::*;
pub use process::*;
pub use manager::*;
pub use elf::*;

static INITCODE: [u8; 51] = [
    0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x05, 0x02, 0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x05, 0x02,
    0x9d, 0x48, 0x73, 0x00, 0x00, 0x00, 0x89, 0x48, 0x73, 0x00, 0x00, 0x00, 0xef, 0xf0, 0xbf, 0xff,
    0x2f, 0x69, 0x6e, 0x69, 0x74, 0x00, 0x00, 0x01, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00,
];

/// Exit the current process. Does not return. 
/// An exited process remains in the zombie state
/// until its parent calls wait()
pub unsafe fn exit(status: i32) {
    let my_proc = CPU_MANAGER.myproc().unwrap();

    // TODO: initproc

    // Get extern data in current process. 
    let pdata = my_proc.data.get_mut();

    // Close all open files
    for f in pdata.open_files.iter_mut() {
        f.take();
    }
    pdata.open_files = array![_ => None; NFILE];

    LOG.begin_op();
    // extern_data.cwd.as_ref().unwrap().put();
    // ICACHE.put(extern_data.cwd.as_ref());
    drop(pdata.cwd.as_mut());
    LOG.end_op();
    pdata.cwd = None;

    let wait_guard = PROC_MANAGER.wait_lock.acquire();
    // TODO: Give any children to init
    
    // Parent might be sleeping in wait(). 
    PROC_MANAGER.wake_up(pdata.parent.unwrap() as usize);

    let mut guard = my_proc.meta.acquire();

    guard.set_state(ProcState::ZOMBIE);
    guard.xstate = status as usize;
    
    drop(guard);

    drop(wait_guard);

    // Jump into scheduler, never to return. 
    CPU_MANAGER.scheduler();
    panic!("zombine exit");



}

/// A fork child's very first scheduling by scheduler()
/// will switch to forkret.
/// 
/// Need to be handled carefully, because CPU use ra to jump here
unsafe fn fork_ret() -> ! {
    static mut FIRST: bool = true;
    
    // Still holding p->lock from scheduler
    CPU_MANAGER.myproc().unwrap().meta.release();
    
    if FIRST {
        // File system initialization
        FIRST = false;
        init(ROOTDEV);
    }
    println!("user trap return");
    user_trap_ret();
}


