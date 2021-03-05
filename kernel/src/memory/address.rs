use core::convert::From;
use core::convert::Into;
use bit_field::BitField;

use crate::define::memlayout::{
    PGSHIFT, PGSIZE
};
pub struct PhysicalAddress(pub usize);

pub struct VirtualAddress(pub usize);

pub struct PhysicalPageNumber(pub usize);

pub struct VirtualPageNumber(pub usize);



impl From<PhysicalAddress> for usize{
    fn from(pa: PhysicalAddress) -> Self{
        pa.0
    }
}

impl From<VirtualAddress> for usize{
    fn from(va: VirtualAddress) -> Self{
        va.0
    }
}

impl VirtualAddress{
    pub fn into(&mut self) -> usize{
        self.0
    }

    pub fn add_addr(&self, addr:usize) -> Self{
        Self(self.0+addr)
    }

    pub fn extract_bit(&mut self, level:usize) -> usize{
        let shift = PGSHIFT;
        let mut va:usize = self.into();
        va = va >> (shift + 9*level);
        va.set_bits(..9, 0x1FF);
        va
    }

    pub fn page_round_down(&self) -> usize{
        self.0 & (!(PGSIZE-1))
    }

    pub fn page_round_up(&self) -> usize{
        (self.0 + PGSIZE - 1) & (!(PGSIZE-1))
    }

}

impl PhysicalAddress{
    pub fn new(value:usize) -> Self{
        Self(value)
    }
    
    pub fn into(&self) -> usize{
        self.0
    }

    pub fn page_round_down(&self) -> usize{
        self.0 & (!(PGSIZE-1))
    }

    pub fn page_round_up(&self) -> usize{
        (self.0 + PGSIZE - 1) & (!(PGSIZE-1))
    }

}