use super::{ page_table::PageTable, page_table_entry::PteFlags};
use crate::memory::address::{VirtualAddress, PhysicalAddress, Addr};
use crate::memory::RawPage;
use crate::define::memlayout::{ 
    PGSIZE, MAXVA, UART0, VIRTIO0,
    PLIC, KERNBASE, PHYSTOP, TRAMPOLINE,
    E1000_REGS, ECAM
};
use crate::register::{satp, sfence_vma};
use crate::process::*;

use core::mem::{ size_of, align_of };


pub static mut KERNEL_PAGETABLE:PageTable = PageTable::empty();
extern "C" {
    fn etext();
    fn trampoline();
}

// Initialize the one kernel_pagetable
#[no_mangle]
pub unsafe fn kvminit(){
    // check if RawPage and PageTable have the same memory layout
    assert_eq!(size_of::<RawPage>(), PGSIZE);
    assert_eq!(align_of::<RawPage>(), PGSIZE);
    assert_eq!(size_of::<RawPage>(), size_of::<PageTable>());
    assert_eq!(align_of::<RawPage>(), align_of::<PageTable>());

    println!("kvminit......");
    kvmmake();
    println!("kvminit done......");
   
}

// Switch h/w page table register to the kernel's page table,
// and enable paging.
pub unsafe fn kvminithart(){
    println!("kvminithart......");
    satp::write(KERNEL_PAGETABLE.as_satp());
    sfence_vma();
    println!("kvminithart done......");
}


// Make a direct-map page table for the kernel.
unsafe fn kvmmake() {
    println!("kvmmake start......");


    println!("uart map......");

    // uart registers
    KERNEL_PAGETABLE.kvmmap(
        VirtualAddress::new(UART0), 
        PhysicalAddress::new(UART0), 
        PGSIZE, 
        PteFlags::R | PteFlags::W,
    );

    println!("virtio0 map......");
    // virtio mmio disk interface
    KERNEL_PAGETABLE.kvmmap(
        VirtualAddress::new(VIRTIO0), 
        PhysicalAddress::new(VIRTIO0), 
        PGSIZE, 
        PteFlags::R | PteFlags::W
    );

    // PCI-E ECAM (configuration space), for pci.c
    println!("PCL_E ECAM map......");
    KERNEL_PAGETABLE.kvmmap(
        VirtualAddress::new(ECAM),
        PhysicalAddress::new(ECAM),
        0x10000000,
        PteFlags::R | PteFlags::W
    );

    // pci.c maps the e1000's registers here.
    println!("e1000's registers map......");
    KERNEL_PAGETABLE.kvmmap(
        VirtualAddress::new(E1000_REGS),
        PhysicalAddress::new(E1000_REGS),
        0x20000,
        PteFlags::R | PteFlags::W
    );

    println!("plic map......");
    // PLIC
    KERNEL_PAGETABLE.kvmmap(
        VirtualAddress::new(PLIC.as_usize()), 
        PhysicalAddress::new(PLIC.as_usize()), 
        0x400000, 
        PteFlags::R | PteFlags::W
    );

    println!("text map......");
    // map kernel text exectuable and read-only
    KERNEL_PAGETABLE.kvmmap(
        VirtualAddress::new(KERNBASE.as_usize()), 
        PhysicalAddress::new(KERNBASE.as_usize()), 
        etext as usize - Into::<usize>::into(KERNBASE), 
        PteFlags::R | PteFlags::X
    );

    println!("kernel data map......");
    // map kernel data and the physical RAM we'll make use of
    KERNEL_PAGETABLE.kvmmap(
        VirtualAddress::new(etext as usize), 
        PhysicalAddress::new(etext as usize), 
        Into::<usize>::into(PHYSTOP) - etext as usize, 
        PteFlags::R | PteFlags::W
    );

    println!("trampoline map......");
    // map the trampoline for trap entry/exit
    // the highest virtual address in the kernel
    KERNEL_PAGETABLE.kvmmap(
        VirtualAddress::new(TRAMPOLINE), 
        PhysicalAddress::new(trampoline as usize), 
        PGSIZE, 
        PteFlags::R | PteFlags::X
    );

    // map kernel stacks
    println!("process stack map......");
    PROC_MANAGER.proc_mapstacks();

    println!("process stack map done......");
}

