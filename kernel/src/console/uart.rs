use core::ptr;
use core::convert::{ Into, TryInto };
use core::fmt::{self, Write};

use crate::process::PROC_MANAGER;
use crate::{define::memlayout::UART0, println};
use crate::lock::spinlock::*;

use super::console::console_intr;

const RHR: usize = 0; // receive holding register (for input bytes)
const THR: usize = 0; // transmit holding register (for output bytes)
const IER: usize = 1; // interrupt enable register
const FCR: usize = 2; // FIFO control register
const ISR: usize = 2; // interrupt status register
const LCR: usize = 3; // line control register
const LSR: usize = 5; // line status register

const IER_RX_ENABLE: usize = 1 << 0;
const IRX_TX_ENABLE: usize = 1 << 1;
const FCR_FIFO_ENABLE: usize = 1 << 0;
const FCR_FIFO_CLEAR: usize = 3 << 1; // clear the content of the two FIFOs
const LCR_EIGHT_BITS: usize = 3 << 0;
const LCR_BAUD_LATCH: usize = 1 << 7; // special mode to set baud rate
const LSR_RX_READY: usize = 1 << 0; // input is waiting to be read from RHR
const LSR_TX_IDLE: usize = 1 << 5; // THR can accept another character to send

const UART_BUF_SIZE:usize = 32;
pub static UART: Spinlock<Uart> = Spinlock::new(Uart::new(UART0), "uart");

/// init uart
pub unsafe fn uart_init() {
    let mut uart = UART.acquire();
    uart.init();
    drop(uart);
}

/// UART DRIVER
pub struct Uart {
    // UART MMIO base address
    addr: usize,
    buf: [u8; UART_BUF_SIZE],
    /// Write to next to buf[write_index % UART_BUF_SIZE]
    write_index: usize,
    /// Read next from buf[read_index % UART_BUF_SIZE]
    read_index: usize
}

impl Uart {
    pub const fn new(addr: usize) -> Self {
        Self{
            addr: addr,
            // output buffer 
            buf: [0u8; UART_BUF_SIZE],
            write_index: 0,
            read_index: 0
        }
    } 

    /// init uart device
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

    /// If the UART is idle, and a character is waiting
    /// in the transmit buffer, send it.
    /// caller must hold lock.
    /// called from both the top- and bottom-half.
    pub unsafe fn uart_start(&mut self) {
        loop {
            if self.read_index == self.write_index {
                // transmit buffer is empty.
            }

            let ptr = self.addr as *mut u8;
            let value = ptr.add(5).read_volatile();

            if value & 1<<5 == 0 {
                // the UART transmit holding register is full,
                // so we cannot give it another byte.
                // it will interrupt when it's ready for a new byte.
                return 
            }

            let c = self.buf[self.read_index % UART_BUF_SIZE];
            self.read_index += 1;
            
            // Maybe UART::put() is waiting for space in the buffer. 
            // PROC_MANAGER.wakeup(&self.read_index as *const usize as usize);
            ptr.add(0).write_volatile(c);

        }
    }

    /// Add a chacter to the output buffer and tell the
    /// UART to start sending if it isn't already. 
    /// blocks if the output buffer is full. 
    /// because it may block, it can't be called from interrupts;
    /// it's only suitable for use
    /// by write()
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

    /// get a chacter from uart
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


impl Spinlock<Uart> {
    /// Handle a uart interrupt, raised because input has
    /// arrived, or the uart is ready for more output, or
    /// both, called from trap.rs
    pub fn intr(&self) {
        loop {
            // read and process incoming characters. 
            let c = uart_get();
            console_intr(c);
        }
    }
}

pub fn uart_get() -> u8 {
    let c: u8;
    let mut uart_guard = UART.acquire();
    c = uart_guard.get().expect("Fail to get char");
    drop(uart_guard);
    c
}

pub fn uart_put(c: u8) {
    let mut uart_guard = UART.acquire();

    uart_guard.put(c);
    drop(uart_guard);
}


