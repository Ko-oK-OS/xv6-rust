use core::ptr;

use crate::{define::layout::{PLIC_BASE, UART0_IRQ, VIRTIO0_IRQ}, process::{cpu, cpuid}};

const PLIC_PRIORITY: usize = PLIC_BASE;
const PLIC_PENDING: usize = PLIC_BASE + 0x1000;

fn PLIC_MENABLE(hart_id: usize) -> usize {
    PLIC_BASE + 0x2000 + hart_id * 0x100
}

fn PLIC_SENABLE(hart_id: usize) -> usize {
    PLIC_BASE + 0x2080 + hart_id * 0x100
}

fn PLIC_MPRIORITY(hart_id: usize) -> usize {
    PLIC_BASE + 0x200000 + hart_id * 0x2000
}

fn PLIC_SPRIORITY(hart_id: usize) -> usize {
    PLIC_BASE + 0x201000 + hart_id * 0x2000
}

fn PLIC_MCLAIM(hart_id: usize) -> usize {
    PLIC_BASE + 0x200004 + hart_id * 0x2000
}

fn PLIC_SCLAIM(hart_id: usize) -> usize {
    PLIC_BASE + 0x201004 + hart_id * 0x2000
}

pub fn plic_init() {
    // set desired IRQ priorities non-zero (otherwise disable)
    write(PLIC_BASE + (UART0_IRQ * 4) as usize, 1);
    write(PLIC_BASE + (VIRTIO0_IRQ * 4) as usize, 1);
}

pub fn plic_init_hart() {
    let hart_id = unsafe{ cpuid() };

    // Set UART's enable bit for this hart's S-mode. 
    write(PLIC_SENABLE(hart_id), (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ));

    // Set this hart's S-mode pirority threshold to 0. 
    write(PLIC_SPRIORITY(hart_id), 0);
}

/// Ask the PLIC what interrupt we should serve. 
pub fn plic_claim() -> Option<u32> {
    let hart_id = unsafe {
        cpuid()
    };
    let interrupt = read(PLIC_SCLAIM(hart_id));
    if interrupt == 0 {
        None
    } else {
        Some(interrupt)
    }
}

/// Tell the PLIC we've served the IRQ
pub fn plic_complete(interrupt: u32) {
    let hart_id = unsafe {
        cpuid()
    };
    write(PLIC_SCLAIM(hart_id), interrupt);
}


fn write(addr: usize, val: u32) {
    unsafe {
        ptr::write(addr as *mut u32, val);
    }
}

fn read(addr: usize) -> u32 {
    unsafe {
        ptr::read(addr as *const u32)
    }
}