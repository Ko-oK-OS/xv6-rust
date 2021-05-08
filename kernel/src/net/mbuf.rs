use alloc::boxed::Box;
use core::ptr::drop_in_place;

const MBUF_SIZE:usize = 2048;
const MBUF_DEFAULT_HEADROOM:usize = 128;

pub struct MBuf {
    next: Option<Box<*mut MBuf>>, // the next mbuf in the chain
    head: *mut u8, // the current start position of the buffer
    pub len: u32, // the length of the buffer
    buf: [u8;MBUF_SIZE], // the backing store
}

impl MBuf {
    // pub fn new() -> Self {
    //     match Self::allocate(MBUF_SIZE as u32) {
    //         Ok(m) => {
                
    //         }

    //         Err(err) => {
    //             panic!("err: {}.", err);
    //         }
    //     }
    // }

    // Strips data from start of the buffer and returns a pointer to it. 
    // Returns 0 if less than the full requestes length is available. 
    pub fn pull(&mut self, len:u32) -> Option<*mut u8> {
        let tmp = self.head;
        if self.len < len {
            return None
        }
        self.len -= len;
        self.head = (self.head as usize + len as usize) as *mut u8;
        Some(tmp)
    }

    // Prepends data to the beginning of the buffer and returns a pointer to it. 
    pub fn push(&mut self, len:u32) -> *mut u8 {
        self.head = (self.head as usize - len as usize) as *mut u8;
        if (self.head as usize) < (self.buf.as_ptr() as usize) {
            panic!("mbuf_push():");
        }
        self.len += len;
        self.head
    }

    // Appends data to the end of the buffer and returns a pointer to it. 
    pub fn put(&mut self, len:u32) -> *mut u8 {
        let tmp = (self.head as usize + self.len as usize) as *mut u8;
        self.len += len;
        if self.len as usize > MBUF_SIZE {
            panic!("MBUF put(): len out of the limit of MBUF_SIZE.");
        }

        tmp
    }

    // Allocates a packet buffer. 
    pub fn allocate(headroom:u32) -> Result<Box<Self>, &'static str> {
        if headroom as usize > MBUF_SIZE {
            return Err("headroom is larger than MBUF_SIZE.")
        }
        
        let mut m = unsafe{ Box::<MBuf>::new_zeroed().assume_init() };
        m.next = None;
        m.head = ((m.buf.as_ptr() as usize) + headroom as usize) as *mut u8;
        m.len = 0;

        Ok(m)
    }

    // Frees a packet buffer
    pub fn free(&mut self) {
        let ptr = self as *mut Self;
        drop(ptr);
    }

    // Strips data from the end of the buffer and returns a pointer to it.
    // Returns 0 if less than the full requested length is available. 
    pub fn trim(&mut self, len:u32) -> Option<*mut u8> {
        if len > self.len {
            return None
        }

        self.len -= len;
        Some((self.head as usize + self.len as usize) as *mut u8)
    }

    pub fn e1000_transmit(&mut self) -> Result<(), &'static str> {
        Ok(())
    }
}