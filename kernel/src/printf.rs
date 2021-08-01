use core::fmt::{self, Write};
use core::sync::atomic::{AtomicBool, Ordering};
use core::panic::PanicInfo;

use crate::console;
use crate::lock::spinlock::Spinlock;
use crate::shutdown::*;

// pub struct Pr {
//     locking: AtomicBool,
//     lock: Spinlock<()>
// }


// static mut PR: Pr = Pr {
//     locking: AtomicBool::new(true),
//     lock: Spinlock::new((), "pr")
// };


// This function is used to putchar in console
// impl Pr {
//     pub fn console_putchar(&self, c:u8) {
//         console::consputc(c);
//     }
// }




// impl fmt::Write for Pr {
//        fn write_str(&mut self, s: &str) -> fmt::Result {
//         let mut buffer = [0u8; 4];
//         for c in s.chars() {
//             for code_point in c.encode_utf8(&mut buffer).as_bytes().iter() {
//                 self.console_putchar(*code_point as u8);
//             }
//         }
//         Ok(())
//     }
// }

pub fn _print(args: fmt::Arguments) {
   use fmt::Write;

//    unsafe {
//        if PR.locking.load(Ordering::Relaxed) {
//         let guard = PR.lock.acquire();
//         PR.write_fmt(args).expect("Fail to write");
//         drop(guard);
//        }else {
//            PR.write_fmt(args).expect("Fail to write");
//        }
//    }

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