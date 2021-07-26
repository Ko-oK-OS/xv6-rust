use crate::console::console_write;

pub fn console_write_test() {
    println!("console write test.");
    let s = "hello world".as_bytes();
    console_write(true, s.as_ptr() as usize, s.len());
}