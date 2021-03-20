use core::ptr::NonNull;
use crate::lock::sleeplock::{Sleeplock, SleeplockGuard};

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