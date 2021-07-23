use core::ptr;
use core::convert::Into;

use crate::define::memlayout;
use crate::process::{cpu};

// the riscv Platform Level Interrupt Controller (PLIC).

pub unsafe fn plic_init(){
    println!("plic init......");
    // set desired IRQ priorities non-zero (otherwise disabled).
    let plic:usize = Into::<usize>::into(memlayout::PLIC);
    let mut addr = plic + memlayout::UART0_IRQ*4;
    ptr::write_volatile(addr as *mut u32, 1);

    addr  = plic + memlayout::UART0_IRQ*4;
    ptr::write_volatile(addr as *mut u32, 1);
}

pub unsafe fn plic_init_hart(){
    println!("plic init hart......");
    let hart = cpu::cpuid();

    // set uart's enable bit for this hart's S-mode. 
    let plic_senable = memlayout::plic_senable(hart);
    let value = (1 << memlayout::UART0_IRQ) | (1 << memlayout::VIRTIO0_IRQ);
    ptr::write_volatile(plic_senable as *mut u32, value);

    // set this hart's S-mode priority threshold to 0.
    let plic_spriority = memlayout::plic_spriority(hart);
    ptr::write_volatile(plic_spriority as *mut u32, 0);
    
}

/// ask the PLIC what interrupt we should serve.
pub unsafe fn plic_claim() -> usize{
    let id = cpu::cpuid();
    let plic_sclaim = memlayout::plic_sclaim(id);

    let irq = ptr::read_volatile(plic_sclaim as *const usize);
    irq
}


// tell the PLIC we've served this IRQ.
pub unsafe fn plic_complete(irq:usize){
    let id = cpu::cpuid();
    let plic_sclaim = memlayout::plic_sclaim(id);

    ptr::write_volatile(plic_sclaim as *mut usize, irq);
}