use core::ptr::read;
use core::cmp::Ord;
use core::ptr::write;

pub fn min<T>(a: T, b: T) -> T 
    where T: Ord
{
    if a < b {
        return a
    }
    b
}

pub fn str_len(str: *const u8) -> usize {
    let mut i:usize = 0;
    loop {
       let ptr = (str as usize + i) as *const u8;
       let c = unsafe {
           read(ptr)
       };
       if c != 0 { i += 1; }
       else { break; }
    }
    i
}

/// memory copy, copy memory into other memory. 
pub(crate) unsafe fn mem_copy(dst: usize, src: usize, len: usize) {
    for i in 0..len {
        let val = read((src + i) as *const u8);
        write((dst + i) as *mut u8, val);
    }
}