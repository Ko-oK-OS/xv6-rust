
use crate::define::memlayout::{
    PGSIZE, MAXVA
};
use super::{
    page_table_entry::PageTableEntry,
};

use crate::memory::address::{
    VirtualAddress, PhysicalAddress
};

extern "C" {
    fn etext();
}

// static kernel_page:PageTable = PageTable::kvmmake();
pub struct PageTable{
    pub entries: [PageTableEntry; PGSIZE/8],
}

// Initialize the one kernel_pagetable
pub fn kvminit(){
    println!("kvminit......");
}

impl PageTable{
    // fn kvmmake() -> PageTable{
    //     let ret:PageTable;
        
    // }

    fn to_pte(&self) -> *mut PageTableEntry{
        let ret =  (((self.entries.as_ptr() as usize) >> 12) << 10) as *mut PageTableEntry;
        ret
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
    fn walk(&self, va: &mut VirtualAddress) -> Option<&PageTableEntry>{
        let mut pagetable = self as *const PageTable;
        let real_addr:usize = va.into();
        if real_addr > MAXVA {
            panic!("walk");
        }
        for level in (0..2).rev() {
            let pte = unsafe{ &(*pagetable).entries[va.extract_bit(level)] };
            if pte.is_valid() {
                pagetable = pte.to_pagetable();
            }else{
                return None
            }
        }
        Some(unsafe{&(*pagetable).entries[va.extract_bit(0)]})
    }


    // Create PTEs for virtual addresses starting at va that refer to
    // physical addresses starting at pa. va and size might not
    // be page-aligned. Returns 0 on success, -1 if walk() couldn't
    // allocate a needed page-table page.

    // fn mappages(&self, va: VirtualAddress, pa: PhysicalAddress) -> bool{
    //     let start:usize = va.page_round_down();
    //     let end:usize = va.add_addr(PGSIZE -1).page_round_down();

    // }
}