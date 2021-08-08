use core::num::Wrapping;
use core::ptr;
use core::convert::{ Into, TryInto };
use core::fmt::{self, Write, Error};
use core::sync::atomic::Ordering;

use crate::process::{CPU_MANAGER, PROC_MANAGER, pop_off, push_off};
use crate::{define::layout::UART0, println};
use crate::lock::spinlock::*;

use super::console::console_intr;
use super::PANICKED;

/// receive holding register (for input bytes)
const RHR: usize = 0;
/// transmit holding register (for output bytes)
const THR: usize = 0;
/// interrupt enable register
const IER: usize = 1;
/// FIFO control register
const FCR: usize = 2;
/// interrupt status register 
const ISR: usize = 2; 
/// line control register
const LCR: usize = 3;
/// line status register 
const LSR: usize = 5; 

const IER_RX_ENABLE: usize = 1 << 0;
const IER_TX_ENABLE: usize = 1 << 1;
const FCR_FIFO_ENABLE: usize = 1 << 0;
const FCR_FIFO_CLEAR: usize = 3 << 1; // clear the content of the two FIFOs
const LCR_EIGHT_BITS: usize = 3 << 0;
const LCR_BAUD_LATCH: usize = 1 << 7; // special mode to set baud rate
const LSR_RX_READY: usize = 1 << 0; // input is waiting to be read from RHR
const LSR_TX_IDLE: usize = 1 << 5; // THR can accept another character to send

const UART_BASE_ADDR: usize = UART0;

const UART_BUF_SIZE:usize = 32;
pub static UART: Spinlock<Uart> = Spinlock::new(Uart::new(), "uart");

/// init uart
pub unsafe fn uart_init() {
    let mut uart = UART.acquire();
    uart.init();
    drop(uart);
}

/// UART DRIVER
pub struct Uart {
    buf: [u8; UART_BUF_SIZE],
    /// Write to next to buf[write_index % UART_BUF_SIZE]
    write_index: Wrapping<usize>,
    /// Read next from buf[read_index % UART_BUF_SIZE]
    read_index: Wrapping<usize>
}

impl Uart {
    pub const fn new() -> Self {
        Self{
            // output buffer 
            buf: [0u8; UART_BUF_SIZE],
            write_index: Wrapping(0),
            read_index: Wrapping(0)
        }
    } 

    /// init uart device
    pub fn init(&mut self) {
        // disable interrupts
        write_reg(UART_BASE_ADDR + IER, 0x00);

        // special mode to set baud rate. 
        write_reg(UART_BASE_ADDR + LCR, LCR_BAUD_LATCH as u8);

        // LSB for baud rate of 38.4K
        write_reg(UART_BASE_ADDR, 0x03);

        // MSB for baud rate of 38.4k 
        write_reg(UART_BASE_ADDR + 1, 0x00);

        // leave set-baud mode, 
        // and set word length to 8 bits, no parity. 
        write_reg(UART_BASE_ADDR + LCR, LCR_EIGHT_BITS as u8);

        // reset and enable FIFOs. 
        write_reg(UART_BASE_ADDR + FCR, FCR_FIFO_ENABLE as u8 | FCR_FIFO_CLEAR as u8);

        // enable transmit and receive interrupts. 
        write_reg(UART_BASE_ADDR + IER, IER_TX_ENABLE as u8 | IER_RX_ENABLE as u8);
    }

    /// Add a chacter to the output buffer and tell the
    /// UART to start sending if it isn't already. 
    /// blocks if the output buffer is full. 
    /// because it may block, it can't be called from interrupts;
    /// it's only suitable for use
    /// by write()
    pub fn put(&mut self, c: u8) {
        let ptr = UART_BASE_ADDR as *mut u8;
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
        let ptr = UART_BASE_ADDR as *mut u8;
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


    /// Transmit the buffer content if UART device is idle. 
    fn transmit(&mut self) {
        while self.write_index != self.read_index && idle() {
            let read_index = self.read_index.0 % UART_BUF_SIZE;
            let c = self.buf[read_index];
            self.read_index += Wrapping(1);
            unsafe{
                PROC_MANAGER.wake_up(&self.read_index as *const Wrapping<_> as usize);
            }
            write_reg(UART_BASE_ADDR + THR, c);
        }
    }

}

impl Write for Uart {
    fn write_str(&mut self, out: &str) -> Result<(), Error> {
        for c in out.bytes() {
            self.put(c);
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
            let c: u8;
            if read_reg(UART_BASE_ADDR + LSR) & 1 > 0 {
                c = read_reg(UART_BASE_ADDR + RHR)
            } else {
                break;
            }
            console_intr(c);
        }
        // transmit
        self.acquire().transmit();
    }


    /// Put a u8 to the uart buffer(in the kernel). 
    /// It might sleep if the buffer is full. 
    pub fn putc(&self, c: u8) {
        let mut uart = self.acquire();

        if PANICKED.load(Ordering::Relaxed) {
            loop{}
        }

        loop {
            if uart.write_index == uart.read_index + Wrapping(UART_BUF_SIZE) {
                let p = unsafe {
                    CPU_MANAGER.myproc().expect("Fail to get my process.")
                };

                p.sleep(&uart.read_index as *const _ as usize, uart);
                uart = self.acquire();
            } else {
                let write_index = uart.write_index.0 % UART_BUF_SIZE;
                uart.buf[write_index] = c;
                uart.write_index += Wrapping(1);
                uart.transmit();
                break;
            }
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


/// Process UART interrupt. Should only be called when interrupt.
pub fn uart_intr() {
    let mut uart = UART.acquire();
    if let Some(c) = uart.get() {
        drop(uart);
        match c {
            8 => {
                // This is a backspace, so we
                // essentially have to write a space and
                // backup again:
                println!("{} {}", 8 as char, 8 as char);
            }
            10 | 13 => {
                // Newline or carriage-return
                println!("");
            }
            _ => {
                println!("{}", c as char);
                if c == 97 {
                    // crate::process::debug();
                }
            }
        }
    }
}

fn write_reg(addr: usize, val: u8) {
    unsafe{
        ptr::write(addr as *mut u8, val);
    }
}

fn read_reg(addr: usize) -> u8 {
    unsafe {
        ptr::read(addr as *const u8)
    }
}

/// Read the LSR to see if it is able to transmit data. 
fn idle() -> bool {
    read_reg(UART_BASE_ADDR + LSR) & (1 << 5) > 0
}

/// Non-blocking write to uart device. 
pub(super) fn putc_sync(c: u8) {
    push_off();
    if PANICKED.load(Ordering::Relaxed) {
        loop{}
    }
    while !idle() {}
    write_reg(UART_BASE_ADDR + THR, c);
    pop_off();
}







