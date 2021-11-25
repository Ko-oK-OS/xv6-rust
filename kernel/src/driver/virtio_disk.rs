//! driver for virtio device, only used for disk now
//!
//! from sec 2.6 in https://docs.oasis-open.org/virtio/virtio/v1.1/virtio-v1.1.pdf :
//!     * Descriptor Table - occupies the Descriptor Area
//!     * Available Ring - occupies the Driver Area
//!     * Used Ring - occupies the Device Area
//!
//! NOTE: 4096 in #[repr(C, align(4096))] is PGSIZE

use array_macro::array;

use core::convert::TryFrom;
use core::option::Option;
use core::sync::atomic::{fence, Ordering};
use core::ptr;
use core::convert::TryInto;

use crate::define::layout::{PGSHIFT, PGSIZE, VIRTIO0};
use crate::define::fs::BSIZE;
use crate::define::virtio::*;
use crate::fs::Buf;
use crate::lock::spinlock::Spinlock;
use crate::process::{PROC_MANAGER, CPU_MANAGER};

pub static DISK: Spinlock<Disk> = Spinlock::new(Disk::new(), "virtio_disk");

#[repr(C, align(4096))]
pub struct Disk {
    // a page
    pad1: Pad,
    desc: [VQDesc; NUM],
    avail: VQAvail,
    // another page
    pad2: Pad,
    used: VQUsed,
    // end
    pad3: Pad,
    free: [bool; NUM],
    used_idx: u16,
    info: [Info; NUM],
    ops: [VirtIOBlkReq; NUM],
}

impl Disk {
    const fn new() -> Self {
        Self {
            pad1: Pad::new(),
            desc: array![_ => VQDesc::new(); NUM],
            avail: VQAvail::new(),
            pad2: Pad::new(),
            pad3: Pad::new(),
            used: VQUsed::new(),
            free: [false; NUM],
            used_idx: 0,
            info: array![_ => Info::new(); NUM],
            ops: array![_ => VirtIOBlkReq::new(); NUM],
        }
    }

    /// Init the Disk.
    /// Only called once when the kernel boots.
    pub unsafe fn init(&mut self) {
        debug_assert_eq!((&self.desc as *const _ as usize) % PGSIZE, 0);
        debug_assert_eq!((&self.used as *const _ as usize) % PGSIZE, 0);
        debug_assert_eq!((&self.free as *const _ as usize) % PGSIZE, 0);
    
        if read(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976
            || read(VIRTIO_MMIO_VERSION) != 1
            || read(VIRTIO_MMIO_DEVICE_ID) != 2
            || read(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551
        {
            panic!("could not find virtio disk");
        }
    
        // step 1,2,3 - reset and set these two status bit
        let mut status: u32 = 0;
        status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
        write(VIRTIO_MMIO_STATUS, status);
        status |= VIRTIO_CONFIG_S_DRIVER;
        write(VIRTIO_MMIO_STATUS, status);
    
        // step 4 - read feature bits and negotiate
        let mut features: u32 = read(VIRTIO_MMIO_DEVICE_FEATURES);
        features &= !(1u32 << VIRTIO_BLK_F_RO);
        features &= !(1u32 << VIRTIO_BLK_F_SCSI);
        features &= !(1u32 << VIRTIO_BLK_F_CONFIG_WCE);
        features &= !(1u32 << VIRTIO_BLK_F_MQ);
        features &= !(1u32 << VIRTIO_F_ANY_LAYOUT);
        features &= !(1u32 << VIRTIO_RING_F_EVENT_IDX);
        features &= !(1u32 << VIRTIO_RING_F_INDIRECT_DESC);
        write(VIRTIO_MMIO_DRIVER_FEATURES, features);
    
        // step 5
        // set FEATURES_OK bit to tell the device feature negotiation is complete
        status |= VIRTIO_CONFIG_S_FEATURES_OK;
        write(VIRTIO_MMIO_STATUS, status);
    
        // step 8
        // set DRIVER_OK bit to tell device that driver is ready
        // at this point device is "live"
        status |= VIRTIO_CONFIG_S_DRIVER_OK;
        write(VIRTIO_MMIO_STATUS, status);
    
        write(VIRTIO_MMIO_GUEST_PAGE_SIZE, PGSIZE as u32);
    
        // initialize queue 0
        write(VIRTIO_MMIO_QUEUE_SEL, 0);
        let max = read(VIRTIO_MMIO_QUEUE_NUM_MAX);
        if max == 0 {
            panic!("virtio disk has no queue 0");
        }
        if max < NUM as u32 {
            panic!("virtio disk max queue short than NUM={}", NUM);
        }
        write(VIRTIO_MMIO_QUEUE_NUM, NUM as u32);
        let pfn: usize = (self as *const Disk as usize) >> PGSHIFT;
        write(VIRTIO_MMIO_QUEUE_PFN, u32::try_from(pfn).unwrap());

        // set the descriptors free
        self.free.iter_mut().for_each(|f| *f = true);
    }

    /// Allocate three descriptors.
    fn alloc3_desc(&mut self, idx: &mut [usize; 3]) -> bool {
        for i in 0..idx.len() {
            match self.alloc_desc() {
                Some(ix) => idx[i] = ix,
                None => {
                    for j in 0..i {
                        self.free_desc(j);
                    }
                    return false;
                }
            }
        }
        true
    }

    /// Allocate one descriptor.
    fn alloc_desc(&mut self) -> Option<usize> {
        debug_assert_eq!(self.free.len(), NUM);
        for i in 0..NUM {
            if self.free[i] {
                self.free[i] = false;
                return Some(i)
            }
        }
        None
    }

    /// Mark a descriptor as free.
    fn free_desc(&mut self, i: usize) {
        if i >= NUM || self.free[i] {
            panic!("desc index not correct");
        }
        self.desc[i].addr = 0;
        self.desc[i].len = 0;
        self.desc[i].flags = 0;
        self.desc[i].next = 0;
        self.free[i] = true;
        unsafe {
            PROC_MANAGER.wake_up(&self.free[0] as *const bool as usize);
        }
    }

    /// Free a chain of descriptors.
    fn free_chain(&mut self, mut i: usize) {
        loop {
            let flag = self.desc[i].flags;
            let next = self.desc[i].next;
            self.free_desc(i);
            if (flag & VRING_DESC_F_NEXT) != 0 {
                i = next as usize;
            } else {
                break;
            }
        }
    }

    /// Called by the trap/interrupt handler in the kernel 
    /// when the disk sends an interrupt.
    pub fn intr(&mut self) {
        unsafe {
            let intr_stat = read(VIRTIO_MMIO_INTERRUPT_STATUS);
            write(VIRTIO_MMIO_INTERRUPT_ACK, intr_stat & 0x3);
        }

        fence(Ordering::SeqCst);

        // the device increments disk.used->idx when it
        // adds an entry to the used ring.
        while self.used_idx != self.used.idx {
            fence(Ordering::SeqCst);
            let id = self.used.ring[self.used_idx as usize % NUM].id as usize;

            if self.info[id].status != 0 {
                panic!("interrupt status");
            }

            let buf_raw_data = self.info[id].buf_channel.clone()
                .expect("virtio disk intr handler not found pre-stored buf channel to wakeup");
            self.info[id].disk = false;
            unsafe { PROC_MANAGER.wake_up(buf_raw_data); }

            self.used_idx += 1;
        }
    }
}

impl Spinlock<Disk> {
    /// Read or write a certain Buf, which is returned after the op is done. 
    pub fn rw(&self, buf: &mut Buf<'_>, writing: bool) {
        let mut guard = self.acquire();
        let buf_raw_data = buf.raw_data_mut();

        let mut idx: [usize; 3] = [0; 3];
        loop {
            if guard.alloc3_desc(&mut idx) {
                break;
            } else {
                unsafe {
                    CPU_MANAGER.myproc().unwrap().sleep(&guard.free[0] as *const bool as usize, guard);
                }
                guard = self.acquire();
            }
        }

        // format descriptors
        // QEMU's virtio block device read them
        let buf0 = &mut guard.ops[idx[0]];
        buf0.type_ = if writing { VIRTIO_BLK_T_OUT } else { VIRTIO_BLK_T_IN };
        buf0.reserved = 0;
        buf0.sector = (buf.read_blockno() as usize * (BSIZE / 512)) as u64;

        guard.desc[idx[0]].addr = buf0 as *mut _ as u64;
        guard.desc[idx[0]].len = core::mem::size_of::<VirtIOBlkReq>().try_into().unwrap();
        guard.desc[idx[0]].flags = VRING_DESC_F_NEXT;
        guard.desc[idx[0]].next = idx[1].try_into().unwrap();

        guard.desc[idx[1]].addr = buf_raw_data as u64;
        guard.desc[idx[1]].len = BSIZE.try_into().unwrap();
        guard.desc[idx[1]].flags = if writing { 0 } else { VRING_DESC_F_WRITE };
        guard.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
        guard.desc[idx[1]].next = idx[2].try_into().unwrap();

        guard.info[idx[0]].status = 0xff;
        guard.desc[idx[2]].addr = &mut guard.info[idx[0]].status as *mut _ as u64;
        guard.desc[idx[2]].len = 1;
        guard.desc[idx[2]].flags = VRING_DESC_F_WRITE;
        guard.desc[idx[2]].next = 0;

        // record the buf
        // retrieve it back when the disk finishes with the raw buf data
        guard.info[idx[0]].disk = true;
        guard.info[idx[0]].buf_channel = Some(buf_raw_data as usize);

        {
            let i = guard.avail.idx as usize % NUM;
            guard.avail.ring[i] = idx[0].try_into().unwrap();
        }

        fence(Ordering::SeqCst);

        guard.avail.idx += 1;

        fence(Ordering::SeqCst);

        unsafe { write(VIRTIO_MMIO_QUEUE_NOTIFY, 0); }

        // wait for the disk to handle the buf data
        while guard.info[idx[0]].disk {
            // choose the raw buf data as channel
            unsafe { CPU_MANAGER.myproc().unwrap().sleep(buf_raw_data as usize, guard); }
            guard = self.acquire();
        }

        let buf_channel = guard.info[idx[0]].buf_channel.take();
        debug_assert_eq!(buf_channel.unwrap(), buf_raw_data as usize);
        guard.free_chain(idx[0]);

        drop(guard);
    }
}

#[repr(C, align(4096))]
struct Pad();

impl Pad {
    const fn new() -> Self {
        Self()
    }
}

#[repr(C, align(16))]
struct VQDesc {
    addr: u64,
    len: u32,
    flags: u16,
    next: u16,
}

impl VQDesc {
    const fn new() -> Self {
        Self {
            addr: 0,
            len: 0,
            flags: 0,
            next: 0,
        }
    }
}

#[repr(C, align(2))]
struct VQAvail {
    flags: u16,
    idx: u16,
    ring: [u16; NUM],
    unused: u16,
}

impl VQAvail {
    const fn new() -> Self {
        Self {
            flags: 0,
            idx: 0,
            ring: [0; NUM],
            unused: 0,
        }
    }
}

#[repr(C, align(4))]
struct VQUsed {
    flags: u16,
    idx: u16,
    ring: [VQUsedElem; NUM],
}

impl VQUsed {
    const fn new() -> Self {
        Self {
            flags: 0,
            idx: 0,
            ring: array![_ => VQUsedElem::new(); NUM],
        }
    }
}

#[repr(C)]
struct VQUsedElem {
    id: u32,
    len: u32,
}

impl VQUsedElem {
    const fn new() -> Self {
        Self {
            id: 0,
            len: 0,
        }
    }
}

#[repr(C)]
struct Info {
    /// Disk rw op stores the sleep channel in it.
    /// Disk intr op retrieves it to wake up proc.
    buf_channel: Option<usize>,
    status: u8,
    /// Is the relevant buf owned by disk?
    disk: bool,
}

impl Info {
    const fn new() -> Self {
        Self {
            buf_channel: None,
            status: 0,
            disk: false,
        }
    }
}

#[repr(C)]
struct VirtIOBlkReq {
    type_: u32,
    reserved: u32,
    sector: u64,
}

impl VirtIOBlkReq {
    const fn new() -> Self {
        Self {
            type_: 0,
            reserved: 0,
            sector: 0,
        }
    }
}

// virtio mmio control registers' offset
// from qemu's virtio_mmio.h
const VIRTIO_MMIO_MAGIC_VALUE: usize = 0x000;
const VIRTIO_MMIO_VERSION: usize = 0x004;
const VIRTIO_MMIO_DEVICE_ID: usize = 0x008;
const VIRTIO_MMIO_VENDOR_ID: usize = 0x00c;
const VIRTIO_MMIO_DEVICE_FEATURES: usize = 0x010;
const VIRTIO_MMIO_DRIVER_FEATURES: usize = 0x020;
const VIRTIO_MMIO_GUEST_PAGE_SIZE: usize = 0x028;
const VIRTIO_MMIO_QUEUE_SEL: usize = 0x030;
const VIRTIO_MMIO_QUEUE_NUM_MAX: usize = 0x034;
const VIRTIO_MMIO_QUEUE_NUM: usize = 0x038;
const VIRTIO_MMIO_QUEUE_ALIGN: usize = 0x03c;
const VIRTIO_MMIO_QUEUE_PFN: usize = 0x040;
const VIRTIO_MMIO_QUEUE_READY: usize = 0x044; 
const VIRTIO_MMIO_QUEUE_NOTIFY: usize = 0x050;
const VIRTIO_MMIO_INTERRUPT_STATUS: usize = 0x060;
const VIRTIO_MMIO_INTERRUPT_ACK: usize = 0x064;
const VIRTIO_MMIO_STATUS: usize = 0x070;

// virtio status register bits
// from qemu's virtio_config.h
const VIRTIO_CONFIG_S_ACKNOWLEDGE: u32 = 1;
const VIRTIO_CONFIG_S_DRIVER: u32 = 2;
const VIRTIO_CONFIG_S_DRIVER_OK: u32 = 4;
const VIRTIO_CONFIG_S_FEATURES_OK: u32 = 8;

// device feature bits
const VIRTIO_BLK_F_RO: u8 = 5;
const VIRTIO_BLK_F_SCSI: u8 = 7;
const VIRTIO_BLK_F_CONFIG_WCE: u8 = 11;
const VIRTIO_BLK_F_MQ: u8 = 12;
const VIRTIO_F_ANY_LAYOUT: u8 = 27;
const VIRTIO_RING_F_INDIRECT_DESC: u8 = 28;
const VIRTIO_RING_F_EVENT_IDX: u8 = 29;

// VRingDesc flags
const VRING_DESC_F_NEXT: u16 = 1; // chained with another descriptor
const VRING_DESC_F_WRITE: u16 = 2; // device writes (vs read)

// for disk ops
const VIRTIO_BLK_T_IN: u32 = 0; // read the disk
const VIRTIO_BLK_T_OUT: u32 = 1; // write the disk

// this many virtio descriptors
// must be a power of 2
const NUM: usize = 8;

#[inline]
unsafe fn read(offset: usize) -> u32 {
    let src = (Into::<usize>::into(VIRTIO0) + offset) as *const u32;
    ptr::read_volatile(src)
}

#[inline]
unsafe fn write(offset: usize, data: u32) {
    let dst = (Into::<usize>::into(VIRTIO0) + offset) as *mut u32;
    ptr::write_volatile(dst, data);
}
