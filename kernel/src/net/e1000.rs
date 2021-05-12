use crate::lock::spinlock::Spinlock;
use crate::define::memlayout::E1000_REGS;
use crate::define::e1000::*;
use super::mbuf::*;

use core::ptr;
use core::sync::atomic::{fence, Ordering};
use core::mem::size_of;

use alloc::boxed::Box;

use array_macro::array;
use lazy_static::*;




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
    pub const fn new() -> Self {
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
static mut TRANSMIT_RING:[TransmitDesc;TRANSMIT_RING_SIZE] = array![_ => TransmitDesc::new();TRANSMIT_RING_SIZE];

const RECEIVE_RING_SIZE:usize = 16;
static mut RECEIVE_RING:[ReceiveDesc;RECEIVE_RING_SIZE] = array![_ => ReceiveDesc::new();RECEIVE_RING_SIZE];

lazy_static! {
    static ref RECEIVE_MBUF:[MBuf;RECEIVE_RING_SIZE] = array![_ => MBuf::new();RECEIVE_RING_SIZE];
    static ref TRANSMIT_RING:[MBuf;TRANSMIT_RING_SIZE] = array![_ => MBuf::new();TRANSMIT_RING_SIZE];
}

fn write_regs(regs:usize, pos:usize, value:u32) {
    unsafe{
        ptr::write((regs + pos) as *mut u32, value);
    }
}

fn read_regs(regs:usize, pos:usize) -> u32 {
    let res:u32;
    unsafe{
        res = ptr::read((regs+pos) as *const u32);
    }
    res
}

// called by pci_init().
// xregs is the memory address at which the
// e1000's registers are mapped.
pub fn e1000_init() {
    // Reset the device
    let regs = REGS as usize;

    // disable interrupts
    write_regs(regs, E1000_IMS, 0);

    // let mut e1000_ctl = ptr::read(regs as *mut u32);
    let mut e1000_ctl = read_regs(regs, 0);
    e1000_ctl |= E1000_CTL_RST as u32;
    write_regs(regs, 0, e1000_ctl);

    // redisable interrupts
    write_regs(regs, E1000_IMS, 0);
    fence(Ordering::SeqCst);

    // [E1000 14.4] Receive initialization
    // set receive ring to each mbuf head address
    for (i, mbuf) in RECEIVE_MBUF.iter_mut().enumerate() {
        RECEIVE_RING[i].addr = mbuf.head as usize;
    }

    assert_eq!(size_of::<ReceiveDesc>()%128!=0, "e1000(): Bytes of ReceiveDesc is not align.");
    write_regs(regs, E1000_RDH, 0);
    write_regs(regs, E1000_RDT, (RECEIVE_RING_SIZE-1) as u32);
    write_regs(regs, E1000_RDLEN, size_of::<ReceiveDesc>() as u32);

    // filter by qemu's MAC address, 52:54:00:12:34:56
    write_regs(regs, E1000_RA, 0x12005452);
    write_regs(regs, E1000_RA+1, 0x5634|(1<<31));

    // multicast table
    for i in 0..(4096/32) {
        write_regs(regs, E1000_MTA+i, 0);
    }

    // receive control bits
    let recv_ctrl_bits:u32 = (E1000_RCTL_EN | // enable receiver
                             E1000_RCTL_BAM | // enable broadcast
                             E1000_RCTL_SZ_2048 | // 2038-byte rx buffers
                             E1000_RCTL_SECRC) as u32; // strip CRC
    write_regs(regs, E1000_RCTL, recv_ctrl_bits);

    // ask e1000 for receive interrupts
    write_regs(regs, E1000_RDTR, 0); // interrupt after every received packet(no timer)
    write_regs(regs, E1000_RADV, 0); // interrupt after every packet (no timer)
    write_regs(regs, E1000_IMS, 1<<7); // RXDW -- Receiver Descriptor Write Back

}

pub fn e1000_recv() {
    // Check for packets that have arrived from e1000
    // Create and deliver an mbuf for each packet. 

    
    
}



