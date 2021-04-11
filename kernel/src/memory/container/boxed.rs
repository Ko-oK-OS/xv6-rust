use core::ptr::{Unique, write};
use core::ops::{Deref, DerefMut};
use core::mem;

use crate::memory::{
    kalloc::{ kalloc, kfree},
    address::PhysicalAddress
};

#[derive(Clone)]
pub struct Box<T: ?Sized>(Unique<T>);

impl<T> Box<T>{
    pub unsafe fn new() -> Option<Box<T>> {
        match kalloc(){
            Some(ptr) => {
                // write(ptr as *mut T, x);
                Some(Self(Unique::new(ptr as *mut T).unwrap()))
            }
            None => None
        }
    }

    pub unsafe fn new_ptr(x: T) -> Option<Box<T>> {
        match kalloc() {
            Some(ptr) => {
                write(ptr as *mut T, x);
                Some(Self(Unique::new(ptr as *mut T).unwrap()))
            }

            None => None
        }
    }

    pub fn into_raw(self) -> *mut T{
        let ptr = self.0.as_ptr();
        mem::forget(self);
        ptr
    }
}

impl<T: ?Sized> Drop for Box<T>{
    fn drop(&mut self){
        unsafe{kfree(PhysicalAddress::new((self.0.as_ptr() as *mut u8) as usize))}
        println!("Box is droped");
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

