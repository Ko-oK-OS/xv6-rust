use core::convert::From;

pub mod memlayout;
pub mod param;


#[repr(C)]
#[derive(Copy, Clone, Eq, PartialEq)]
pub struct Address(usize);

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