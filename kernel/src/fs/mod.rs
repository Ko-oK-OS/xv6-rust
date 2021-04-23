use core::ptr::NonNull;
// use crate::lock::sleeplock::{Sleeplock, SleeplockGuard};

mod bio;
pub use bio::*;

pub const BSIZE:usize = 1024;
pub struct Buf{
    valid:usize, // has data been read from disk?
    disk:usize,  // does disk "own" buf?
    dev:usize,
    blockno:usize,
    refcnt:usize,
    prev: Option<NonNull<Buf>>, // LRU cache list
    next: Option<NonNull<Buf>>,
    data: [u8;BSIZE]
}

impl Buf {
    const fn new() -> Self {
        Self {
            valid: 0,
            disk: 0,
            dev: 0,
            blockno: 0,
            refcnt: 0,
            prev: None,
            next: None,
            data: [0;BSIZE]
        }
    }
}