use core::ptr::{Unique};

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
}