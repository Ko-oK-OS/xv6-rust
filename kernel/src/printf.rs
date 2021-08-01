use core::fmt::{self, Write};
use core::sync::atomic::{AtomicBool, Ordering};
use core::panic::PanicInfo;

use crate::console;
use crate::lock::spinlock::Spinlock;
use crate::shutdown::*;

pub fn _print(args: fmt::Arguments) {
    use fmt::Write;
    let mut uart = console::UART.acquire();
    uart.write_fmt(args).unwrap();
    drop(uart);
}

pub fn console_ptr(c: u8) {
    let mut uart = console::UART.acquire();
    uart.put(c);
    drop(uart);
}

/// implement print and println! macro
///
/// use [`core::fmt::Write`] trait's [`console::Stdout`]
#[macro_export]
macro_rules! print {
    (fmt:literal$(, $($arg: tt)+)?) => {
        $crate::printf::console_putchar(format_args!($fmt(, $($arg)+)?));
    }
}

#[macro_export]
macro_rules! println {
    ($fmt:literal$(, $($arg: tt)+)?) => {
        $crate::printf::_print(format_args!(concat!($fmt, "\n") $(,$($arg)+)?));
    }
}

#[panic_handler]
fn panic(info: &PanicInfo<'_>) -> ! {
    println!("\x1b[1;31mpanic: '{}'\x1b[0m", info);
    shutdown();
    loop {}
}

#[no_mangle]
fn abort() -> ! {
    panic!("abort");
}

/// 
/// implement a macro like std::dbg
#[macro_export]
#[allow(unused_macros)]
macro_rules! dbg {
    () => {
        println!("[{}:{}]", file!(), line!());
    };
    ($val:expr) => {
        match $val {
            tmp => {
                println!("[{}:{}] {} = {:#?}",
                    file!(), line!(), stringify!($val), &tmp);
                tmp
            }
        }
    };
    ($val:expr,) => { $crate::dbg!($val) };
    ((val:expr),+ $(,)?) => {
        ((crate::dbg!($val)),+,)
    };
}

/// like `std::dbg` macro（16 Hexadecimal）

#[macro_export]
#[allow(unused_macros)]
macro_rules! dbgx {
    () => {
        println!("[{}:{}]", file!(), line!());
    };
    ($val:expr) => {
        match $val {
            tmp => {
                println!("[{}:{}] {} = {:#x?}",
                    file!(), line!(), stringify!($val), &tmp);
                tmp
            }
        }
    };
    ($val:expr,) => { dbgx!($val) };
    ((val:expr),+ $(,)?) => {
        ($(dbgx!($val)),+,)
    };
}