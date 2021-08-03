use core::alloc::{ GlobalAlloc, Layout };
use core::cell::UnsafeCell;
use core::mem::size_of;
use super::*;
use spin::Mutex;

const PAGE_SZIE: usize = 4096;

pub struct Heap (Mutex<UserAllocator>);

/// User memory allocator based on linked list.
pub struct UserAllocator {
    base: UnsafeCell<Frame>
}

/// Frame record every memory allocation information,
/// which will write in the header of allocate memory.
#[repr(C)]
#[derive(Clone, Copy)]
pub struct Frame {
    addr: *mut u8,
    size: usize,
    next: Option<*mut Frame>,
    prev: Option<*mut Frame>
}

#[global_allocator]
pub static HEAP: Heap = Heap::new();

#[alloc_error_handler]
fn alloc_error_handler(layout: Layout) -> ! {
    panic!("alloc error: {:?}", layout);
}

unsafe impl GlobalAlloc for Heap {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        self.0.lock().malloc(layout.size())
    }

    unsafe fn dealloc(&self, ptr: *mut u8, layout: Layout) {
        self.0.lock().free(ptr, layout.size())
    }
}


impl Heap {
    const fn new() -> Self {
        Self(
            Mutex::new(UserAllocator::init())
        )
    }
}

impl Frame {
    const fn uninit() -> Self {
        Self {
            addr: 0 as *mut u8,
            size: 0,
            prev: None,
            next: None
        }
    }
}


impl UserAllocator {
    const fn init() -> Self {
        Self {
            base: UnsafeCell::new(
                Frame {
                    addr: 0 as *mut u8,
                    size: 0,
                    next: None,
                    prev: None
                }
            )
        }
    }


    /// raw allocate by sbrk system call, return a pointer 
    /// which point current frame. 
    pub fn raw_alloc(&self, mut bytes: usize) -> *mut u8 {
        bytes = size_of::<Frame>() + bytes;
        if bytes < PAGE_SZIE {
            bytes = PAGE_SZIE;
        }

        let addr = sbrk(bytes);
        if addr <= 0 {
            panic!("Fail to sbrk");
        }
        let frame = unsafe{ &mut *(addr as *mut Frame) };
        frame.size = bytes - size_of::<Frame>();
        frame.addr = (addr as usize + size_of::<Frame>()) as *mut u8;
        frame.next = None;
        return addr as *mut u8;
    }

    /// Circular linked list to find free memory area, 
    /// otherwise increase process memory by sbrk system call.
    pub fn malloc(&mut self, bytes: usize) -> *mut u8 {
        let mut prev: &mut Frame = &mut Frame::uninit();
        let mut frame = unsafe{ &mut *self.base.get() };
        while frame.next != None {
            if frame.size >= bytes {
                // When the left size of frame is equal to bytes,
                // we remove this frame from linked list and return
                // current frame address. 
                if frame.size == bytes {
                    prev.next = Some(frame);
                    if let Some(next) = frame.next {
                        unsafe {
                            (&mut *next).prev = Some(frame);
                        }
                    }
                } else {
                    // When the left size of frame are more than bytes,
                    // we modify the position and information of current 
                    // frame and update linked list information. 
                    frame.size -= bytes;
                    frame.addr = unsafe{ frame.addr.offset(bytes as isize) };
                    unsafe {
                        let new_frame = &mut *(frame.addr
                                                .offset(-1 * size_of::<Frame>() as isize) 
                                                as *mut Frame);
                        new_frame.size = frame.size;
                        new_frame.addr = frame.addr;
                        new_frame.next = frame.next;
                        new_frame.prev = frame.prev;

                        frame = new_frame;
                    }
                }
                return frame.addr
            }
            prev = frame;
            frame = unsafe{ &mut *prev.next.unwrap() };
        }
        let addr = self.raw_alloc(bytes);
        let frame = addr as *mut Frame;
        prev.next = Some(frame);
        let frame = unsafe {
            &mut *frame
        };
        frame.prev = Some(frame);
        unsafe{ addr.offset(size_of::<Frame>() as isize) }
    }

    /// Free memory by pointer to get special frame information,
    /// we can update the position and information of current frame,
    /// and we also need update linked list. 
    pub fn free(&self, ptr: *mut u8, bytes: usize) {
        let addr = unsafe{ ptr.offset(-1 * size_of::<Frame>() as isize) };
        let frame = unsafe {
            &mut *(addr as *mut Frame)
        };

        frame.size = frame.size + bytes;
        frame.addr = unsafe{ frame.addr.offset(-1 * bytes as isize) };

        let new_frame = unsafe {
            &mut *(addr.offset(-1 * bytes as isize) as *mut Frame)
        };
        new_frame.addr = frame.addr;
        new_frame.size = frame.size;
        new_frame.prev = frame.prev;
        new_frame.next = frame.next;

        let prev = unsafe{ &mut *new_frame.prev.unwrap() };
        prev.next = Some(new_frame as *mut Frame);

        let next = unsafe{ &mut *new_frame.next.unwrap() };
        next.prev = Some(new_frame as *mut Frame)
    }
}

unsafe impl Send for UserAllocator {}