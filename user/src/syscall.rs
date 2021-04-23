global_asm!(include_str!("usys.S"));

extern "C" {
    pub fn __fork() -> isize;
}

pub fn fork() -> isize{
    unsafe {
        __fork()
    }
}