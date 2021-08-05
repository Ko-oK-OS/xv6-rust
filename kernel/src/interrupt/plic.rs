use core::ptr;
use core::convert::Into;

use crate::define::memlayout::{self, plic_sclaim, PLIC_BASE};
use crate::process::{cpu};
use crate::lock::spinlock::{ Spinlock, SpinlockGuard };



// the riscv Platform Level Interrupt Controller (PLIC).
pub static PLIC: Spinlock<Plic> = Spinlock::new(Plic::new(), "plic");

pub struct Plic {}

impl Plic {
    const fn new() -> Self {
        Self {}
    }

    pub fn init(&self) {
        unsafe{
            println!("plic init......");
            // set desired IRQ priorities non-zero (otherwise disabled).
            let plic = Into::<usize>::into(PLIC_BASE) as *mut u32;
            plic.offset((memlayout::UART0_IRQ * 4) as isize).write_volatile(1);
            plic.offset((memlayout::VIRTIO0_IRQ *4) as isize).write_volatile(1);
        }
    }

    pub fn init_hart(&self) {
        unsafe{
            println!("plic init hart......");
            let hart = cpu::cpuid();
        
            // set uart's enable bit for this hart's S-mode. 
            (memlayout::plic_senable(hart) as *mut u32)
            .write_volatile((1 << memlayout::UART0_IRQ) | (1 << memlayout::VIRTIO0_IRQ));
            
            // set this hart's S-mode priority threshold to 0. 
            (memlayout::plic_spriority(hart) as *mut u32)
            .write_volatile(0);
        }
    }

    /// ask the PLIC what interrupt we should serve.
    pub fn claim(&self) -> Option<u32> {
        unsafe{
            let id = cpu::cpuid();
            let interrupt = (memlayout::plic_sclaim(id) as *mut u32)
            .read_volatile();
            if interrupt == 0 {
                None
            } else {
                Some(interrupt)
            }
        }
    }

    /// tell the PLIC we've served this IRQ.
    pub unsafe fn complete(&self, interrupt: u32){
        let id = cpu::cpuid();
        (plic_sclaim(id) as *mut u32)
        .write_volatile(interrupt)
    }
}