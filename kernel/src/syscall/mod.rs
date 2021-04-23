mod sysproc;
pub use sysproc::*;

use crate::{println, process::*};

type syscall_fn = fn() -> isize;

pub const SYSCALL_NUM:usize = 1;

pub static SYSCALL:[syscall_fn; SYSCALL_NUM] = [
    sys_fork
];

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
        tf.a0 = 2^64-1;
    }
}