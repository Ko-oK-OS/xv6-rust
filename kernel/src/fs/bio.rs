use crate::define::param::NBUF;
use crate::lock::sleeplock::*;
use super::*;

use array_macro::array;

pub struct Bcache {
    pub buf: [Buf; NBUF],
    pub head: Buf
}

pub static mut BCACH:SleepLock<Bcache> = SleepLock::new(Bcache::new(), "bcache");


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

