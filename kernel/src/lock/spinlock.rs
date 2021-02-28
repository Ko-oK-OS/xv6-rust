use core::sync::atomic::{AtomicBool};
use core::cell::{Cell, UnsafeCell};
use crate::process::cpu::CPU;

pub struct Spinlock<T: ?Sized>{
    locked:AtomicBool,
    name: &'static str,
    data:UnsafeCell<T>,
    cpu:CPU
}