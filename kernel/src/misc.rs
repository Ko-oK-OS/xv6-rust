use core::ptr::read;
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