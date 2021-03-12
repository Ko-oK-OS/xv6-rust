use crate::console;
use crate::lock::spinlock::Spinlock;
use core::fmt::{self, Write};

static PR: Spinlock<Stdout> = Spinlock::new(Stdout, "pr");

struct Stdout;

// This function is used to putchar in console
pub fn console_putchar(c: u8){
    console::consputc(c);
}

impl Stdout {
    fn print(&self, c: u8) {
        console::consputc(c);
    }
}

impl Write for Stdout {
    fn write_str(&mut self, s: &str) -> fmt::Result {
        for byte in s.bytes() {
            self.print(byte);
        }
        Ok(())
    }
}

/// 打印由 [`core::format_args!`] 格式化后的数据
///
/// [`print!`] 和 [`println!`] 宏都将展开成此函数
///
/// [`core::format_args!`]: https://doc.rust-lang.org/nightly/core/macro.format_args.html
pub fn _print(args: fmt::Arguments) {
    let mut guard = PR.acquire();
    guard.write_fmt(args).unwrap();
    drop(guard)
}

/// implement print and println! macro
///
/// use [`core::fmt::Write`] trait's [`console::Stdout`]
#[macro_export]
macro_rules! print {
    ($($arg:tt)*) => {
        $crate::printf::_print(format_args!($($arg)*));
    };
}

#[macro_export]
macro_rules! println {
    () => {$crate::print!("\n")};
    ($fmt:expr) => {$crate::print!(concat!($fmt, "\n"))};
    ($fmt:expr, $($arg:tt)*) => {
        $crate::print!(concat!($fmt, "\n"), $($arg)*)
    };
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