//! buffer cache layer

use array_macro::array;

use core::ptr;
use core::ops::{Deref, DerefMut};
use core::sync::atomic::{Ordering, AtomicBool};

use crate::lock::sleeplock::{SleepLock, SleepLockGuard};
use crate::lock::spinlock::Spinlock;
use crate::driver::virtio_disk::DISK;
use crate::define::fs::{NBUF, BSIZE};

pub static BCACHE: Bcache = Bcache::new();

pub struct Bcache {
    ctrl: Spinlock<BufLru>,
    bufs: [BufInner; NBUF],
}

impl Bcache {
    const fn new() -> Self {
        Self {
            ctrl: Spinlock::new(BufLru::new(), "BufLru"),
            bufs: array![_ => BufInner::new(); NBUF],
        }
    }

    /// Init the bcache.
    /// Should only be called once when the kernel inits itself.
    pub fn binit(&self) {
        println!("binit......");
        let mut ctrl = self.ctrl.acquire();
        let len = ctrl.inner.len();

        // init the head and tail of the lru list
        ctrl.head = &mut ctrl.inner[0];
        ctrl.tail = &mut ctrl.inner[len-1];

        // init prev and next field
        ctrl.inner[0].prev = ptr::null_mut();
        ctrl.inner[0].next = &mut ctrl.inner[1];
        ctrl.inner[len-1].prev = &mut ctrl.inner[len-2];
        ctrl.inner[len-1].next = ptr::null_mut();
        for i in 1..(len-1) {
            ctrl.inner[i].prev = &mut ctrl.inner[i-1];
            ctrl.inner[i].next = &mut ctrl.inner[i+1];
        }
        
        // init index
        ctrl.inner.iter_mut()
            .enumerate()
            .for_each(|(i, b)| b.index = i);
    }

    fn bget(&self, dev: u32, blockno: u32) -> Buf<'_> {
        let mut ctrl = self.ctrl.acquire();

        // find cached block
        match ctrl.find_cached(dev, blockno) {
            Some((index, rc_ptr)) => {
                // found
                drop(ctrl);
                Buf {
                    index,
                    dev,
                    blockno,
                    rc_ptr,
                    data: Some(self.bufs[index].data.lock())
                }
            }
            None => {
                // not cached
                // recycle the least recently used (LRU) unused buffer
                match ctrl.recycle(dev, blockno) {
                    Some((index, rc_ptr)) => {
                        self.bufs[index].valid.store(false, Ordering::Relaxed);
                        drop(ctrl);
                        return Buf {
                            index,
                            dev,
                            blockno,
                            rc_ptr,
                            data: Some(self.bufs[index].data.lock()),
                        }
                    }
                    None => panic!("no usable buffer")
                }
            }
        }
    }

    /// Get the buf from the cache/disk
    pub fn bread<'a>(&'a self, dev: u32, blockno: u32) -> Buf<'a> {
        let mut b = self.bget(dev, blockno);
        if !self.bufs[b.index].valid.load(Ordering::Relaxed) {
            DISK.rw(&mut b, false);
            self.bufs[b.index].valid.store(true, Ordering::Relaxed);
        }
        b
    }

    /// Move an unlocked buf to the head of the most-recently-used list.
    fn brelse(&self, index: usize) {
        self.ctrl.acquire().move_if_no_ref(index);
    }
}

/// A wrapper of raw buf data.
pub struct Buf<'a> {
    index: usize,
    dev: u32,
    blockno: u32,
    rc_ptr: *mut usize,     // pointer to its refcnt in BufCtrl
    /// Guaranteed to be Some during Buf's lifetime.
    /// Introduced to let the sleeplock guard drop before the whole struct.
    data: Option<SleepLockGuard<'a, BufData>>,
}

impl<'a> Buf<'a> {
    pub fn read_blockno(&self) -> u32 {
        self.blockno
    }

    pub fn bwrite(&mut self) {
        DISK.rw(self, true);
    }

    /// Gives out a raw const pointer at the buf data. 
    pub fn raw_data(&self) -> *const BufData {
        let guard = self.data.as_ref().unwrap();
        guard.deref()
    }

    /// Gives out a raw mut pointer at the buf data. 
    pub fn raw_data_mut(&mut self) -> *mut BufData {
        let guard = self.data.as_mut().unwrap();
        guard.deref_mut()
    }

    /// Pin the buf.
    /// SAFETY: it should be definitly safe.
    ///     Because the current refcnt >= 1, so the rc_ptr is valid.
    pub unsafe fn pin(&self) {
        let rc = *self.rc_ptr;
        *self.rc_ptr = rc + 1;
    }

    /// Unpin the buf.
    /// SAFETY: it should be called matching pin.
    pub unsafe fn unpin(&self) {
        let rc = *self.rc_ptr;
        if rc <= 1 {
            panic!("buf unpin not match");
        }
        *self.rc_ptr = rc - 1;
    }
}

impl<'a> Drop for Buf<'a> {
    fn drop(&mut self) {
        drop(self.data.take());
        BCACHE.brelse(self.index);        
    }
}

struct BufLru {
    inner: [BufCtrl; NBUF],
    head: *mut BufCtrl,
    tail: *mut BufCtrl,
}

/// Raw pointers are automatically thread-unsafe.
/// See doc https://doc.rust-lang.org/nomicon/send-and-sync.html.
unsafe impl Send for BufLru {}

impl BufLru {
    const fn new() -> Self {
        Self {
            inner: array![_ => BufCtrl::new(); NBUF],
            head: ptr::null_mut(),
            tail: ptr::null_mut(),
        }
    }

    /// Find if the requested block is cached.
    /// Return its index and incr the refcnt if found.
    fn find_cached(&mut self, dev: u32, blockno: u32) -> Option<(usize, *mut usize)> {
        let mut b = self.head;
        while !b.is_null() {
            let bref = unsafe { b.as_mut().unwrap() };
            if bref.dev == dev && bref.blockno == blockno {
                bref.refcnt += 1;
                return Some((bref.index, &mut bref.refcnt));
            }
            b = bref.next;
        }
        None
    }

    /// Recycle an unused buffer from the tail.
    /// Return its index if found.
    fn recycle(&mut self, dev: u32, blockno: u32) -> Option<(usize, *mut usize)> {
        let mut b = self.tail;
        while !b.is_null() {
            let bref = unsafe { b.as_mut().unwrap() };
            if bref.refcnt == 0 {
                bref.dev = dev;
                bref.blockno = blockno;
                bref.refcnt += 1;
                return Some((bref.index, &mut bref.refcnt));
            }
            b = bref.prev;
        }
        None
    }

    /// Move an entry to the head if no live ref.
    fn move_if_no_ref(&mut self, index: usize) {
        let b = &mut self.inner[index];
        b.refcnt -= 1;
        if b.refcnt == 0 && !ptr::eq(self.head, b) {
            // forward the tail if b is at the tail
            // b may be the only entry in the lru list
            if ptr::eq(self.tail, b) && !b.prev.is_null() {
                self.tail = b.prev;
            }
            
            // detach b
            unsafe {
                b.next.as_mut().map(|b_next| b_next.prev = b.prev);
                b.prev.as_mut().map(|b_prev| b_prev.next = b.next);
            }

            // attach b
            b.prev = ptr::null_mut();
            b.next = self.head;
            unsafe {
                self.head.as_mut().map(|old_head| old_head.prev = b);
            }
            self.head = b;
        }
    }
}

struct BufCtrl {
    dev: u32,
    blockno: u32,
    prev: *mut BufCtrl,
    next: *mut BufCtrl,
    refcnt: usize,
    index: usize,
}

impl BufCtrl {
    const fn new() -> Self {
        Self {
            dev: 0,
            blockno: 0,
            prev: ptr::null_mut(),
            next: ptr::null_mut(),
            refcnt: 0,
            index: 0,
        }
    }
}

pub struct BufInner {
    // valid is guarded by
    // the bcache spinlock and the relevant buf sleeplock
    // holding either of which can get access to them
    pub(crate) valid: AtomicBool,
    pub(crate) data: SleepLock<BufData>,
}

impl BufInner {
    const fn new() -> Self {
        Self {
            valid: AtomicBool::new(false),
            data: SleepLock::new(BufData::new(), "BufData"),
        }
    }
}

/// Alignment of BufData should suffice for other structs
/// that might converts from this struct.
#[repr(C, align(8))]
pub struct BufData([u8; BSIZE]);

impl  BufData {
    const fn new() -> Self {
        Self([0; BSIZE])
    }
}
