use core::ptr::read;
use core::cmp::Ord;
use core::ptr::{ write, write_bytes };

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
pub fn mem_copy(dst: usize, src: usize, len: usize) {
    unsafe{
        for i in 0..len {
            let val = read((src + i) as *const u8);
            write((dst + i) as *mut u8, val);
        }
    }
}

/// memory set, write special bytes into address. 
pub fn mem_set(dst: *mut u8, value: u8, len: usize) -> *mut u8 {
    unsafe{ 
        write_bytes(dst, value, len) 
    };
    dst
}

/// Compare str
pub fn str_cmp(a: &[u8], b: &[u8], max_len: usize) -> bool {
    if a.len() != b.len() {
        return false
    }

    if a.len() > max_len {
        return false
    }

    for i in 0..a.len() {
        if a[i] != b[i] {
            return false
        }
    }
    true
}