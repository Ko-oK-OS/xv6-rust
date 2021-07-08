use core::fmt::{Write, self};
use super::{ sys_write, STDOUT };

struct Stdout;

fn write_bytes(fd: usize, chars: &[u8]) {
    sys_write(fd, chars, chars.len());
}

impl Write for Stdout {
    fn write_str(&mut self, s: &str) -> fmt::Result {
        write_bytes(STDOUT, s.as_bytes());
        Ok(())
    }
}

pub fn _print(args: fmt::Arguments) {
    Stdout.write_fmt(args).unwrap();
}

#[macro_export]
macro_rules! print{
    ($fmt:literal$(, $($arg: tt)+)?) => {
        $crate::print::_print(format_args!($fmt $(, $($arg)+)?));
    };
}

#[macro_export]
macro_rules! println {
    ($fmt: literal $(, $($arg: tt)+)?) => {
    $crate::print::_print(format_args!(concat!($fmt, "\n") $(, $($arg)+)?)); 
    };
}