use super::{ page_table::PageTable, page_table_entry::PteFlags};
use crate::memory::address::{VirtualAddress, PhysicalAddress, Addr};
use crate::define::memlayout::{ PGSIZE, MAXVA, UART0, VIRTIO0, PLIC, KERNBASE };


static mut KERNEL_PAGETABLE:PageTable = PageTable::empty();
extern "C" {
    fn etext();
    fn trampoline();
}

// Initialize the one kernel_pagetable
#[no_mangle]
pub unsafe fn kvminit(){
    println!("kvminit......");
    kvmmake();
    println!("kvminit done......");
   
}

// Switch h/w page table register to the kernel's page table,
// and enable paging.
pub unsafe fn kvminithart(){
    println!("kvminithart......");
    // satp::write(satp::make_satp(KERNEL_PAGETABLE.as_addr()));
    println!("test satp write......");
    // sfence_vma();
    println!("kvminithart done......");
}


// Make a direct-map page table for the kernel.
unsafe fn kvmmake(){
    println!("kvmmake start......");


    println!("uart map......");

    // debug
    // println!("Interrupt enable: {}", crate::register::sstatus::intr_get());
    // println!("PageTable size: {}", core::mem::size_of::<PageTable>());
    // println!("PageTable align: {}", core::mem::align_of::<PageTable>());

    // uart registers
    KERNEL_PAGETABLE.kvmmap(VirtualAddress::new(UART0), PhysicalAddress::new(UART0), PGSIZE, PteFlags::R.bits() | PteFlags::W.bits());

    println!("virtio0 map......");
    // virtio mmio disk interface
    KERNEL_PAGETABLE.kvmmap(VirtualAddress::new(VIRTIO0), PhysicalAddress::new(VIRTIO0), PGSIZE, PteFlags::R.bits() | PteFlags::X.bits());

    println!("plic map......");
    // PLIC
    KERNEL_PAGETABLE.kvmmap(VirtualAddress::new(PLIC.as_usize()), PhysicalAddress::new(PLIC.as_usize()), PGSIZE, PteFlags::R.bits() | PteFlags::X.bits());

    println!("text map......");
    // map kernel text exectuable and read-only
    KERNEL_PAGETABLE.kvmmap(VirtualAddress::new(KERNBASE.as_usize()), PhysicalAddress::new(KERNBASE.as_usize()), PGSIZE, PteFlags::R.bits() | PteFlags::W.bits());

    println!("kernel data map......");
    // map kernel data and the physical RAM we'll make use of
    KERNEL_PAGETABLE.kvmmap(VirtualAddress::new(etext as usize), PhysicalAddress::new(etext as usize), PGSIZE, PteFlags::R.bits() | PteFlags::W.bits());

    println!("trampoline map......");
    // map the trampoline for trap entry/exit
    // the highest virtual address in the kernel
    KERNEL_PAGETABLE.kvmmap(VirtualAddress::new(trampoline as usize), PhysicalAddress::new(trampoline as usize), PGSIZE, PteFlags::R.bits() | PteFlags::X.bits());

    // TODO: map kernel stacks
    
    println!("Befor return");
}

