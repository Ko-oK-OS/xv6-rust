use core::sync::atomic::{AtomicBool, Ordering};
use core::cell::{Cell, UnsafeCell};
use core::ops::{Deref, DerefMut};
use crate::process::cpu::CPU;

pub struct Spinlock<T: ?Sized>{
    locked:AtomicBool,
    name: &'static str,
    cpu_id: usize,
    data:UnsafeCell<T>,
}

impl<T> Spinlock<T>{

    pub fn new(data: T, name: &'static str) -> Spinlock<T> {
        let lock = Spinlock {
            locked: AtomicBool::new(false),
            name: name,
            cpu_id:0,
            data: UnsafeCell::new(data)
        };
        lock
    }


}