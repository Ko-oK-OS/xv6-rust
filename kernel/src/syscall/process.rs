// syscall about process
use crate::process::*;
use crate::memory::*;
use core::ptr::{ copy_nonoverlapping, NonNull };
use core::mem::size_of;
// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.

pub unsafe fn fork() -> isize {
    let my_proc = CPU_MANAGER.myproc().expect("Fail to get my cpu");

    // ALLOCATE process
    if let Some(other_proc) = PROC_MANAGER.allocproc() {
        let mut guard = other_proc.data.acquire();
        let extern_data = my_proc.extern_data.get_mut();
        let other_extern_data = other_proc.extern_data.get_mut();

        // Copy user memory from parent to child

        extern_data.pagetable.as_mut().unwrap().uvmcopy(
            other_extern_data.pagetable.as_mut().unwrap(),
            extern_data.size
        );

        // Copy saved user register;
        copy_nonoverlapping(
            extern_data.trapframe, 
            other_extern_data.trapframe, 
            size_of::<Trapframe>()
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