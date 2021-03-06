use core::ptr::{Unique, write};

use crate::memory::kalloc;
pub struct Box<T: ?Sized>(Unique<T>);

impl<T> Box<T>{
    pub fn new(x: T) -> Option<Box<T>>{
        match unsafe{kalloc::kalloc()}{
            Some(ptr) => {
                write(ptr as *mut T, x);
                Some(Unique::new(ptr as *mut T))
            }
            None => None
        }
    }
}