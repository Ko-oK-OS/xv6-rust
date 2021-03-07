use core::ptr::{Unique, write};
use core::ops::{Deref, DerefMut};

use crate::memory::kalloc::kalloc;
pub struct Box<T: ?Sized>(Unique<T>);

impl<T> Box<T>{
    pub unsafe fn new(x: T) -> Option<Box<T>>{
        match kalloc(){
            Some(ptr) => {
                write(ptr as *mut T, x);
                Some(Self(Unique::new(ptr as *mut T).unwrap()))
            }
            None => None
        }
    }
}

impl<T> Deref for Box<T>{
    type Target = T;

    fn deref(&self) -> &T{
        unsafe {self.0.as_ref()}
    }
}


impl<T> DerefMut for Box<T> {
    fn deref_mut(&mut self) -> &mut T {
        unsafe { self.0.as_mut() }
    }
}

