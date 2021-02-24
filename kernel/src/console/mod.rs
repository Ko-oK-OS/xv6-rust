mod uart;

pub fn consputc(c: u8) {
    uart::uartputc(c);
}

// must be called only once in rmain.rs:rust_main
pub unsafe fn consoleinit() {
    uart::uartinit();
}
