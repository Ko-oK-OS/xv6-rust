use crate::define::param::NBUF;
use crate::lock::sleeplock::*;
use super::*;

use array_macro::array;

pub struct Bcache {
    pub buf: [Buf; NBUF],
    pub head: Buf
}

pub struct BcacheList {
    pub list: SleepLock<Bcache>
}

// pub static mut BCACH:SleepLock<Bcache> = SleepLock::new(Bcache::new(), "bcache");
pub static mut BCACHELIST:BcacheList = BcacheList::new();

impl Bcache {
    const fn new() -> Self {
        Self{
            buf: array![_ => Buf::new(); NBUF],

            // Linked list of all buffers, through prev/next.
            // Sorted by how recently the buffer was used.
            // head.next is most recent, head.prev is least.
            head: Buf::new()
        }
    }

}

impl BcacheList  {
    pub const fn new() -> Self {
        let table = Bcache::new();
        Self {
            list: SleepLock::new(table, "bcachelist")
        }
    }


    pub fn binit(&mut self) {
        // Create linked list of buffers. 
        println!("binit......");
        let mut guard = self.list.lock();

        // get the pointer of bcache head
        let head_ptr = &mut guard.head as *mut Buf;

        guard.head.prev = NonNull::new(head_ptr);
        guard.head.next = NonNull::new(head_ptr);

        for i in 0..NBUF {
            guard.buf[i].next = guard.head.next;
            guard.buf[i].prev = NonNull::new(head_ptr);

            unsafe{
                guard.head.next.unwrap().as_mut().prev = NonNull::new(&mut guard.buf[i] as *mut Buf);
            }
            guard.head.next = NonNull::new(&mut guard.buf[i] as *mut Buf);
        }

        drop(guard);

    }

    // Look through buffer cache for block on device dev.
    // If not found, allocate a buffer.
    // In either case, return locked buffer.
    pub unsafe fn bget(&mut self, dev:usize, blockno:usize) -> Option<*mut Buf> {
        let mut bcache_list = self.list.lock();

        // Is the block already cached?
        let mut b = bcache_list.head.next.unwrap().as_ptr();
        let head_ptr = &mut bcache_list.head as *mut Buf;
        while b != head_ptr {
            if (*b).dev == dev && (*b).blockno == blockno {
                (*b).refcnt = (*b).refcnt + 1; 
                drop(bcache_list);
                // TODO: acquiresleep
                return Some(b)
            }
            b = (*b).next.unwrap().as_ptr();
        }

        // Not cached
        // Recycle the least latest used(LRU) unused buffer. 
        let mut b = bcache_list.head.prev.unwrap().as_ptr();
        while b != head_ptr {
            if (*b).refcnt == 0 {
                (*b).dev = dev;
                (*b).blockno = blockno;
                (*b).valid = 0;
                (*b).refcnt = 1;
                drop(bcache_list);
                // TODO: acquiresleep
                return Some(b)
            }
            b = (*b).prev.unwrap().as_ptr();
        }

        panic!("bget(): no buffers");
    }

}

