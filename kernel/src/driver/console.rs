use core::num::Wrapping;

use crate::{lock::spinlock::Spinlock, memory::{copy_to_kernel, copy_from_kernel}, process::{CPU_MANAGER, PROC_MANAGER}};
use super::uart::{UART, putc_sync, uart_get, uart_put};

static CONSOLE: Spinlock<Console> = Spinlock::new(Console::new(), "console");
const INPUT_BUF: usize = 128;

/// end of transmit/file.line
pub const CTRL_EOT: u8 = 0x04;

/// backspace
pub const CTRL_BS: u8 = 0x08;

/// line feed, '\n'
pub const CTRL_LF: u8 = 0x0A;

/// carriage return
pub const CTRL_CR: u8 = 0x0D;

/// DEL
pub const CTRL_DEL: u8 = 0x7f;

/// for debug, print process list
pub const CTRL_PRINT_PROCESS: u8 = 0x10;

/// backspace the whole line
// TODO
pub const CTRL_BS_LINE: u8 = 0x15;

#[derive(Clone, Copy)]
pub struct Console {
    buf: [u8;INPUT_BUF],
    read_index: Wrapping<usize>,
    write_index: Wrapping<usize>,
    edit_index: Wrapping<usize>
}

impl Console {
    const fn new() -> Self {
        Self {
            buf: [0;INPUT_BUF],
            read_index: Wrapping(0),
            write_index: Wrapping(0),
            edit_index: Wrapping(0)
        }
    }
}

/// Put a single character to console. 
pub(crate) fn putc(c: u8) {
    if c == CTRL_BS {
        putc_sync(CTRL_BS);
        putc_sync(b' ');
        putc_sync(CTRL_BS);
    } else {
        putc_sync(c);
    }
}

/// User read from the console go here. 
/// copy a whole input line to dst. 
/// is_user indicated whether dst is a user
/// or kernel address. 
pub(super) fn console_read(
    is_user: bool, 
    mut dst: usize, 
    size: usize
) -> Option<usize> {
    let mut console = CONSOLE.acquire();

    let mut left = size;
    while left > 0 {
        // if no available data in console buf 
        // wait until the console device write some data. 
        while console.read_index == console.write_index {
            let p = unsafe {
                CPU_MANAGER.myproc().expect("Fail to get my process")
            };
            if p.killed() {
                return None
            }
            p.sleep(&console.read_index as *const _ as usize, console);
            console = CONSOLE.acquire();
        }

        // read
        let c = console.buf[console.read_index.0 % INPUT_BUF];
        console.read_index += Wrapping(1);

        // encounter EOF
        // return earlier
        if c == CTRL_EOT {
            if left < size {
                console.read_index -= Wrapping(1);
            }
            break;
        }

        // copy to user/kernel space memory
        if copy_from_kernel(is_user, dst, &c as *const u8, 1).is_err() {
            break;
        }

        // update
        dst += 1;
        left -= 1;

        // encounter a line feed
        if c == CTRL_LF {
            break;
        }
    }
    Some(0)
}

/// User write to the console go here. 
pub(super) fn console_write(
    is_user: bool,
    mut src: usize,
    size: usize
) -> Option<usize> {
    for i in 0..size {
        let mut c = 0u8;
        if copy_to_kernel(&mut c as *mut u8, is_user, src, 1).is_err() {
            return Some(i)
        }
        UART.putc(c);
        src += 1;
    }
    Some(size)
}


/// The console interrupt handler. 
/// The normal routine is: 
/// 1. user input;
/// 2. uart handler interrupt;
/// 3. console handle interrupt. 
/// 4. console echo back input or do extra controlling. 
pub(super) fn console_intr(c: u8) {
    let mut console = CONSOLE.acquire();

    match c {
        CTRL_PRINT_PROCESS => {
            unsafe {
                PROC_MANAGER.proc_dump();
            }
        },

        CTRL_BS_LINE => {
            while console.edit_index != console.write_index &&
            console.buf[(console.edit_index - Wrapping(1)).0 % INPUT_BUF] != CTRL_LF {
                console.edit_index -= Wrapping(1);
                putc(CTRL_BS);
            }
        },

        CTRL_BS | CTRL_DEL => {
            if console.edit_index != console.write_index {
                console.edit_index -= Wrapping(1);
                putc(CTRL_BS);
            }
        },

        _ => {
            // echo back
            if c != 0 && (console.edit_index - console.read_index).0 < INPUT_BUF {
                let c = if c == CTRL_CR { CTRL_LF } else { c };
                putc(c);
                let edit_index = console.edit_index.0 % INPUT_BUF;
                console.buf[edit_index] = c;
                console.edit_index += Wrapping(1);
                if c == CTRL_LF || c == CTRL_EOT || (console.edit_index - console.read_index).0 == INPUT_BUF {
                    console.write_index = console.edit_index;
                    unsafe{
                        PROC_MANAGER.wake_up(&console.read_index as *const _ as usize)
                    };
                }
            }
        }
    }
}

use core::sync::atomic::AtomicBool;
pub(crate) static PANICKED: AtomicBool = AtomicBool::new(false);

/// must be called only once in rmain.rs:rust_main
pub unsafe fn console_init() {
    use crate::fs::DEVICE_LIST;
    use crate::arch::riscv::qemu::devices::CONSOLE;
    super::uart::uart_init();
    // DEVICE_LIST.table[CONSOLE].read = console::console_read as *const u8;
    DEVICE_LIST.table[CONSOLE].write = console_write as *const u8;
}