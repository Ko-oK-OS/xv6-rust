use crate::define::memlayout::{
    PGSIZE, MAXVA
};
use super::page_table_entry::PageTableEntry;

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
    
    fn walk(&self, va:usize, alloc:usize) -> PageTableEntry{
        if va > MAXVA {
            panic!("walk");
        }

    }
}