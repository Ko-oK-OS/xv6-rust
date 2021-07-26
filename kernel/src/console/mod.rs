mod uart;
mod console;
pub use uart::*;

pub use uart::UART;
pub use console::console_write;

use crate::fs::DEVICE_LIST;
use crate::define::devices::CONSOLE;

/// must be called only once in rmain.rs:rust_main
pub unsafe fn console_init() {
    uart::uart_init();
    // DEVICE_LIST.table[CONSOLE].read = console::console_read as *const u8;
    DEVICE_LIST.table[CONSOLE].write = console::console_write as *const u8;
}
