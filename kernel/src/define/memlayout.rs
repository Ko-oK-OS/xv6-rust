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
// 80000000 -- entry.S, then kernel text and data
// end -- start of kernel page allocation area
// PHYSTOP -- end RAM used by the kernel

// qemu puts UART registers here in physical memory.
use super::*;
use core::convert::Into;

pub const UART0:usize = 0x10000000;
pub const UART0_IRQ: u32 = 10;

// virtio mmio interface
pub const VIRTIO0:usize = 0x10001000;
pub const VIRTIO0_IRQ: u32 = 1;

// core local interruptor (CLINT), which contains the timer.
pub const CLINT:Address = Address(0x2000000);
pub const CLINT_MTIME:Address = CLINT.add_addr(0xBFF8);
pub const CLINT_MTIMECMP:Address = CLINT.add_addr(0x4000);


// qemu puts platform-level interrupt controller (PLIC) here.
pub const PLIC_BASE: usize = 0x0c000000;
// pub const PLIC_PRIORITY:Address = PLIC_BASE.add_addr(0x0);
// pub const PLIC_PENDING:Address = PLIC_BASE.add_addr(0x1000);
// pub const PLIC_MENABLE:Address = PLIC_BASE.add_addr(0x2000);
// pub const PLIC_SENABLE:Address = PLIC_BASE.add_addr(0x2080);
// pub const PLIC_MPRIORITY:Address = PLIC_BASE.add_addr(0x200000);
// pub const PLIC_SPRIORITY:Address = PLIC_BASE.add_addr(0x201000);
// pub const PLIC_MCLAIM:Address = PLIC_BASE.add_addr(0x200004);
// pub const PLIC_SCLAIM:Address = PLIC_BASE.add_addr(0x201004);


// we'll place the e1000 registers at this address.
// vm.c maps this range.
pub const E1000_REGS:usize = 0x40000000;

// qemu -machine virt puts PCIe config space here.
// vm.c maps this range.
pub const ECAM:usize = 0x30000000;

// define in hw/riscv/virt.c, which is used to execute shutdown. 
pub const VIRT_TEST:usize = 0x100000;

// pub fn plic_spriority(hartid: usize) -> usize{
//     let ret:usize;
//     ret = Into::<usize>::into(PLIC_SPRIORITY.add_addr(hartid*0x2000));
//     ret
// }

// pub fn plic_mclaim(hartid: usize) -> usize{
//     let ret:usize;
//     ret = Into::<usize>::into(PLIC_MCLAIM.add_addr(hartid*0x2000));
//     ret
// }

// pub fn plic_menable(hartid: usize) -> usize{
//     let ret:usize;
//     ret = Into::<usize>::into(PLIC_MENABLE.add_addr(hartid*0x100));
//     ret
// }

// pub fn plic_senable(hartid: usize) -> usize{
//     let ret:usize;
//     ret = Into::<usize>::into(PLIC_SENABLE.add_addr(hartid*0x100));
//     ret
// }

// pub fn plicmpriority(hartid: usize) -> usize{
//     let ret:usize;
//     ret = Into::<usize>::into(PLIC_MPRIORITY.add_addr(hartid*0x2000));
//     ret
// }


// pub fn plic_sclaim(hartid: usize) -> usize{
//     let ret:usize;
//     ret = Into::<usize>::into(PLIC_SCLAIM.add_addr(hartid*0x2000));
//     ret
// }


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

pub const KERNBASE:Address =  Address(0x80000000);
pub const PHYSTOP:Address = KERNBASE.add_addr(128*1024*1024);

pub const PGSIZE:usize = 4096; // bytes per page
pub const PGSHIFT:usize = 12; // bits of offset within a page
pub const PGMASKLEN:usize = 9;
pub const PGMASK:usize = 0x1FF;

pub const PTE_V:usize = 1 << 0; // valid
pub const PTE_R:usize = 1 << 1;
pub const PTE_W:usize = 1 << 2;
pub const PTE_X:usize = 1 << 3;
pub const PTE_U:usize = 1 << 4; // 1 -> user can access



// one beyond the highest possible virtual address.
// MAXVA is actually one bit less than the max allowed by
// Sv39, to avoid having to sign-extend virtual addresses
// that have the high bit set.
pub const MAXVA:usize =  1 << (9 + 9 + 9 + 12 - 1); 


// map the trampoline page to the highest address,
// in both user and kernel space.
pub const TRAMPOLINE:usize = MAXVA - PGSIZE;
pub const TRAPFRAME:usize = TRAMPOLINE - PGSIZE;



