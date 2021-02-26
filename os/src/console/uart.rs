use core::ptr;
use core::convert::Into;

// use crate::consts::UART0;
pub const UART0: usize= 0x10000000;

macro_rules! Reg {
    ($reg: expr) => {
        Into::<usize>::into(UART0) + $reg
    };
}

macro_rules! ReadReg {
    ($reg: expr) => {
        unsafe { ptr::read_volatile(Reg!($reg) as *const u8) }
    };
}

macro_rules! WriteReg {
    ($reg: expr, $value: expr) => {
        unsafe {
            ptr::write_volatile(Reg!($reg) as *mut u8, $value);
        }
    };
}

const RHR: usize = 0;
const THR: usize = 0;
const IER: usize = 1;
const FCR: usize = 2;
const ISR: usize = 2;
const LCR: usize = 3;
const LSR: usize = 5;

pub fn uartinit() {
    // disable interrupts.
    WriteReg!(IER, 0x00);

    // special mode to set baud rate.
    WriteReg!(LCR, 0x80);

    // LSB for baud rate of 38.4K.
    WriteReg!(0, 0x03);

    // MSB for baud rate of 38.4K.
    WriteReg!(1, 0x00);

    // leave set-baud mode,
    // and set word length to 8 bits, no parity.
    WriteReg!(LCR, 0x03);

    // reset and enable FIFOs.
    WriteReg!(FCR, 0x07);

    // enable receive interrupts.
    WriteReg!(IER, 0x01);
}

pub fn uartputc(c: u8) {
    while (ReadReg!(LSR) & (1 << 5)) == 0 {}
    WriteReg!(THR, c);
}
