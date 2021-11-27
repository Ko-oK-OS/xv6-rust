mod uart;
mod console;
use core::sync::atomic::AtomicBool;

pub use uart::*;

pub use uart::{ UART, uart_intr };


use crate::fs::DEVICE_LIST;
use crate::arch::riscv::qemu::devices::CONSOLE;

pub(crate) static PANICKED: AtomicBool = AtomicBool::new(false);

/// must be called only once in rmain.rs:rust_main
pub unsafe fn console_init() {
    uart::uart_init();
    // DEVICE_LIST.table[CONSOLE].read = console::console_read as *const u8;
    DEVICE_LIST.table[CONSOLE].write = console::console_write as *const u8;
}


