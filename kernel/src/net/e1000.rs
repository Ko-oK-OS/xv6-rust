use crate::lock::spinlock::Spinlock;
use crate::define::memlayout::E1000_REGS;

use core::ptr;
use core::sync::atomic::{fence, Ordering};

const E1000_CTL:usize = 0x00000; /* Device Control Register - RW */
const E1000_IDR:usize = 0x000C0; /* Interrupt Cause Read - R */
const E1000_IMS:usize = 0x000D0; /* Interrupt Mask Set - RW */
const E1000_RCTL:usize = 0x00100; /* RX Control - RW */
const E1000_TCTL:usize = 0x00400; /* TX Control - RW */

/* Device Control */
const E1000_CTL_SLU:usize = 0x00000040;    /* set link up */
const E1000_CTL_FRCSPD:usize = 0x00000800;    /* force speed */
const E1000_CTL_FRCDPLX:usize = 0x00001000;    /* force duplex */
const E1000_CTL_RST:usize = 0x00400000;    /* full reset */

// Legacy Transmit Descriptor Format
pub struct TransmitDesc {
    addr:usize, // Buffer Address
    length:u16, // Length is each segment
    cso:u8, // Checksum Offset
    cmd:u8, // Command Field
    status:u8, // Status Field
    css:u8, // Checksum Start Field
    special:u16, // Special Fiels
}

impl TransmitDesc {
    const fn new() -> Self {
        Self {
            addr:0,
            length:0,
            cso:0,
            cmd:0,
            status:0,
            css:0,
            special:0
        }
    }
}

// Receive Descriptor Format
pub struct ReceiveDesc {
    addr:usize, /* Address of the descriptor's data buffer */
    length:u16, /* Length of data DMAed into data buffer */
    csum:u16, /* Packet checksum */
    status:u8, /* Descriptor status */
    errors:u8, /* Descriptor Errors */
    special:u16, 
}

impl ReceiveDesc {
    const fn new() -> Self {
        Self {
            addr:0,
            length:0,
            csum:0,
            status:0,
            errors:0,
            special:0
        }
    }
}

static E1000_LOCK:Spinlock<()> = Spinlock::new((), "e1000");

static mut REGS:*mut u32 = E1000_REGS as *mut u32;

const TRANSMIT_RING_SIZE:usize = 16;
static mut TRANSMIT_RING:[TransmitDesc;TRANSMIT_RING_SIZE] = [TransmitDesc::new();TRANSMIT_RING_SIZE];

const RECEIVE_RING_SIZE:usize = 16;
static mut RECEIVE_RING:[ReceiveDesc;RECEIVE_RING_SIZE] = [ReceiveDesc::new();RECEIVE_RING_SIZE];

// called by pci_init().
// xregs is the memory address at which the
// e1000's registers are mapped.
pub unsafe fn e1000_init() {
    // Reset the device
    let regs = REGS as usize;

    // disable interrupts
    ptr::write((regs + E1000_IMS) as *mut u32, 0);

    let mut e1000_ctl = ptr::read(regs as *mut u32);
    e1000_ctl |= E1000_CTL_RST as u32;
    ptr::write(regs as *mut u32, e1000_ctl);

    // redisable interrupts
    ptr::write((regs + E1000_IMS) as *mut u32, 0);
    fence(Ordering::SeqCst);


}