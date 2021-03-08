use core::sync::atomic::{AtomicBool, Ordering};
use super::spinlock::Spinlock;

pub struct SleeplockInner{
    locked: AtomicBool, // Is the lock held?
    pid: usize // Process holding lock
}

impl SleeplockInner{
    pub fn new() -> Self{
        Self{
            locked: AtomicBool::new(false),
            pid: 0
        }
    }
}

// Long-term locks for processes
pub struct Sleeplock{
    inner: Spinlock<SleeplockInner>, // spinlock protecting this sleep lock
    name: &'static str // Name of lock.
}

pub struct SleeplockGuard<'a>{
    sleeplock:&'a Sleeplock
}

impl Sleeplock {
    pub fn new(name: &'static str) -> Self{
        Self{
            inner: Spinlock::new(SleeplockInner::new(), "sleep lock"),
            name: name
        }
    }

    pub fn acquire(&self) -> SleeplockGuard<'_>{
        let mut spin_guard = self.inner.acquire();
        while !spin_guard.locked.swap(true, Ordering::AcqRel){
            // TODO: sleep in process
            println!("TODO: sleep process")
        }
        spin_guard.locked.store(true, Ordering::AcqRel);
        // TODO: modify process id
        spin_guard.pid = 0;
        SleeplockGuard{
            sleeplock: self
        }
    }

    pub fn release(&self){
        self.inner.release()
    }
}

