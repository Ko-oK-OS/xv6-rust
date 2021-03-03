use crate::define::memlayout::{
    PTE_V, PTE_R, PTE_W, PTE_X, PTE_U
};
use super::page_table::PageTable;

#[derive(Debug, Copy, Clone)]
pub struct PageTableEntry(usize);


bitflags!{
    pub struct PteFlags:usize{
        const V = PTE_V;
        const R = PTE_R;
        const W = PTE_W;
        const X = PTE_X;
        const U = PTE_U;
    }
}

impl PageTableEntry{
    pub fn into(&self) -> usize{
        self.0
    }

    pub fn is_valid(&self) -> bool{
        (self.0 & (PteFlags::V.bits())) > 0
    }

    pub fn is_user(&self) -> bool {
        (self.0 & (PteFlags::V.bits())) > 0
    }

    pub fn to_pagetable(&self) -> *mut PageTable{
        let ret = ((self.0 >> 10) << 12) as *mut PageTable;
        ret
    }
    
}

