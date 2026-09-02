use crate::arch::riscv::register::sstatus;
use crate::trap::user_trap_ret;


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
pub unsafe fn exit(status: i32) -> ! {
    let my_proc = CPU_MANAGER.myproc().unwrap();

    // Faults and kill checks arrive through this path rather than sys_exit.
    // Route both leaders and secondary threads through the shared manager
    // implementation so killed leaders also stop and reap their thread group.
    if my_proc.is_user_thread() {
        PROC_MANAGER.thread_exit(status as usize)
    } else {
        PROC_MANAGER.exit(status as usize)
    }
}

/// A fork child's very first scheduling by scheduler()
/// will switch to forkret.
/// 
/// Need to be handled carefully, because CPU use ra to jump here
unsafe fn fork_ret() -> ! {
    // Still holding p->lock from scheduler
    CPU_MANAGER.myproc().unwrap().meta.release();
    // println!("user trap return");
    user_trap_ret();
}

/// First instruction executed by a newly scheduled system thread.
unsafe fn system_thread_bootstrap() -> ! {
    let entry = {
        let proc = CPU_MANAGER.myproc().expect("system thread has no process");
        let entry = (&*proc.data.get())
            .system_thread_entry
            .expect("system thread has no entry");
        // scheduler() switched with this lock held. Release it before the
        // entry can sleep, yield, or acquire other process locks.
        proc.meta.release();
        entry
    };

    sstatus::intr_on();
    entry();
    system_thread_exit();
}

/// Return control to the scheduler; it owns final slot reclamation.
unsafe fn system_thread_exit() -> ! {
    let proc = CPU_MANAGER.myproc().expect("system thread has no process");
    let context = (&mut *proc.data.get()).get_context_mut();
    let mut guard = proc.meta.acquire();
    guard.set_state(ProcState::ZOMBIE);
    guard = CPU_MANAGER.mycpu().sched(guard, context);
    drop(guard);
    panic!("a completed system thread was scheduled again");
}
