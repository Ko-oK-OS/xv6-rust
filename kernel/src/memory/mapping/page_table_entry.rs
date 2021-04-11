use crate::define::memlayout::{
    PTE_V, PTE_R, PTE_W, PTE_X, PTE_U
};
use crate::memory::address::{ PhysicalAddress, Addr};
use super::page_table::PageTable;

#[derive(Debug, Copy, Clone)]
pub struct PageTableEntry(pub usize);


bitflags!{
    pub struct PteFlags:usize {
        const V = PTE_V;
        const R = PTE_R;
        const W = PTE_W;
        const X = PTE_X;
        const U = PTE_U;
    }

}

impl PteFlags {
    pub fn new(x: usize) -> Self {
        Self{
            bits: x
        }
    }
}


impl PageTableEntry{
    #[inline]
    pub fn new(addr:usize) -> Self{
        Self(addr)
    }

    #[inline]
    pub fn as_mut_ptr(&self) -> *mut u8{
        let addr = self.as_usize() as *mut u8;
        addr
    }

    #[inline]
    pub fn as_usize(&self) -> usize{
        self.0
    }

    #[inline]
    pub fn is_valid(&self) -> bool{
        (self.0 & (PteFlags::V.bits())) > 0
    }

    #[inline]
    pub fn is_user(&self) -> bool {
        (self.0 & (PteFlags::V.bits())) > 0
    }

    #[inline] 
    pub fn is_read(&self) -> bool {
        (self.0 & (PteFlags::R.bits())) > 0
    }

    #[inline]
    pub fn is_write(&self) -> bool {
        (self.0 & (PteFlags::W.bits())) > 0
    }

    #[inline] 
    pub fn is_execute(&self) -> bool {
        (self.0 & (PteFlags::X.bits())) > 0
    }

    #[inline]
    pub fn add_valid_bit(&self) -> Self{
        let pte = self.as_usize() | (PteFlags::V.bits());
        Self(pte)
    }

    // implement PTE2PA
    #[inline]
    pub fn as_pagetable(&self) -> *mut PageTable{
        let ret = ((self.0 >> 10) << 12) as *mut PageTable;
        ret
    }

    // implement PA2PTE
    #[inline]
    pub fn as_pte(addr: usize) -> Self{
        Self((addr >> 12) << 10)
    }

    // implement PTE_FLAGES
    #[inline]
    pub fn as_flags(&self) -> usize {
        self.as_usize() & 0x3FF
    }

    #[inline]
    pub fn write_zero(&mut self){
        self.0 = 0;
    }

    #[inline]
    pub fn write_perm(&mut self, pa:PhysicalAddress, perm: PteFlags){
        self.0 = ((pa.as_usize() >> 12) << 10) | (perm | PteFlags::V).bits()
    }

    #[inline]
    pub fn write(&mut self, addr: usize) {
        self.0 = addr
    }
    
}



