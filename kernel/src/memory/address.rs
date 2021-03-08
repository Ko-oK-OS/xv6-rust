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

pub trait Addr{

    fn as_usize(&self) -> usize;

    #[inline]
    fn as_ptr(&self) -> *const u8{
        self.as_usize() as *const u8
    }

    #[inline]
    fn as_mut_ptr(&self) -> *mut u8{
        self.as_usize() as *mut u8
    }

    #[inline]
    fn page_round_up(&self) -> usize{
        (self.as_usize() + PGSIZE - 1) & (!(PGSIZE-1))
    }

    #[inline]
    fn page_round_down(&self) -> usize{
        self.as_usize() & (!(PGSIZE-1))
    }
}

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

impl Addr for VirtualAddress{
    fn as_usize(&self) -> usize{
        self.0
    }


}

impl Addr for PhysicalAddress{


    fn as_usize(&self) -> usize{
        self.0
    }

}

impl VirtualAddress{

    pub fn add_addr(&self, addr:usize) -> Self{
        Self(self.0+addr)
    }

    pub fn extract_bit(&self, level:usize) -> usize{
        let shift = PGSHIFT;
        let mut va:usize = self.as_usize();
        va = va >> (shift + 9*level);
        va.set_bits(..9, 0x1FF);
        va
    }

}

impl PhysicalAddress{
    pub fn new(value:usize) -> Self{
        Self(value)
    }
}