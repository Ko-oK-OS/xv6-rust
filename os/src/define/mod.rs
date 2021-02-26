use core::ops::Add;

pub mod memlayout;

pub struct Address(usize);

impl Address {
    pub fn add_addr(&mut self, x:usize) -> Address {
        Address(self.0 + x)
    }
}