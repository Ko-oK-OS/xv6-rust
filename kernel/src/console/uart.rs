use core::ptr;
use core::convert::{ Into, TryInto };
use core::fmt::{self, Write};

use crate::{define::memlayout::UART0, println};
use crate::lock::spinlock::*;

// static mut UART_TX_LOCK: Spinlock<()> = Spinlock::new((), "uart_tx_lock");


// macro_rules! Reg {
//     ($reg: expr) => {
//         Into::<usize>::into(UART0) + $reg
//     };
// }

// macro_rules! ReadReg {
//     ($reg: expr) => {
//         unsafe { ptr::read_volatile(Reg!($reg) as *const u8) }
//     };
// }

// macro_rules! WriteReg {
//     ($reg: expr, $value: expr) => {
//         unsafe {
//             ptr::write_volatile(Reg!($reg) as *mut u8, $value);
//         }
//     };
// }

// const RHR: usize = 0;
// const THR: usize = 0;
// const IER: usize = 1;
// const FCR: usize = 2;
// const ISR: usize = 2;
// const LCR: usize = 3;
// const LSR: usize = 5;

// pub fn uartinit() {
//     // disable interrupts.
//     WriteReg!(IER, 0x00);

//     // special mode to set baud rate.
//     WriteReg!(LCR, 0x80);

//     // LSB for baud rate of 38.4K.
//     WriteReg!(0, 0x03);

//     // MSB for baud rate of 38.4K.
//     WriteReg!(1, 0x00);

//     // leave set-baud mode,
//     // and set word length to 8 bits, no parity.
//     WriteReg!(LCR, 0x03);

//     // reset and enable FIFOs.
//     WriteReg!(FCR, 0x07);

//     // enable receive interrupts.
//     WriteReg!(IER, 0x01);
// }

// pub fn uartputc(c: u8) {
//     let guard = unsafe{ UART_TX_LOCK.acquire() };
//     while (ReadReg!(LSR) & (1 << 5)) == 0 {}
//     WriteReg!(THR, c);
//     drop(guard);
// }

// // read one input character from the UART.
// // return -1 if none is waiting.
// pub fn uartgetc() -> u8 {
//     if ReadReg!(LSR) & 1 != 0 {
//         ReadReg!(RHR)
//     }else {
//         1
//     }
// }

// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from trap.c.

// pub fn uartintr() {
//     // read and process incoming characters.
//     loop {
//         let c = uartgetc();
//         match c {
//             _ => {
//                 break;
//             }
//         }
//     }


// }

pub static UART:Spinlock<Uart> = Spinlock::new(Uart::new(UART0), "uart");

// init uart
pub unsafe fn uart_init() {
    let mut uart = UART.acquire();
    uart.init();
    drop(uart);
}

// UART DRIVER
pub struct Uart {
    // UART MMIO base address
    addr: usize
}

impl Uart {
    pub const fn new(addr: usize) -> Self {
        Self{
            addr: addr
        }
    } 

    // init uart device
    pub fn init(&mut self) {
        let ptr = self.addr as *mut u8;
        unsafe {
            ptr.add(3).write_volatile((1 << 0) | (1 << 1));

            ptr.add(2).write_volatile(1 << 0);

            ptr.add(1).write_volatile(1 << 0);

            let divisor: u16 = 592;
            let divisor_least: u8 = (divisor & 0xff).try_into().unwrap();
            let divisor_most: u8 = (divisor >> 8).try_into().unwrap();

            let lcr = ptr.add(3).read_volatile();
            ptr.add(3).write_volatile(lcr | 1 << 7);

            ptr.add(0).write_volatile(divisor_least);
            ptr.add(1).write_volatile(divisor_most);

            ptr.add(3).write_volatile(lcr);
        }

    }

    // Put a character into uart
    pub fn put(&mut self, c: u8) {
        let ptr = self.addr as *mut u8;
        loop {
            // write until previous data is flushed
            if unsafe{ ptr.add(5).read_volatile() } & (1 << 5) != 0 {
                break;
            }
        }
        unsafe {
            // write data
            ptr.add(0).write_volatile(c);
        }
    }

    // get a chacter from uart
    pub fn get(&mut self) -> Option<u8> {
        let ptr = self.addr as *mut u8;
        unsafe {
            if ptr.add(5).read_volatile() & 1 == 0 {
                // DR bit is 0, meaning no data
                None
            }else {
                // DR bit is 1, meaning data
                Some(ptr.add(0).read_volatile())
            }
        }
    }
}

impl Write for Uart {
    fn write_str(&mut self, s: &str) -> fmt::Result {
        for c in s.bytes() {
            self.put(c);
        }
        Ok(())
    }
}


pub fn uart_intr() {
    // let mut uart = UART.acquire();
    // if let Some(c) = uart.get() {
    //     drop(uart);
    //     match c {
    //         8 => {
    //             // This is a backspace, so we
    //             // essentially have to write a space and
    //             // backup again:
    //             println!("{} {}", 8 as char, 8 as char);
    //         }

    //         10 | 13 => {
    //             println!("");
    //         }

    //         _ => {
    //             println!("{}", c as char);
    //         }
    //     }
    // }

    loop {
        let mut uart = UART.acquire();
        let c = uart.get().unwrap();
        drop(uart);
        match c {
            // new line
            10 => {
                break;
            }

            _ => {
                // println!("{}", c as char);
                // TODO: consoleintr
                // uart.put(c)
            }
        }
    }
}
