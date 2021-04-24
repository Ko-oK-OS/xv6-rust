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

const UART_BUF_SIZE:usize = 32;
pub static UART:Spinlock<Uart> = Spinlock::new(Uart::new(UART0), "uart");

// write next to uart.buf[UART_WRITE % UART_BUF_SIZE]
pub static mut UART_WRITE:usize = 0;

// read next from uart.buf[UART_READ % UART_BUF_SIZE]
pub static mut UART_READ:usize = 0;



// init uart
pub unsafe fn uart_init() {
    let mut uart = UART.acquire();
    uart.init();
    drop(uart);
}

// UART DRIVER
pub struct Uart {
    // UART MMIO base address
    addr: usize,
    buf: [u8; UART_BUF_SIZE]
}

impl Uart {
    pub const fn new(addr: usize) -> Self {
        Self{
            addr: addr,
            // output buffer 
            buf: [0u8; UART_BUF_SIZE]
        }
    } 

    // init uart device
    pub fn init(&mut self) {
        let ptr = self.addr as *mut u8;
        unsafe {
            // First, set the word length, which
            // are bits 0 and 1 of the line control register (LCR)
            // which is at base_address + 3
            // We can easily write the value 3 here or 0b11, but I'm
            // extending it so that it is clear we're setting two individual
            // fields
            //                         Word 0     Word 1
            //                         ~~~~~~     ~~~~~~
            ptr.add(3).write_volatile((1 << 0) | (1 << 1));

            // Now, enable the FIFO, which is bit index 0 of the FIFO
            // control register (FCR at offset 2).
            // Again, we can just write 1 here, but when we use left shift,
            // it's easier to see that we're trying to write bit index #0.

            ptr.add(2).write_volatile(1 << 0);

            // Enable receiver buffer interrupts, which is at bit index
            // 0 of the interrupt enable register (IER at offset 1).
            ptr.add(1).write_volatile(1 << 0);

            // If we cared about the divisor, the code below would set the divisor
            // from a global clock rate of 22.729 MHz (22,729,000 cycles per second)
            // to a signaling rate of 2400 (BAUD). We usually have much faster signalling
            // rates nowadays, but this demonstrates what the divisor actually does.
            // The formula given in the NS16500A specification for calculating the divisor
            // is:
            // divisor = ceil( (clock_hz) / (baud_sps x 16) )
            // So, we substitute our values and get:
            // divisor = ceil( 22_729_000 / (2400 x 16) )
            // divisor = ceil( 22_729_000 / 38_400 )
            // divisor = ceil( 591.901 ) = 592

            // The divisor register is two bytes (16 bits), so we need to split the value
            // 592 into two bytes. Typically, we would calculate this based on measuring
            // the clock rate, but again, for our purposes [qemu], this doesn't really do
            // anything.
            let divisor: u16 = 592;
            let divisor_least: u8 = (divisor & 0xff).try_into().unwrap();
            let divisor_most: u8 = (divisor >> 8).try_into().unwrap();

            // Notice that the divisor register DLL (divisor latch least) and DLM (divisor latch most)
            // have the same base address as the receiver/transmitter and the interrupt enable register.
            // To change what the base address points to, we open the "divisor latch" by writing 1 into
            // the Divisor Latch Access Bit (DLAB), which is bit index 7 of the Line Control Register (LCR)
            // which is at base_address + 3.
            let lcr = ptr.add(3).read_volatile();
            ptr.add(3).write_volatile(lcr | 1 << 7);

            // Now, base addresses 0 and 1 point to DLL and DLM, respectively.
            // Put the lower 8 bits of the divisor into DLL
            ptr.add(0).write_volatile(divisor_least);
            ptr.add(1).write_volatile(divisor_most);

            // Now that we've written the divisor, we never have to touch this again. In hardware, this
            // will divide the global clock (22.729 MHz) into one suitable for 2,400 signals per second.
            // So, to once again get access to the RBR/THR/IER registers, we need to close the DLAB bit
            // by clearing it to 0. Here, we just restore the original value of lcr.
            ptr.add(3).write_volatile(lcr);
        }

    }

    // if the UART is idle, and a character is waiting
    // in the transmit buffer, send it.
    // caller must hold uart_tx_lock.
    // called from both the top- and bottom-half.
    pub unsafe fn uart_start(&mut self) {
        loop {
            if UART_READ == UART_WRITE  {
                // transmit buffer is empty
                return 
            }

            let ptr = self.addr as *mut u8;
            let value = ptr.add(5).read_volatile();

            if value & 1<<5 == 0 {
                // the UART transmit holding register is full,
                // so we cannot give it another byte.
                // it will interrupt when it's ready for a new byte.
                return 
            }

            let c = self.buf[UART_READ % UART_BUF_SIZE];
            UART_READ += 1;

            // TODO: wakeup?

            ptr.add(0).write_volatile(c);

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
        let mut buffer = [0u8; 4];
        for c in s.chars() {
            for code_point in c.encode_utf8(&mut buffer).as_bytes().iter() {
                self.put(*code_point as u8);
            }
        }
        Ok(())
    }
}


pub fn uart_intr() {
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

    let mut uart = UART.acquire();
    unsafe{
        uart.uart_start();
    }
    drop(uart);
}
