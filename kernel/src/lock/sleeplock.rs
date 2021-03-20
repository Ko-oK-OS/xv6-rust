use core::sync::atomic::{AtomicBool, Ordering};
use core::cell::{Cell, UnsafeCell};
use core::ops::{Deref, DerefMut, Drop};
use super::spinlock::Spinlock;


// Long-term locks for processes
pub struct Sleeplock<T: ?Sized>{
    lock: Spinlock<()>,
    locked: Cell<bool>,
    name: &'static str, // Name of lock.
    data: UnsafeCell<T>
}

unsafe impl<T: ?Sized + Send> Sync for Sleeplock<T> {}

pub struct SleeplockGuard<'a, T: ?Sized> {
    lock: &'a Sleeplock<T>,
    data: &'a mut T,
}

impl<T> Sleeplock<T> {
    fn new(data: T, name: &'static str) -> Self{
        Self{
            lock: Spinlock::new((), "sleeplock"),
            locked: Cell::new(false),
            name,
            data: UnsafeCell::new(data)
        }
    }

    fn acquire(&self) -> SleeplockGuard<'_, T>{
        let mut guard = self.lock.acquire();
        while self.locked.get(){
            unsafe{
                // TODO: process
                println!("TO DO!");
            }
            guard = self.lock.acquire();
        }
        self.locked.set(true);
        drop(guard);
        SleeplockGuard{
            lock: &self,
            data: unsafe{&mut *self.data.get()}
        }
    }

    fn release(&self){
        let guard = self.lock.acquire();
        self.locked.set(false);
        self.wakeup();
        drop(guard);
    }

    fn wakeup(&self){
        println!("wake up!");
    }
}




impl<'a, T: ?Sized> Deref for SleeplockGuard<'a, T> {
    type Target = T;
    fn deref(&self) -> &T {
        &*self.data
    }
}

impl<'a, T: ?Sized> DerefMut for SleeplockGuard<'a, T> {
    fn deref_mut(&mut self) -> &mut T {
        &mut *self.data
    }
}

// impl<'a, T: ?Sized> Drop for SleeplockGuard<'a, T> {
//     /// The dropping of the SpinLockGuard will call spinlock's release_lock(),
//     /// through its reference to its original spinlock.
//     fn drop(&mut self) {
//         self.lock.release();
//     }
// }


