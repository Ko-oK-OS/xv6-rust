use core::ptr::write;
use lazy_static::*;
use crate::register::{sfence_vma, satp};
use crate::define::memlayout::{
    PGSIZE, MAXVA
};
use super::{
    page_table_entry::PageTableEntry,
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
pub struct PageTable{
    pub entries: [PageTableEntry; PGSIZE/8],
}

// lazy_static!{
//     static ref kernel_pagetable:PageTable = PageTable::kvmmake();
// }

// Initialize the one kernel_pagetable
pub fn kvminit(){
    println!("kvminit......");
    // static mut kernel_pagetable:PageTable = PageTable::kvmmake();
    println!("kvm done......");
}

// Switch h/w page table register to the kernel's page table,
// and enable paging.
pub unsafe fn kvminithart(){
    // satp::write(satp::make_satp(kernel_pagetable.as_addr()));
    sfence_vma();
}

impl PageTable{
    pub fn as_addr(&self) -> usize{
        self.entries.as_ptr() as usize
    }


    // fn kvmmake() -> PageTable{
    //     let ret:PageTable = PageTable;
    //     ret
    // }

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
        for level in (0..=2).rev() {
            let pte = unsafe{ &(*pagetable).entries[va.extract_bit(level)] };
            if pte.is_valid() {
                pagetable = pte.as_pagetable();
            }else{
                if alloc == 0{
                    return None
                }
                match unsafe{kalloc()}{
                    Some(page_table) => {
                        let page_addr = page_table as usize;
                        for i in 0..PGSIZE{
                            unsafe{write((page_addr + i) as *mut u8, 0)};
                            unsafe{write(pte.as_mut_ptr() as *mut PageTableEntry, PageTableEntry::as_pte(page_addr).add_valid_bit())};
                        }
                    }
                    None => return None
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
        let mut start:VirtualAddress = VirtualAddress::new(va.page_round_down());
        let mut end:VirtualAddress = VirtualAddress::new(va.add_addr(size -1).page_round_down());

        loop{
            match self.walk(start, 1){
                Some(pte) => {
                 if !pte.is_valid(){
                     panic!("remap");
                 } 
                 let pa_num = pa.as_usize();
                //  *pte = PageTableEntry::new(PageTableEntry::as_pte(pa_num).as_usize() | perm).add_valid_bit();
                 write(pte.as_mut_ptr() as *mut PageTableEntry, PageTableEntry::new(PageTableEntry::as_pte(pa_num).as_usize() | perm).add_valid_bit());

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
}