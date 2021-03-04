use core::convert::From;

pub mod memlayout;
pub mod param;
pub mod virtio;


#[repr(C)]
#[derive(Copy, Clone, Eq, PartialEq)]
pub struct Address(usize);

impl Address {
    pub const fn add_addr(&self, x:usize) -> Self {
        Self(self.0 + x)
    }

    pub fn into(&self) -> usize{
        self.0
    }

}

impl From<Address> for usize {
    fn from(addr: Address) -> Self{
        addr.0
    }
}