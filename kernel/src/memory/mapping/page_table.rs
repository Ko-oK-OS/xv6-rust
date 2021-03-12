use core::{ptr::write, ptr::read};
use lazy_static::*;
use crate::{interrupt::trap::kerneltrap, println, register::{sfence_vma, satp}};
use crate::define::memlayout::{
    PGSIZE, MAXVA, UART0, VIRTIO0, PLIC, KERNBASE
};
use super::{
    page_table_entry::{PageTableEntry, PteFlags}
};

use crate::memory::{
    address::{
        VirtualAddress, PhysicalAddress, Addr
    }, 
    kalloc::{
        kalloc
    }
};


extern "C" {
    fn etext();
    fn trampoline();
}

// static kernel_page:PageTable = PageTable::kvmmake();

#[derive(Debug, Clone, Copy)]
pub struct PageTable{
    pub entries: [PageTableEntry; PGSIZE/8],
}

// lazy_static!{
//     static ref KERNAL_PAGETABLE:PageTable = unsafe{PageTable::kvmmake().unwrap()};
// }

// static KERNAL_PAGETABLE:PageTable = unsafe{PageTable::kvmmake().unwrap()};
static mut KERNEL_PAGETABLE:PageTable = PageTable::empty();

// Initialize the one kernel_pagetable
pub fn kvminit(){
    println!("kvminit......");
    // static mut kernel_pagetable:PageTable = PageTable::kvmmake();
    println!("kvm done......");
}

// Switch h/w page table register to the kernel's page table,
// and enable paging.
pub unsafe fn kvminithart(){
    println!("kvminithart......");
    satp::write(satp::make_satp(KERNEL_PAGETABLE.as_addr()));
    println!("test satp write......");
    // sfence_vma();
    println!("kvminithart done......");
}

impl PageTable{
    pub fn as_addr(&self) -> usize{
        self.entries.as_ptr() as usize
    }

    pub const fn empty() -> Self{
        Self{
            entries:[PageTableEntry(0); 512]
        }
    }

    // Make a direct-map page table for the kernel.
    unsafe fn kvmmake() -> Option<PageTable>{
        println!("kvmmake start......");
        if let Some(addr) = kalloc(){
            for i in 0..PGSIZE{
                write((addr as usize + i) as *mut u8, 0);
            }
            let kpgtbl = addr as *mut PageTable;

            println!("uart map......");

            // uart registers
            (*kpgtbl).kvmmap(VirtualAddress::new(UART0), PhysicalAddress::new(UART0), PGSIZE, PteFlags::R.bits() | PteFlags::W.bits());

            println!("virtio0 map......");
            // virtio mmio disk interface
            (*kpgtbl).kvmmap(VirtualAddress::new(VIRTIO0), PhysicalAddress::new(VIRTIO0), PGSIZE, PteFlags::R.bits() | PteFlags::X.bits());

            println!("plic map......");
            // PLIC
            (*kpgtbl).kvmmap(VirtualAddress::new(PLIC.as_usize()), PhysicalAddress::new(PLIC.as_usize()), PGSIZE, PteFlags::R.bits() | PteFlags::X.bits());

            println!("text map......");
            // map kernel text exectuable and read-only
            (*kpgtbl).kvmmap(VirtualAddress::new(KERNBASE.as_usize()), PhysicalAddress::new(KERNBASE.as_usize()), PGSIZE, PteFlags::R.bits() | PteFlags::W.bits());

            println!("kernel data map......");
            // map kernel data and the physical RAM we'll make use of
            (*kpgtbl).kvmmap(VirtualAddress::new(etext as usize), PhysicalAddress::new(etext as usize), PGSIZE, PteFlags::R.bits() | PteFlags::W.bits());

            println!("trampoline map......");
            // map the trampoline for trap entry/exit
            // the highest virtual address in the kernel
            (*kpgtbl).kvmmap(VirtualAddress::new(trampoline as usize), PhysicalAddress::new(trampoline as usize), PGSIZE, PteFlags::R.bits() | PteFlags::X.bits());

            // TODO: map kernel stacks

            return Some(*kpgtbl)

        }
        None
    }

    // Return the address of the PTE in page table pagetable
    // that corresponds to virtual address va.  If alloc!=0,
    // create any required page-table pages.
    //
    // The risc-v Sv39 scheme has three levels of page-table
    // pages. A page-table page contains 512 64-bit PTEs.
    // A 64-bit virtual address is split into five fields:
    //   39..63 -- must be zero.
    //   30..38 -- 9 bits of level-2 index.
    //   21..29 -- 9 bits of level-1 index.
    //   12..20 -- 9 bits of level-0 index.
    //    0..11 -- 12 bits of byte offset within the page.


    // find  the PTE for a virtual address
     fn walk(&self, va: VirtualAddress, alloc:i32) -> Option<&PageTableEntry>{
        let mut pagetable = self as *const PageTable;
        let real_addr:usize = va.as_usize();
        if real_addr > MAXVA {
            panic!("walk");
        }
        for level in (1..=2).rev() {
            // println!("extract bits......");
            let pte:&PageTableEntry = unsafe{ &(*pagetable).entries[va.extract_bit(level)] };
            println!("extract pte address: 0x{:x}", pte.as_usize());
            // println!("get pte......");
            if pte.is_valid() {
                println!("pte is valid......");
                pagetable = pte.as_pagetable();
                
                // println!("as pagetable......");
            }else{
                // println!("pte is not valid......");
                if alloc == 0{
                    return None
                }
                match unsafe{kalloc()}{
                    Some(page_table) => {
                        println!("alloc memeory for pte");
                        // println!("alloc......");
                        let page_addr = page_table as usize;
                        // println!("write memory......");
                        for i in 0..PGSIZE{
                            unsafe{write((page_addr + i) as *mut u8, 0)};
                        }
                        unsafe{write((pte as *const _) as *mut PageTableEntry, PageTableEntry::as_pte(page_addr).add_valid_bit())};
                        println!("Before: pte address: 0x{:x}", pte.as_usize());
                    }
                    None => {
                        println!("fail to alloc memory");
                        return None
                    }
                }
                
            }
        }
        Some(unsafe{&(*pagetable).entries[va.extract_bit(0)]})
    }

    // Look up a virtual address, return the physical address,
    // or 0 if not mapped.
    // Can only be used to look up user pages.
    pub fn walkaddr(pagetable: PageTable, va: VirtualAddress) -> Option<PhysicalAddress>{
        let addr = va.as_usize();
        if addr > MAXVA{
            return None
        }
        match pagetable.walk(va, 0){
            Some(pte) => {
                if !pte.is_valid(){
                    return None
                }
                if !pte.is_user(){
                    return None
                }

                let pagetable_addr = pte.as_pagetable() as usize;
                Some(PhysicalAddress::new(pagetable_addr))
            }

            None => None
        }
    }


    // Create PTEs for virtual addresses starting at va that refer to
    // physical addresses starting at pa. va and size might not
    // be page-aligned. Returns 0 on success, -1 if walk() couldn't
    // allocate a needed page-table page.

    unsafe fn mappages(&self, va: VirtualAddress, pa: PhysicalAddress, size:usize, perm:usize) -> bool{
        // println!("start map pages......");
        let mut start:VirtualAddress = VirtualAddress::new(va.page_round_down());
        let mut end:VirtualAddress = VirtualAddress::new(va.add_addr(size -1).page_round_down());

        loop{
            // println!("enter loop......");
            match self.walk(start, 1){

                Some(pte) => {
                //  println!("start walk......");
                 println!("After: pte address: 0x{:x}", pte.as_usize());
                 if !pte.is_valid(){
                    //  println!("pte address: 0x{:x}", pte.as_usize());
                     panic!("remap");
                 } 
                 let pa_num = pa.as_usize();
                //  *pte = PageTableEntry::new(PageTableEntry::as_pte(pa_num).as_usize() | perm).add_valid_bit();
                 
                 write(pte.as_mut_ptr() as *mut PageTableEntry, PageTableEntry::new(PageTableEntry::as_pte(pa_num).as_usize() | perm).add_valid_bit());
                //  println!("write pagetable entry");

                 if (start).equal(&end){
                    break;
                 }
                 start = start.add_addr(PGSIZE);
                 end = end.add_addr(PGSIZE);
                 
                }
                None => return false
             }
        }
        true
    }

    // add a mapping to the kernel page table.
    // only used when booting
    // does not flush TLB or enable paging
    
    pub unsafe fn kvmmap(&self, va:VirtualAddress, pa:PhysicalAddress, sz:usize, perm:usize){
        if !self.mappages(va, pa, sz, perm){
            panic!("kvmmap");
        }
    }


    // Create an empty user page table.
    // return None if out of memory
    unsafe fn uvmcreate() -> Option<PageTable>{
        match kalloc() {
            Some(addr) => {
                for i in 0..PGSIZE{
                    write((addr as usize + i) as *mut u8, 0); 
                }
                let pagetable = addr as *const PageTable;
                Some(*pagetable)
            }
            None => None
        }
    }

    // Load the user initcode into address 0 of pagetable
    // for the very first process
    // sz must be less than a page

    pub unsafe fn uvminit(&self, src:*const u8, sz:usize){
        if sz >= PGSIZE{
            panic!("inituvm: more than a page");
        }

        if let Some(mem) = kalloc(){
            for i in 0..PGSIZE{
                write(((mem as usize)+i) as *mut u8, 0);
            }
            self.mappages(VirtualAddress::new(0), PhysicalAddress::new(mem as usize), PGSIZE, PteFlags::W.bits() | PteFlags::R.bits() | PteFlags::X.bits() | PteFlags::U.bits());
            for i in 0..PGSIZE{
                let data = read(((src as usize) + i) as *const u8);
                write(((mem as usize)+i) as *mut u8, data);
            }
        }
    }

}