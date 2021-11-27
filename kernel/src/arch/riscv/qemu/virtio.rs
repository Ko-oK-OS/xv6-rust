//
// virtio device definitions.
// for both the mmio interface, and virtio descriptors.
// only tested with qemu.
// this is the "legacy" virtio interface.
//
// the virtio spec:
// https://docs.oasis-open.org/virtio/virtio/v1.1/virtio-v1.1.pdf
//

// virtio mmio control registers, mapped starting at 0x10001000.
// from qemu virtio_mmio.h
pub const VIRTIO_MMIO_MAGIC_VALUE: usize = 0x000; // 0x74726976
pub const VIRTIO_MMIO_VERSION: usize	= 0x004; // version; 1 is legacy
pub const VIRTIO_MMIO_DEVICE_ID: usize = 0x008; // device type; 1 is net, 2 is disk
pub const VIRTIO_MMIO_VENDOR_ID: usize =	0x00c; // 0x554d4551
pub const VIRTIO_MMIO_DEVICE_FEATURES: usize	= 0x010;
pub const VIRTIO_MMIO_DRIVER_FEATURES: usize	= 0x020;
pub const VIRTIO_MMIO_GUEST_PAGE_SIZE: usize	= 0x028; // page size for PFN, write-only
pub const VIRTIO_MMIO_QUEUE_SEL: usize = 0x030; // select queue, write-only
pub const VIRTIO_MMIO_QUEUE_NUM_MAX: usize = 0x034; // max size of current queue, read-only
pub const VIRTIO_MMIO_QUEUE_NUM: usize = 0x038; // size of current queue, write-only
pub const VIRTIO_MMIO_QUEUE_ALIGN: usize	= 0x03c; // used ring alignment, write-only
pub const VIRTIO_MMIO_QUEUE_PFN: usize =	0x040; // physical page number for queue, read/write
pub const VIRTIO_MMIO_QUEUE_READY: usize = 0x044; // ready bit
pub const VIRTIO_MMIO_QUEUE_NOTIFY: usize = 0x050; // write-only
pub const VIRTIO_MMIO_INTERRUPT_STATUS: usize = 0x060; // read-only
pub const VIRTIO_MMIO_INTERRUPT_ACK: usize = 0x064; // write-only
pub const VIRTIO_MMIO_STATUS: usize = 0x070; // read/write

// status register bits, from qemu virtio_config.h
pub const VIRTIO_CONFIG_S_ACKNOWLEDGE: u32 = 1;
pub const VIRTIO_CONFIG_S_DRIVER: u32 = 2;
pub const VIRTIO_CONFIG_S_DRIVER_OK: u32 = 4;
pub const VIRTIO_CONFIG_S_FEATURES_OK: u32 = 8;

// device feature bits
pub const VIRTIO_BLK_F_RO: u8 = 5;
pub const VIRTIO_BLK_F_SCSI: u8 = 7;
pub const VIRTIO_BLK_F_CONFIG_WCE: u8 = 11;
pub const VIRTIO_BLK_F_MQ: u8 = 12;
pub const VIRTIO_F_ANY_LAYOUT: u8 = 27;
pub const VIRTIO_RING_F_INDIRECT_DESC: u8 = 28;
pub const VIRTIO_RING_F_EVENT_IDX: u8 = 29;

// VRingDesc flags
pub const VRING_DESC_F_NEXT: u16 = 1; // chained with another descriptor
pub const VRING_DESC_F_WRITE: u16 = 2; // device writes (vs read)

// for disk ops
pub const VIRTIO_BLK_T_IN: u32 = 0; // read the disk
pub const VIRTIO_BLK_T_OUT: u32 = 1; // write the disk

// this many virtio descriptors.
// must be a power of two.
pub const NUM: usize = 8;
