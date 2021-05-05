
const ETHADDR_LEN:usize = 6;
// an Ethernet packet header (start of the packet)
#[repr(C, packed)]
struct Eth {
    dhost:[u8;ETHADDR_LEN],
    shost:[u8;ETHADDR_LEN],
    eth_type:u16,
}

const ETHTYPE_IP:u16 = 0x0800; // Internet Protocol
const ETHTYPE_ARP:u16 = 0x0806; // Address Resolution Protocol

// an IP packet header(comes after an Ethernet header).
struct IP {
    ip_vhl:u8, // version << 4 | header length >> 2
    ip_tos:u8, // type of service
    ip_len:u16, // total length
    ip_id:u16, // identification 
    ip_off:u16, // fragment offset field
    ip_ttl:u8, // time to live
    ip_p:u8, // protocol
    ip_sum:u16, // checksum
    ip_src:u32,
    ip_dst:u32,
}

const IPPROTO_ICMP:u8 = 1; // Control message protocol
const IPPOTO_TCP:u8 = 6; // Transmission control protocol
const IPPOTO_UDP:u8 = 17; // User datagram protocol

// a ARP packet header (comes after an Ethernet header)
#[repr(C, packed)]
struct ARP {
    arp_hrd:u16, // format of hardware
    arp_pro:u16, // format of protocol address
    arp_hln:u8, // length of hardware address
    arp_pln:u8, // length of protocol address
    arp_op:u16, // operation

    arp_sha: [u8; ETHADDR_LEN], // sender hardware address
    arp_sip:u32, // sender IP address
    arp_tha: [u8; ETHADDR_LEN], // target hardware address,
    arp_tip:u32, // target IP address
}

// a UDP packet header (comes after an IP header)
struct UDP {
    udp_sport:u16, // source port
    udp_dport:u16, // destination port
    udp_len:u16, // length, including udp header, not including IP header
    udp_sum:u16, // checksum
}

// a TCP packet header (comes after an IP header)
struct TCP {
    tcp_sport:u16, /* source port */
    tcp_dport:u16, /* destination port */
    tcp_seq:u32,  /* sequence number */
    tcp_ack:u32, /* acknowledgment number */
    tcp_offset:u8, /* data offset, in bytes */
    tcp_flags:u8, /* flags */
    tcp_window:u16, /* window size */
    tcp_checksum:u16, /* checksum */
    tcp_urgent:u16, /* urgent data pointer */
}

pub fn make_ip_addr(a:u32, b:u32, c:u32, d:u32) -> u32 {
    (a << 24) | (b << 16) | (c << 8) | d
}