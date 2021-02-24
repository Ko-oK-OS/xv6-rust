// use crate::consts::CONSOLE_BUF as INPUT_BUF;
// use crate::spinlock::SpinLock;

mod uart;

// struct Cons {
//     buf: [u8; INPUT_BUF],
//     r: usize, // Read index
//     w: usize, // Write index
//     e: usize, // Edit index
// }

// static CONS: SpinLock<Cons> = SpinLock::new(
//     Cons {
//         buf: [0; INPUT_BUF],
//         r: 0,
//         w: 0,
//         e: 0,
//     },
//     "cons",
// );

// fn consputbs() {
//     // b'\b' not supported in rust
//     const BACKSPACE: u8 = 8;
//     uart::uartputc(BACKSPACE);
//     uart::uartputc(b' ');
//     uart::uartputc(BACKSPACE);
// }

pub fn consputc(c: u8) {
    uart::uartputc(c);
}

// must be called only once in rmain.rs:rust_main
pub unsafe fn consoleinit() {
    uart::uartinit();
}
