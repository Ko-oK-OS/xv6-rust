use core::sync::atomic::{AtomicBool, Ordering};
use core::hint::spin_loop;
use core::cell::{Cell, UnsafeCell};
use core::ops::{Deref, DerefMut};

#[derive(Debug,Default)]
pub struct Spinlock<T: ?Sized>{
    locked:AtomicBool,
    name: &'static str,
    cpu_id: isize,
    data:UnsafeCell<T>,
}

pub struct SpinlockGuard<'a, T>{
    spinlock:&'a Spinlock<T>
}

impl<T> Spinlock<T>{

    pub const fn new(data: T, name: &'static str) -> Self {
        let lock = Spinlock {
            locked: AtomicBool::new(false),
            name: name,
            cpu_id:-1,
            data: UnsafeCell::new(data)
        };
        lock
    }

    pub fn acquire(&self) -> SpinlockGuard<'_, T> {
        while self.locked.swap(true, Ordering::Acquire){
            // Now we signals the processor that it is inside a busy-wait spin-loop 
            spin_loop();
        }
        SpinlockGuard{spinlock: &self}
    }

    pub fn release(&self) {
        self.locked.store(false, Ordering::Release);
    }


}

impl<T> Deref for SpinlockGuard<'_, T>{
    type Target = T;

    fn deref(&self) -> &Self::Target {
        unsafe{
            &*self.spinlock.data.get()
        }
    }
}   

impl<T> DerefMut for SpinlockGuard<'_, T>{
    fn deref_mut(&mut self) -> &mut Self::Target{
        unsafe{
            &mut *self.spinlock.data.get()
        }
    }
}

impl<T> Drop for SpinlockGuard<'_, T>{
    fn drop(&mut self){
        self.spinlock.release()
    }
}


// We need to force Send and Sync traits because our mutex has
// UnsafeCell, which don't realize it
// As long as T: Send, it's fine to send and share Mutex<T> between threads

unsafe impl<T> Send for Spinlock<T> where T: Send{}
unsafe impl<T> Sync for Spinlock<T> where T: Send{}

unsafe impl<T> Send for SpinlockGuard<'_, T> where T: Send{}
unsafe impl<T> Sync for SpinlockGuard<'_, T> where T: Send+Sync{}




