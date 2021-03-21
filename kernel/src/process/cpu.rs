use crate::register::tp;
use crate::define::param::NCPU;
use core::ptr::NonNull;
use super::*;
pub struct CPU{
    pub process:Option<NonNull<Process>>, // The process running on this cpu, or null.
    pub context:Context, // swtch() here to enter scheduler().
    pub noff:usize, // Depth of push_off() nesting.
    pub intena:usize // Were interrupts enabled before push_off()?
}

pub struct CPUManager{
    cpus: [CPU; NCPU]
}

pub static mut CPU_MANAGER:CPUManager = CPUManager::new();

pub unsafe fn cpuid() ->usize{
    let id = tp::read();
    id
}

impl CPUManager{
    pub const fn new() -> Self{
        Self{
            cpus:[CPU::new();NCPU]
        }
    }

    pub fn mycpu(&mut self) -> &mut CPU{
        let cpu_id = cpuid();
        &mut self.cpus[cpu_id]
    }
}

impl CPU{
    pub const fn new() -> Self{
        Self{
            process:None,
            context:Context::new(),
            noff:0,
            intena:0
        }
    }



    pub fn set_proc(&mut self, proc:Option<NonNull<Process>>){
        self.process = proc;
    }

    pub fn get_context_mut(&mut self) -> *mut Context{
        &mut self.context as *mut Context
    }
}