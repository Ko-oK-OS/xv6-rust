// Register
pub const E1000_CTL:usize = 0x00000; /* Device Control Register - RW */
pub const E1000_ICR:usize = 0x000C0; /* Interrupt Cause Read - R */
pub const E1000_IMS:usize = 0x000D0; /* Interrupt Mask Set - RW */
pub const E1000_RCTL:usize = 0x00100; /* RX Control - RW */
pub const E1000_TCTL:usize = 0x00400; /* TX Control - RW */
pub const E1000_TIPG:usize = 0x00410;  /* TX Inter-packet gap -RW */
pub const E1000_RDBAL:usize = 0x02800;  /* RX Descriptor Base Address Low - RW */
pub const E1000_RDTR:usize  = 0x02820;  /* RX Delay Timer */
pub const E1000_RADV:usize  = 0x0282C;  /* RX Interrupt Absolute Delay Timer */
pub const E1000_RDH:usize = 0x02810;  /* RX Descriptor Head - RW */
pub const E1000_RDT:usize = 0x02818;  /* RX Descriptor Tail - RW */
pub const E1000_RDLEN:usize = 0x02808;  /* RX Descriptor Length - RW */
pub const E1000_RSRPD:usize = 0x02C00;  /* RX Small Packet Detect Interrupt */
pub const E1000_TDBAL:usize = 0x03800;  /* TX Descriptor Base Address Low - RW */
pub const E1000_TDLEN:usize = 0x03808; /* TX Descriptor Length - RW */
pub const E1000_TDH:usize = 0x03810; /* TX Descriptor Head - RW */
pub const E1000_TDT:usize = 0x03818;  /* TX Descripotr Tail - RW */
pub const E1000_MTA:usize = 0x05200;  /* Multicast Table Array - RW Array */
pub const E1000_RA:usize =  0x05400;  /* Receive Address - RW Array */

/* Device Control */
pub const E1000_CTL_SLU:usize = 0x00000040;    /* set link up */
pub const E1000_CTL_FRCSPD:usize = 0x00000800;    /* force speed */
pub const E1000_CTL_FRCDPLX:usize = 0x00001000;    /* force duplex */
pub const E1000_CTL_RST:usize = 0x00400000;    /* full reset */


/* Receive Control */
pub const E1000_RCTL_RST:usize = 0x00000001;    /* Software reset */
pub const E1000_RCTL_EN:usize = 0x00000002;    /* enable */
pub const E1000_RCTL_SBP:usize  = 0x00000004;    /* store bad packet */
pub const E1000_RCTL_UPE:usize = 0x00000008;    /* unicast promiscuous enable */
pub const E1000_RCTL_MPE:usize = 0x00000010;    /* multicast promiscuous enab */
pub const E1000_RCTL_LPE:usize = 0x00000020;    /* long packet enable */
pub const E1000_RCTL_LBM_NO:usize = 0x00000000;    /* no loopback mode */
pub const E1000_RCTL_LBM_MAC:usize = 0x00000040;    /* MAC loopback mode */
pub const E1000_RCTL_LBM_SLP:usize = 0x00000080;    /* serial link loopback mode */
pub const E1000_RCTL_LBM_TCVR:usize = 0x000000C0;    /* tcvr loopback mode */
pub const E1000_RCTL_DTYP_MASK:usize = 0x00000C00;    /* Descriptor type mask */
pub const E1000_RCTL_DTYP_PS:usize = 0x00000400;    /* Packet Split descriptor */
pub const E1000_RCTL_RDMTS_HALF:usize = 0x00000000;    /* rx desc min threshold size */
pub const E1000_RCTL_RDMTS_QUAT:usize = 0x00000100;    /* rx desc min threshold size */
pub const E1000_RCTL_RDMTS_EIGTH:usize = 0x00000200;    /* rx desc min threshold size */
pub const E1000_RCTL_MO_SHIFT:usize = 12;            /* multicast offset shift */
pub const E1000_RCTL_MO_0:usize = 0x00000000;    /* multicast offset 11:0 */
pub const E1000_RCTL_MO_1:usize = 0x00001000;    /* multicast offset 12:1 */
pub const E1000_RCTL_MO_2:usize = 0x00002000;    /* multicast offset 13:2 */
pub const E1000_RCTL_MO_3:usize = 0x00003000;    /* multicast offset 15:4 */
pub const E1000_RCTL_MDR:usize =  0x00004000 ;   /* multicast desc ring 0 */
pub const E1000_RCTL_BAM:usize =  0x00008000;    /* broadcast enable */
/* these buffer sizes are valid if E1000_RCTL_BSEX is 0 */
pub const E1000_RCTL_SZ_2048:usize = 0x00000000;    /* rx buffer size 2048 */
pub const E1000_RCTL_SZ_1024:usize = 0x00010000;    /* rx buffer size 1024 */
pub const E1000_RCTL_SZ_512:usize = 0x00020000;    /* rx buffer size 512 */
pub const E1000_RCTL_SZ_256:usize = 0x00030000;    /* rx buffer size 256 */

/* these buffer sizes are valid if E1000_RCTL_BSEX is 1 */
pub const E1000_RCTL_SZ_16384:usize = 0x00010000;    /* rx buffer size 16384 */
pub const E1000_RCTL_SZ_8192:usize =  0x00020000;    /* rx buffer size 8192 */
pub const E1000_RCTL_SZ_4096:usize =  0x00030000;    /* rx buffer size 4096 */
pub const E1000_RCTL_VFE:usize = 0x00040000;    /* vlan filter enable */
pub const E1000_RCTL_CFIEN:usize = 0x00080000;    /* canonical form enable */
pub const E1000_RCTL_CFI:usize = 0x00100000;    /* canonical form indicator */
pub const E1000_RCTL_DPF:usize = 0x00400000;    /* discard pause frames */
pub const E1000_RCTL_PMCF:usize = 0x00800000;    /* pass MAC control frames */
pub const E1000_RCTL_BSEX:usize = 0x02000000;    /* Buffer size extension */
pub const E1000_RCTL_SECRC:usize = 0x04000000;    /* Strip Ethernet CRC */
pub const E1000_RCTL_FLXBUF_MASK:usize = 0x78000000;    /* Flexible buffer size */
pub const E1000_RCTL_FLXBUF_SHIFT:usize = 27;            /* Flexible buffer shift */