use core::ptr::{ copy_nonoverlapping, NonNull };
use core::mem::size_of;
use alloc::sync::Arc;
use alloc::vec;

use crate::fs;
use crate::define::fs::ROOTDEV;
use crate::interrupt::trap::usertrap_ret;
use crate::fs::LOG;


pub mod cpu;
mod context;
mod trapframe;
mod scheduler;
mod elf;
mod process;
pub use context::*;
pub use trapframe::*;
pub use cpu::*;
pub use process::*;
pub use scheduler::*;
pub use elf::*;

static INITCODE: [u8; 52] = [
    0x17, 0x05, 0x00, 0x00, 0x13, 0x05, 0x45, 0x02,
    0x97, 0x05, 0x00, 0x00, 0x93, 0x85, 0x35, 0x02,
    0x93, 0x08, 0x70, 0x00, 0x73, 0x00, 0x00, 0x00,
    0x93, 0x08, 0x20, 0x00, 0x73, 0x00, 0x00, 0x00,
    0xef, 0xf0, 0x9f, 0xff, 0x2f, 0x69, 0x6e, 0x69,
    0x74, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00
];

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.

pub unsafe fn fork() -> isize {
    let my_proc = CPU_MANAGER.myproc().expect("Fail to get my cpu");

    // ALLOCATE process
    if let Some(other_proc) = PROC_MANAGER.alloc_proc() {
        let guard = other_proc.data.acquire();
        let extern_data = my_proc.extern_data.get_mut();
        let other_extern_data = other_proc.extern_data.get_mut();

        // Copy user memory from parent to child

        match extern_data.pagetable.as_mut().unwrap().uvmcopy(
            other_extern_data.pagetable.as_mut().unwrap(),
            extern_data.size
        ) {
            Ok(_) => {
                println!("Success to copy data from user");
            }

            Err(err) => {
                panic!("fork(): -> uvmcopy(): fail to copy data from user\nerr: {}", err);
            }
        }

        // Copy saved user register;
        copy_nonoverlapping(
            extern_data.trapframe, 
            other_extern_data.trapframe, 
            1
        );

        // Cause fork to return 0 in the child
        let tf = &mut *other_extern_data.trapframe;
        tf.a0 = 0;

        // increment reference counts on open file descriptions
        for f in extern_data.ofile.iter_mut() {
            f.borrow_mut().dup();
            let other_f = f.clone();
            other_extern_data.ofile.push(other_f);
        }

        other_extern_data.set_name(extern_data.name);

        let pid = guard.pid as isize;
        drop(guard);

        WAIT_LOCK.acquire();
        other_extern_data.parent = NonNull::new(my_proc as *mut Process);
        WAIT_LOCK.release();

        let mut guard = other_proc.data.acquire();
        guard.set_state(Procstate::RUNNABLE);
        drop(guard);

        return pid

    }

    -1
}


/// Exit the current process. Does not return. 
/// An exited process remains in the zombie state
/// until its parent calls wait()
pub unsafe fn exit(status: i32) {
    let my_proc = CPU_MANAGER.myproc().unwrap();

    // TODO: initproc

    // Get extern data in current process. 
    let extern_data = my_proc.extern_data.get_mut();

    // Close all open files
    for f in extern_data.ofile.iter_mut() {
        f.borrow_mut().close();
    }
    extern_data.ofile = vec![];

    LOG.begin_op();
    extern_data.cwd.as_ref().unwrap().put();
    LOG.end_op();
    extern_data.cwd = None;

    let wait_guard = WAIT_LOCK.acquire();
    // TODO: Give any children to init
    
    // Parent might be sleeping in wait(). 
    PROC_MANAGER.wakeup(extern_data.parent.unwrap().as_ptr() as usize);

    let mut guard = my_proc.data.acquire();

    guard.set_state(Procstate::ZOMBIE);
    guard.xstate = status as usize;
    
    drop(guard);

    drop(wait_guard);

    // Jump into scheduler, never to return. 
    scheduler();
    panic!("zombine exit");



}

/// A fork child's very first scheduling by scheduler()
/// will swtch to forkret.
/// 
/// Need to be handled carefully, because CPU use ra to jump here
unsafe fn fork_ret() -> ! {
    static mut FIRST: bool = true;
    
    // Still holding p->lock from scheduler
    CPU_MANAGER.myproc().unwrap().data.release();
    
    if FIRST {
        // File system initialization
        FIRST = false;
        fs::init(ROOTDEV);
    }

    usertrap_ret();
}
