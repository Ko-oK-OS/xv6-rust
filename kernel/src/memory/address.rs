use core::cmp::{PartialEq, Eq, Ord, Ordering};
use core::convert::From;
use core::convert::Into;
use bit_field::BitField;

use crate::define::memlayout::{
    PGSHIFT, PGSIZE, PGMASKLEN, PGMASK
};

#[derive(Debug, Copy, Clone)]
pub struct PhysicalAddress(pub usize);

#[derive(Debug, Copy, Clone)]
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
    pub fn new(addr: usize) -> Self{
        Self(addr)
    }

    pub fn compare(&self, other:&Self) -> bool{
        self.0 > other.0
    }

    pub fn equal(&self, other: &Self) -> bool{
        self.0 == other.0
    }


    pub fn add_addr(&self, addr:usize) -> Self{
        Self(self.0+addr)
    }

    pub fn page_num(&self, level:usize) -> usize{
        (self.0 >> (PGSHIFT + level * PGMASKLEN)) & PGMASK
    }

}

impl PhysicalAddress{
    pub fn new(value:usize) -> Self{
        Self(value)
    }

    pub fn add_addr(&self, addr:usize) -> Self{
        Self(self.0+addr)
    }
}

// impl PartialEq for VirtualAddress{
//     fn eq(&self, other:&Self) -> bool{
//         self.0 == other.0
//     }
// }

// impl Eq for VirtualAddress{}

// impl Ord for VirtualAddress{
//     fn cmp(&self, other: &Self) -> Ordering{
//         self.as_usize().cmp(&other.as_usize())
//     }
// }