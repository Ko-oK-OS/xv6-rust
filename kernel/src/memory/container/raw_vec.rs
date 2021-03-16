use core::ptr::{Unique, NonNull};
use crate::memory::kalloc::kalloc;

#[allow(missing_debug_implementations)]
pub struct RawVec<T>{
    ptr: Unique<T>,
    cap: usize
}

impl<T> RawVec<T>{
    pub const NEW: Self = Self::new();

    #[inline]
    pub const fn new() -> Self{
        Self::new_in()
    }

    #[inline]
    pub const fn new_in() -> Self{
        Self{
            ptr: Unique::dangling(),
            cap: 0
        }
    }

    #[inline]
    pub fn capacity(&self) -> usize{
        self.cap
    }

    #[inline]
    pub fn as_ptr(&self) -> *mut T{
        self.ptr.as_ptr()
    }

    fn set_ptr(&mut self, ptr:NonNull<u8>){
        self.ptr  = unsafe{
            Unique::new_unchecked(ptr.cast().as_ptr())
        };
        self.cap = 4096;
    }

    pub unsafe fn reserve(&mut self, len:usize, additional:usize){
        if self.cap == 0{
            match kalloc(){
                Some(ptr) => {
                    self.set_ptr(NonNull::new(ptr).unwrap());
                }
                None => panic!("Fail to allocate memory!")
            }
        }else if len + additional > 4096{
            panic!("Can't to allocate memory over page size!")
        }
    }
}

// Central function for reserve error handling.
// #[inline]
// fn handle_reserve(result: Result<(), TryReserveError>) {
//     match result {
//         Err(CapacityOverflow) => capacity_overflow(),
//         Err(AllocError { layout, .. }) => handle_alloc_error(layout),
//         Ok(()) => { /* yay */ }
//     }
// }