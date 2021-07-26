use core::convert::From;

use crate::memory::address::Addr;

pub mod memlayout;
pub mod param;
pub mod virtio;
pub mod fs;
pub mod e1000;
pub mod devices;

#[repr(C)]
#[derive(Copy, Clone, Eq, PartialEq)]
pub struct Address(usize);

impl Addr for Address{
    #[inline]
    fn as_usize(&self) -> usize{
        self.0
    }

    #[inline]
    fn data_ref(&self) -> &usize{
        &self.0
    }

    #[inline]
    fn data_mut(&mut self) -> &mut usize{
        &mut self.0
    }
}

impl Address {
    pub const fn add_addr(&self, x:usize) -> Self {
        Self(self.0 + x)
    }

}

impl From<Address> for usize {
    fn from(addr: Address) -> Self{
        addr.0
    }
}