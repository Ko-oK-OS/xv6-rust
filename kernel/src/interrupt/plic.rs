use core::ptr;
use core::convert::Into;

use crate::define::memlayout::{self, plic_sclaim};
use crate::process::{cpu};

// the riscv Platform Level Interrupt Controller (PLIC).

pub unsafe fn plic_init(){
    println!("plic init......");
    // set desired IRQ priorities non-zero (otherwise disabled).
    let plic = Into::<usize>::into(memlayout::PLIC) as *mut u32;
    plic.offset((memlayout::UART0_IRQ * 4) as isize).write_volatile(1);
    plic.offset((memlayout::VIRTIO0_IRQ *4) as isize).write_volatile(1);
}

pub unsafe fn plic_init_hart(){
    println!("plic init hart......");
    let hart = cpu::cpuid();

    // set uart's enable bit for this hart's S-mode. 
    (memlayout::plic_senable(hart) as *mut u32)
    .write_volatile((1 << memlayout::UART0_IRQ) | (1 << memlayout::VIRTIO0_IRQ));
    
    // set this hart's S-mode priority threshold to 0. 
    (memlayout::plic_spriority(hart) as *mut u32)
    .write_volatile(0);
}

/// ask the PLIC what interrupt we should serve.
pub unsafe fn plic_claim() -> usize{
    let id = cpu::cpuid();
    (memlayout::plic_sclaim(id) as *mut u32)
    .read_volatile() as usize
}


/// tell the PLIC we've served this IRQ.
pub unsafe fn plic_complete(irq:usize){
    let id = cpu::cpuid();
    (plic_sclaim(id) as *mut u32)
    .write_volatile(irq as u32)
}