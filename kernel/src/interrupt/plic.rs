use core::ptr;
use core::convert::Into;

use crate::define::memlayout;
use crate::process::{cpu};


//
// the riscv Platform Level Interrupt Controller (PLIC).
//


pub unsafe fn plicinit(){
    // set desired IRQ priorities non-zero (otherwise disabled).
    let plic:usize = Into::<usize>::into(memlayout::PLIC);
    let addr_1 = plic + memlayout::UART0_IRQ*4;
    ptr::write_volatile(addr_1 as *mut u32, 1);

    let addr_2  = plic + memlayout::UART0_IRQ*4;
    ptr::write_volatile(addr_2 as *mut u32, 1);
}

// ask the PLIC what interrupt we should serve.
pub unsafe fn plic_claim() -> u32{
    let id = cpu::cpuid();
    let plic_sclaim = memlayout::plic_sclaim(id);

    let irq = ptr::read_volatile(plic_sclaim as *const u32);
    return irq;
}


// tell the PLIC we've served this IRQ.
pub unsafe fn plic_complete(irq:u32){
    let id = cpu::cpuid();
    let plic_sclaim = memlayout::plic_sclaim(id);

    ptr::write_volatile(plic_sclaim as *mut u32, irq);
}