mod process;
pub mod cpu;
mod context;
mod trapframe;
mod scheduler;
mod elf;
pub use context::*;
pub use trapframe::*;
pub use cpu::*;
pub use process::*;
pub use scheduler::*;
pub use elf::*;

use core::ptr::{ copy_nonoverlapping, NonNull };
use core::mem::size_of;


static INITCODE:[u8; 52] = [
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
    if let Some(other_proc) = PROC_MANAGER.allocproc() {
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
        // TODO: file system

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





