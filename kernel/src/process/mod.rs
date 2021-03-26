mod process;
pub mod cpu;
mod context;
mod trapframe;
mod scheduler;
pub use context::*;
pub use trapframe::*;
pub use cpu::*;
pub use process::*;
pub use scheduler::*;


use crate::register::sstatus::{ intr_get, intr_off, intr_on };


// push_off/pop_off are like intr_off()/intr_on() except that they are matched:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

pub unsafe fn push_off(){
    let old  = intr_get();

    intr_off();
    let mut my_cpu = CPU_MANAGER.mycpu();
    if my_cpu.noff == 0 {
        my_cpu.intena = old as usize;
    }

    my_cpu.noff += 1;
}

pub unsafe fn pop_off(){
    let mut my_cpu = CPU_MANAGER.mycpu();

    if intr_get(){
        panic!("pop_off - interruptible");
    }

    if my_cpu.noff < 1{
        panic!("pop_off");
    }

    my_cpu.noff -= 1;
    if my_cpu.noff == 0 && my_cpu.intena != 0{
        intr_on();
    }
}

