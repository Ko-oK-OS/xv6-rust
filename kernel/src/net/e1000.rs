use crate::lock::spinlock::Spinlock;
use crate::define::memlayout::E1000_REGS;
use crate::define::e1000::*;
use super::mbuf::*;
use super::protocol::*;

use core::ptr;
use core::sync::atomic::{fence, Ordering};
use core::mem::size_of;

use alloc::boxed::Box;

use array_macro::array;
use lazy_static::*;
use bit_field::BitField;

static E1000_LOCK:Spinlock<()> = Spinlock::new((), "e1000");
const TRANSMIT_RING_SIZE:usize = 16;
const RECEIVE_RING_SIZE:usize = 16;

static mut REGS:*mut u32 = E1000_REGS as *mut u32;
static mut TRANSMIT_RING:[TransmitDesc;TRANSMIT_RING_SIZE] = array![_ => TransmitDesc::new();TRANSMIT_RING_SIZE];
static mut RECEIVE_RING:[ReceiveDesc;RECEIVE_RING_SIZE] = array![_ => ReceiveDesc::new();RECEIVE_RING_SIZE];

// use lock to avoid to defermut recursively. 
lazy_static! {
    static ref RECEIVE_MBUF:Spinlock<[MBuf;RECEIVE_RING_SIZE]> = Spinlock::new(array![_ => MBuf::new();RECEIVE_RING_SIZE], "receive_mbuf");
    static ref TRANSMIT_MBUF:Spinlock<[MBuf;TRANSMIT_RING_SIZE]> = Spinlock::new(array![_ => MBuf::new();TRANSMIT_RING_SIZE], "transmit_mbuf");
}

// Legacy Transmit Descriptor Format
#[repr(C, align(128))]
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
#[repr(C, align(128))]
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
    let regs = unsafe{ REGS as usize };

    // disable interrupts
    write_regs(regs, E1000_IMS, 0);

    let mut e1000_ctl = read_regs(regs, 0);
    e1000_ctl |= E1000_CTL_RST as u32;
    write_regs(regs, 0, e1000_ctl);

    // redisable interrupts
    write_regs(regs, E1000_IMS, 0);

    fence(Ordering::SeqCst);

    
    // let trans_mbuf:[MBuf;16] = array![_ => MBuf::new(); 16];
    // println!("addr: 0x{:x}", trans_mbuf.as_ptr() as usize);

    // let mbuf = MBuf::allocate(0).unwrap();
    // println!("addr: 0x{:x}", Box::into_raw(mbuf) as usize);


    // [E1000 14.5] Transmit initialization
    // acquire 

    // let mut trans_guard = TRANSMIT_MBUF.acquire();
    // for(i, _) in trans_guard.iter_mut().enumerate() {
    //     unsafe{
    //         RECEIVE_RING[i].status = E1000_TXD_STAT_DD;
    //     }
    // }

    // // realise
    // drop(trans_guard);

    write_regs(regs, E1000_TDBAL, unsafe{ TRANSMIT_RING.as_ptr() } as u32);
    write_regs(regs, E1000_TDH, 0);
    write_regs(regs, E1000_TDT, 0);


    // [E1000 14.4] Receive initialization
    // set receive ring to each mbuf head address
    // acquire RECEIVE_MBUF

    // let mut recv_guard = RECEIVE_MBUF.acquire();
    // for (i, mbuf) in recv_guard.iter_mut().enumerate() {
    //     unsafe{
    //         RECEIVE_RING[i].addr = mbuf.head as usize;
    //     }
    // }
    // // realise 
    // drop(recv_guard);

    // write receive_ring address into RDBAL reg. 
    write_regs(regs, E1000_RDBAL, unsafe{ RECEIVE_RING.as_ptr() as u32} );
    // write receive-ring address into RDBAH reg.
    write_regs(regs, E1000_RDBAH, 0);

    assert_eq!(size_of::<ReceiveDesc>(), 128 , "e1000(): Bytes of ReceiveDesc is not align.");

    write_regs(regs, E1000_RDH, 0);
    write_regs(regs, E1000_RDT, (RECEIVE_RING_SIZE-1) as u32);
    write_regs(regs, E1000_RDLEN, size_of::<ReceiveDesc>() as u32);

    // filter by qemu's MAC address, 52:54:00:12:34:56
    write_regs(regs, E1000_RA, 0x12005452);
    write_regs(regs, E1000_RA+4, 0x5634|(1<<31));

    // multicast table
    for i in 0..(4096/32) {
        write_regs(regs, E1000_MTA+i, 0);
    }

    // transmitter control bits
    let trans_ctrl_bits:u32 = (E1000_TCTL_EN | // enable
                            E1000_TCTL_PSP | // pad short packets
                            (0x10 << E1000_TCTL_CT_SHIFT) | // collision stuff
                            (0x40 << E1000_TCTL_COLD_SHIFT)) as u32;
    write_regs(regs, E1000_TCTL, trans_ctrl_bits);
    write_regs(regs, E1000_TIPG, 10 | (8 << 10) | (6 << 20)); // inter-pkt gap

    // receive control bits
    let recv_ctrl_bits:u32 = (E1000_RCTL_EN | // enable receiver
                             E1000_RCTL_BAM | // enable broadcast
                             E1000_RCTL_SZ_2048 | // 2048-byte rx buffers
                             E1000_RCTL_SECRC) as u32; // strip CRC
    write_regs(regs, E1000_RCTL, recv_ctrl_bits);

    // ask e1000 for receive interrupts
    write_regs(regs, E1000_RDTR, 0); // interrupt after every received packet(no timer)
    write_regs(regs, E1000_RADV, 0); // interrupt after every packet (no timer)
    write_regs(regs, E1000_IMS, 1<<7); // RXDW -- Receiver Descriptor Write Back
    
}

pub unsafe fn e1000_transmit(m: MBuf) {
    // the mbuf contains an ethernet frame; programe it into
    // the TX descriptor ring so that the e1000 sends it. Stash
    // a pointer so that it can be freed after sending. 
}

pub unsafe fn e1000_recv() {
    // Check for packets that have arrived from e1000
    // Create and deliver an mbuf for each packet. 

    // acquire e1000
    let guard = E1000_LOCK.acquire();
    // acquire receive mbuf lists
    let mut recv_guard = RECEIVE_MBUF.acquire();
    for (index, recv_desc) in RECEIVE_RING.iter().enumerate() {
        if recv_desc.errors != 0 {
            println!("Some errors occur in receive message.");
            match recv_desc.errors {
                1 => {println!("CRC Error or Alignment Error.");}
                2 => {println!("Symbol Error.");}
                4 => {println!("Sequence Error.");}
                16 => {println!("Carrier Extension Error.");}
                32 => {println!("TCP/UDP Checksum Error.");}
                64 => {println!("IP Checksum Error.");}
                128 => {println!("RX Data Error.")}
                _ => {println!("Mutiple Errors.")}
            }
            continue;
        }
        if recv_desc.length != 0 {
            let mut mbuf = MBuf::new();
            // copy data from receive_mbuf to new allocated mbuf. 
            ptr::copy_nonoverlapping(&mut mbuf as *mut MBuf, &mut recv_guard[index] as *mut MBuf, 1);
            // deliver message buffer to Eth Protocol. 
            Eth::receive(mbuf);
        }
    }
    // realise receive mbuf
    drop(recv_guard);
    // realise e1000
    drop(guard); 
}



