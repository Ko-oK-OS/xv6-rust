use core::convert::From;
use core::convert::Into;
use bit_field::BitField;

use crate::define::memlayout::{
    PGSHIFT
};
pub struct PhysicalAddress(pub u64);

pub struct VirtualAddress(pub u64);

pub struct PhysicalPageNumber(pub u64);

pub struct VirtualPageNumber(pub u64);



impl From<PhysicalAddress> for u64{
    fn from(pa: PhysicalAddress) -> Self{
        pa.0
    }
}

impl From<VirtualAddress> for u64{
    fn from(va: VirtualAddress) -> Self{
        va.0
    }
}

impl VirtualAddress{
    fn into(&self) -> u64{
        self.0
    }

    fn extract_bit(&mut self, level:usize) -> u64{
        let shift = PGSHIFT;
        let mut va = self.into();
        va = va >> shift;
        va.set_bits(..9, 0x1FF);
        va
    }
}

impl PhysicalAddress{
    fn into(&self) -> u64{
        self.0
    }
}