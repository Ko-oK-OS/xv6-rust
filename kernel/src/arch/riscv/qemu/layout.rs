// Physical memory layout

// qemu -machine virt is set up like this,
// based on qemu's hw/riscv/virt.c:
//
// 00001000 -- boot ROM, provided by qemu
// 02000000 -- CLINT
// 0C000000 -- PLIC
// 10000000 -- uart0 
// 10001000 -- virtio disk 
// 80000000 -- boot ROM jumps here in machine mode
//             -kernel loads the kernel here
// unused RAM after 80000000.

// the kernel uses physical memory thus:
// 0x80000000 -- entry.S, then kernel text and data
// end -- start of kernel page allocation area
// PHYSTOP -- end RAM used by the kernel

use super::*;

/// qemu puts UART registers here in physical memory.
pub const UART0:usize = 0x10000000;
pub const UART0_IRQ: u32 = 10;

/// virtio mmio interface
pub const VIRTIO0:usize = 0x10001000;
pub const VIRTIO0_IRQ: u32 = 1;

/// core local interruptor (CLINT), which contains the timer.
pub const CLINT: usize = 0x2000000;
pub const CLINT_MTIME: usize = CLINT + 0xBFF8;
pub const CLINT_MTIMECMP: usize = CLINT + 0x4000;

// qemu puts platform-level interrupt controller (PLIC) here.
pub const PLIC_BASE: usize = 0x0c000000;

// we'll place the e1000 registers at this address.
pub const E1000_REGS:usize = 0x40000000;

// qemu -machine virt puts PCIe config space here.
pub const ECAM:usize = 0x30000000;

// define in hw/riscv/virt.c, which is used to execute shutdown. 
pub const VIRT_TEST:usize = 0x100000;

/// User memory layout.
/// Address zero first:
///   text
///   original data and bss
///   fixed-size stack
///   expandable heap
///   ...
///   TRAPFRAME (p->trapframe, used by the trampoline)
///   TRAMPOLINE (the same page as in the kernel)


// the kernel expects there to be RAM
// for use by the kernel and user pages
// from physical address 0x80000000 to PHYSTOP.

// the size of memory: 128M
pub const MEM_SIZE: usize = 128 * 1024 * 1024;
pub const KERNEL_BASE: usize =  0x80000000;
pub const PHYSTOP: usize = KERNEL_BASE + MEM_SIZE;

pub const PGSIZE: usize = 4096; // bytes per page
pub const PGSHIFT: usize = 12; // bits of offset within a page
pub const PGMASKLEN: usize = 9;
pub const PGMASK: usize = 0x1FF;


/// One beyond the highest possible virtual address.
/// MAXVA is actually one bit less than the max allowed by
/// Sv39, to avoid having to sign-extend virtual addresses
/// that have the high bit set.
pub const MAXVA: usize =  1 << (9 + 9 + 9 + 12 - 1); 

// map the trampoline page to the highest address,
// in both user and kernel space.
pub const TRAMPOLINE: usize = MAXVA - PGSIZE;
pub const TRAPFRAME: usize = TRAMPOLINE - PGSIZE;



