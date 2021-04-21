//! sleeplock

use core::ops::{Deref, DerefMut, Drop};
use core::sync::atomic::{AtomicBool, fence, Ordering};
use core::cell::{Cell, UnsafeCell};

use crate::process::{push_off, pop_off};

pub struct SleepChannel(u8);

pub struct SleepLock<T: ?Sized> {
    lock: AtomicBool,
    locked: Cell<bool>,
    chan: SleepChannel,
    name: &'static str,
    data: UnsafeCell<T>,
}

unsafe impl<T: ?Sized + Sync> Sync for SleepLock<T> {}
// not needed
// unsafe impl<T: ?Sized + Sync> Send for SleepLock<T> {}

impl<T> SleepLock<T> {
    pub const fn new(data: T, name: &'static str) -> Self {
        Self {
            lock: AtomicBool::new(false),
            locked: Cell::new(false),
            chan: SleepChannel(0),
            name,
            data: UnsafeCell::new(data),
        }
    }
}

impl<T: ?Sized> SleepLock<T> {
    /// non-blocking, but might sleep if other p lock this sleeplock
    pub fn lock(&self) -> SleepLockGuard<T> {
        self.acquire();
        while self.locked.get() {
            self.sleep();
        }
        self.locked.set(true);
        self.release();
        SleepLockGuard {
            lock: &self,
            data: unsafe { &mut *self.data.get() }
        }
    }

    fn sleep(&self) {
        // TODO
    }

    /// Called by its guard when dropped
    fn unlock(&self) {
        self.acquire();
        self.locked.set(false);
        self.wakeup();
        self.release();
    }

    fn wakeup(&self) {
        // TODO
    }

    /// Always test holding might not be efficient
    fn holding(&self) -> bool {
        self.lock.load(Ordering::Relaxed)
    }

    fn acquire(&self) {
        push_off();
        if self.holding() {
            panic!("sleeplock {} acquire", self.name);
        }
        while self.lock.compare_and_swap(false, true, Ordering::Acquire) {}
        fence(Ordering::SeqCst);
    }

    fn release(&self) {
        if !self.holding() {
            panic!("sleeplock {} release", self.name);
        }
        fence(Ordering::SeqCst);
        self.lock.store(false, Ordering::Release);
        pop_off();
    }
}

pub struct SleepLockGuard<'a, T: ?Sized + 'a> {
    lock: &'a SleepLock<T>,
    data: &'a mut T,
}

impl<'a, T: ?Sized> Deref for SleepLockGuard<'a, T> {
    type Target = T;
    fn deref(&self) -> &T {
        &*self.data
    }
}

impl<'a, T: ?Sized> DerefMut for SleepLockGuard<'a, T> {
    fn deref_mut(&mut self) -> &mut T {
        &mut *self.data
    }
}

impl<'a, T: ?Sized> Drop for SleepLockGuard<'a, T> {
    /// The dropping of the SpinLockGuard will call spinlock's release_lock(),
    /// through its reference to its original spinlock.
    fn drop(&mut self) {
        self.lock.unlock();
    }
}
