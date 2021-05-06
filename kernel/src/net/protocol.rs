use super::mbuf::MBuf;

// qemu's idea of the guest IP
static local_ip:u32 = make_ip_addr(10, 0, 2, 15);
static local_mac:[u8;ETHADDR_LEN] = [0x52, 0x54, 0x00, 0x12, 0x34, 0x56];
static broadcast_mac:[u8;ETHADDR_LEN] = [0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF];


#[inline]
pub fn bswaps(val: u16) -> u16 {
    ((val & 0x00FF) << 8) | ((val & 0xFF00) >> 8)
}

#[inline]
pub fn bswapl(val: u32) -> u32 {
    ((val & 0x000000FF) << 24) |
    ((val & 0x0000FF00) << 8)  |
    ((val & 0x00FF0000) >> 8)  |
    ((val & 0xFF000000) >> 24) 
}

pub trait Protocol {
    fn ntohs(val: u16) -> u16 {
        bswaps(val)
    }

    fn ntohl(val: u32) -> u32 {
        bswapl(val)
    }

    fn htons(val: u16) -> u16 {
        bswaps(val)
    }

    fn htonl(val: u32) -> u32 {
        bswapl(val)
    }
}


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


const ARP_HRD_ETHER:u8 = 1; // Ethernet

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

// an DNS packet (comes after an UDP header)
struct DNS {
    id:u16, // request ID

    rd:u8, // recursion desired
    tc:u8, // truncated
    aa:u8, // authoritive
    opcode: u8,
    qr:u8, // query/response 
    rcode:u8, // response code
    cd:u8, // checking disabled
    ad:u8, // authenticated data
    z:u8, 
    ra:u8, // recursion availavle

    qdcount:u16, // number of question entries
    ancount:u16, // number of resource records in answer section
    nscount:u16, // number of NS resource records in authority section
    arcount:u16, // number of resource records in additional records
}

#[repr(C, packed)]
struct DnsQuestion {
    qtype:u16, 
    qclass:u16
}

#[repr(C, packed)]
struct DnsData {
    dns_type:u16,
    dns_class:u16,
    dns_ttl:u32,
    dns_len:u16
}

pub const fn make_ip_addr(a:u32, b:u32, c:u32, d:u32) -> u32 {
    (a << 24) | (b << 16) | (c << 8) | d
}

impl Protocol for Eth{}
impl Protocol for IP{}
impl Protocol for ARP{}
impl Protocol for UDP{}
impl Protocol for TCP{}

impl Eth {
    // sends an ethernet packet
    pub fn send_eth(m:MBuf, eth_type:u16) {

    }

    // called by e1000 driver's interrupt handler to deliver a packet to the
    // networking stack
    pub fn rece_eth(m:MBuf) {

    }
}