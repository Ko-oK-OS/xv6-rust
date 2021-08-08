use super::{ page_table::PageTable, page_table_entry::PteFlags};
use crate::memory::address::{VirtualAddress, PhysicalAddress, Addr};
use crate::memory::RawPage;
use crate::define::layout::{ 
    PGSIZE, MAXVA, UART0, VIRTIO0,
    PLIC_BASE, KERNEL_BASE, PHYSTOP, TRAMPOLINE,
    E1000_REGS, ECAM, VIRT_TEST, CLINT
};
use crate::register::{satp, sfence_vma};
use crate::process::*;

use core::mem::{ size_of, align_of };


pub static mut KERNEL_PAGETABLE:PageTable = PageTable::empty();
extern "C" {
    fn etext();
    fn trampoline();
}

/// Initialize the one kernel_pagetable
#[no_mangle]
pub unsafe fn kvm_init(){
    // check if RawPage and PageTable have the same memory layout
    assert_eq!(size_of::<RawPage>(), PGSIZE);
    assert_eq!(align_of::<RawPage>(), PGSIZE);
    assert_eq!(size_of::<RawPage>(), size_of::<PageTable>());
    assert_eq!(align_of::<RawPage>(), align_of::<PageTable>());

    kernel_map();
}

/// Switch h/w page table register to the kernel's page table,
/// and enable paging.
pub unsafe fn kvm_init_hart() {
    satp::write(KERNEL_PAGETABLE.as_satp());
    sfence_vma();
}


/// Make a direct-map page table for the kernel.
unsafe fn kernel_map() {
    println!("kernel page map");
    // map VIRT_TEST for shutdown or reboot
    KERNEL_PAGETABLE.kernel_map(
        VirtualAddress::new(VIRT_TEST),
        PhysicalAddress::new(VIRT_TEST),
        PGSIZE,
        PteFlags::R | PteFlags::W
    );

    // uart registers
    KERNEL_PAGETABLE.kernel_map(
        VirtualAddress::new(UART0), 
        PhysicalAddress::new(UART0), 
        PGSIZE, 
        PteFlags::R | PteFlags::W,
    );
    // virtio mmio disk interface
    KERNEL_PAGETABLE.kernel_map(
        VirtualAddress::new(VIRTIO0), 
        PhysicalAddress::new(VIRTIO0), 
        PGSIZE, 
        PteFlags::R | PteFlags::W
    );

    // PCI-E ECAM (configuration space), for pci.rs
    KERNEL_PAGETABLE.kernel_map(
        VirtualAddress::new(ECAM),
        PhysicalAddress::new(ECAM),
        0x10000000,
        PteFlags::R | PteFlags::W
    );

    // pci maps the e1000's registers here.
    KERNEL_PAGETABLE.kernel_map(
        VirtualAddress::new(E1000_REGS),
        PhysicalAddress::new(E1000_REGS),
        0x20000,
        PteFlags::R | PteFlags::W
    );

    // CLINT
    KERNEL_PAGETABLE.kernel_map(
        VirtualAddress::new(CLINT),
        PhysicalAddress::new(CLINT),
        0x10000,
        PteFlags::R | PteFlags::W
    );

    // PLIC
    KERNEL_PAGETABLE.kernel_map(
        VirtualAddress::new(PLIC_BASE), 
        PhysicalAddress::new(PLIC_BASE), 
        0x400000, 
        PteFlags::R | PteFlags::W
    );

    // map kernel text exectuable and read-only
    KERNEL_PAGETABLE.kernel_map(
        VirtualAddress::new(KERNEL_BASE), 
        PhysicalAddress::new(KERNEL_BASE), 
        etext as usize - KERNEL_BASE, 
        PteFlags::R | PteFlags::X
    );

    // map kernel data and the physical RAM we'll make use of
    KERNEL_PAGETABLE.kernel_map(
        VirtualAddress::new(etext as usize), 
        PhysicalAddress::new(etext as usize), 
        Into::<usize>::into(PHYSTOP) - etext as usize, 
        PteFlags::R | PteFlags::W
    );

    // map the trampoline for trap entry/exit
    // the highest virtual address in the kernel
    KERNEL_PAGETABLE.kernel_map(
        VirtualAddress::new(TRAMPOLINE), 
        PhysicalAddress::new(trampoline as usize), 
        PGSIZE, 
        PteFlags::R | PteFlags::X
    );

    // map kernel stacks
    PROC_MANAGER.proc_mapstacks();
}

