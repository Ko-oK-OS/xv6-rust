use crate::{lock::spinlock::Spinlock, memory::{either_copy_in, either_copy_out}, process::{CPU_MANAGER, PROC_MANAGER}};
use super::{UART, uart_get, uart_put};

pub static mut CONSOLE: Spinlock<Console> = Spinlock::new(Console::new(), "console");
const INPUT_BUF: usize = 128;

const CTRL_P: u8 = b'P' - b'@';
const CTRL_U: u8 = b'U' - b'@';
const CTRL_H: u8 = b'H' - b'@';
const CTRL_D: u8 = b'D' - b'@';
const BACKSPACE: u8 = 100;

#[derive(Clone, Copy)]
pub struct Console {
    buf: [u8;INPUT_BUF],
    read_index: usize,
    write_index: usize,
    edit_index: usize
}

impl Console {
    const fn new() -> Self {
        Self {
            buf: [0;INPUT_BUF],
            read_index: 0,
            write_index: 0,
            edit_index: 0
        }
    }

    fn put(&self, c: u8) {
       uart_put(c);
    }

    fn intr(&mut self, mut c: u8) {
        match c {
            CTRL_P => {},
            CTRL_U => {},
            CTRL_H => {},
            _ => {
                if c != 0 && self.edit_index - self.read_index < INPUT_BUF {
                    if c == '\r' as u8 {
                        c = '\n' as u8;
                    }

                    // echo back to user
                    self.put(c);

                    // store for consuption by console_read
                    self.buf[self.edit_index % INPUT_BUF] = c;
                    self.edit_index += 1;
                    if c == '\n' as u8 || c == CTRL_D || self.edit_index == self.read_index + INPUT_BUF {
                        // wake up console_read() if a whole line (or end-of-file)
                        // has arrived. 
                        self.write_index = self.edit_index;
                        unsafe {
                            PROC_MANAGER.wakeup((&self.read_index) as *const usize as usize);
                        }

                    }
                }
            }
        }
    }
}


/// user read from the console go here. 
/// copy a whole input line to dst. 
/// is_user indicates whether dst is a user
/// or kernel address. 
// pub fn console_read(is_user: bool, mut dst: usize, len: usize) -> Option<usize> {
//     let mut count  = 0;
//     while count < len {
//         let mut console_guard = unsafe {
//             CONSOLE.acquire()
//         };
//         // Wait until interrupt handler has put some
//         // input into buf
//         let read_index = console_guard.read_index;
//         let write_index = console_guard.write_index;
//         while read_index == write_index {
//             let my_proc = unsafe {
//                 CPU_MANAGER.myproc().unwrap()
//             };
//             let proc_data = my_proc.data.acquire();
//             if proc_data.killed == 0 {
//                 drop(proc_data);
//                 drop(console_guard);
//                 return None
//             }
//             drop(proc_data);
//             my_proc.sleep((&console_guard.read_index) as *const usize as usize, console_guard);
            
//         }

//         let c = console_guard.buf[console_guard.read_index % INPUT_BUF];
//         console_guard.read_index += 1;

//         if c == CTRL_D {
//             // End of a file
//             if count != 0 {
//                 // Save ^D for next time, to make sure
//                 // caller gets a 0-byte result. 
//                 console_guard.read_index -= 1;
//             }
//             break;
//         }

//         // Copy the input byte to the user_space buffer. 
//         if either_copy_out(is_user, dst, &c as *const u8, 1).is_err() {
//             return None
//         }
//         dst += 1;
//         count += 1;
//         if c == '\n' as u8 {
//             // a whole line has arrived, return to
//             // the user-level read
//             break;
//         }
//         drop(console_guard);
//     }

//     // drop(console_guard);
//     Some(count)
// }

/// user write to the console go here.
pub fn console_write(is_user: bool, src: usize, len: usize) -> Option<usize> {
    for i in 0..len {
        let mut c: u8 = 0;
        if either_copy_in((&mut c) as *mut u8, is_user, src + i, len).is_err() {
            return None
        }
        uart_put(c);
    }
    Some(len)
}

/// The console input interrupt handler. 
/// only called by UART::intr() to get input character. 
/// do erase/kill processing, append to cons.buf,
/// wakeup up console_read if a whole line has arrived. 
pub fn console_intr(c: u8) {
    let mut console_guard = unsafe {
        CONSOLE.acquire()
    };
    console_guard.intr(c);
    drop(console_guard);
}
