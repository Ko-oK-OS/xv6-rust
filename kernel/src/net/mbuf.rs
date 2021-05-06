use alloc::boxed::Box;

const MBUF_SIZE:usize = 2048;
const MBUF_DEFAULT_HEADROOM:usize = 128;

pub struct MBuf {
    next: Option<Box<*mut MBuf>>, // the next mbuf in the chain
    head: *mut u8, // the current start position of the buffer
    len: u32, // the length of the buffer
    buf: [u8;MBUF_SIZE], // the backing store
}

impl MBuf {
    
}