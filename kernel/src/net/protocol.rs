use super::mbuf::MBuf;
use crate::syscall::sock_recv_udp;
use core::mem::size_of;

// qemu's idea of the guest IP
static LOCAL_IP:u32 = make_ip_addr(10, 0, 2, 15);
static LOCAL_MAC:[u8;ETHADDR_LEN] = [0x52, 0x54, 0x00, 0x12, 0x34, 0x56];
static BROADCAST_MAC:[u8;ETHADDR_LEN] = [0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF];


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

// This code is lifted from FreeBSD's ping.c, and is copyright by the Regents
// of the University of California. 
#[deny(arithmetic_overflow)]
pub fn in_cksum(addr:*mut u8, len:u32) -> u16 {
    let mut sum:u32 = 0;
    let mut nleft = len;
    let mut w = addr;
    
     // Our algorithm is simple, using a 32 bit accmulator (sum), we add
     // sequential 16 bit words to it, and at the end, fold back all the 
     // carry bits from the top 16 bits into the lower 16 bits. 
     while nleft > 0 {
        sum += unsafe{ *w as u32 };
        w = (w as usize + 1) as *mut u8;
        nleft -= 2;
     }

     // mop up an odd byte, if necessary
     // emmm, I think it is unnecessary

     // add back carry outs from top 16 bits to low bits
     sum = (sum & 0xFFFF) + (sum >> 16);
     sum = sum + (sum >> 16);
     // guaranted now that lower 16 bits of sum are correct

     let answer:u16 = !sum as u16;

     answer
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
    pub dhost:[u8;ETHADDR_LEN],
    pub shost:[u8;ETHADDR_LEN],
    pub eth_type:u16,
}


const ETHTYPE_IP:u16 = 0x0800; // Internet Protocol
const ETHTYPE_ARP:u16 = 0x0806; // Address Resolution Protocol

// an IP packet header(comes after an Ethernet header).
struct IP {
    pub ip_vhl:u8, // version << 4 | header length >> 2
    pub ip_tos:u8, // type of service
    pub ip_len:u16, // total length
    pub ip_id:u16, // identification 
    pub ip_off:u16, // fragment offset field
    pub ip_ttl:u8, // time to live
    pub ip_p:u8, // protocol
    pub ip_sum:u16, // checksum
    pub ip_src:u32,
    pub ip_dst:u32,
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
#[repr(C, packed)]
struct UDP {
    pub udp_sport:u16, // source port
    pub udp_dport:u16, // destination port
    pub udp_len:u16, // length, including udp header, not including IP header
    pub udp_sum:u16, // checksum
}


// a TCP packet header (comes after an IP header)
struct TCP {
    pub tcp_sport:u16, /* source port */
    pub tcp_dport:u16, /* destination port */
    pub tcp_seq:u32,  /* sequence number */
    pub tcp_ack:u32, /* acknowledgment number */
    pub tcp_offset:u8, /* data offset, in bytes */
    pub tcp_flags:u8, /* flags */
    pub tcp_window:u16, /* window size */
    pub tcp_checksum:u16, /* checksum */
    pub tcp_urgent:u16, /* urgent data pointer */
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
    pub fn send(mut m:MBuf, eth_type:u16) {
        let eth_header = unsafe{ &mut *(m.push(size_of::<Eth>() as u32) as *mut Eth) };
        eth_header.shost = LOCAL_MAC.clone();

        // In a real networking stack, dhost would be set to the address discovered
        // through ARP. Because we don't support enough of the ARP protocol, set it 
        // to broadcast instead. 
        eth_header.dhost = BROADCAST_MAC.clone();
        eth_header.eth_type = eth_type;

        if m.e1000_transmit().is_ok() {
            m.free();
        }

    }

    // called by e1000 driver's interrupt handler to deliver a packet to the
    // networking stack
    pub fn receive(mut m:MBuf) {
        // let eth_hdr = m.pull(size_of::<Eth>() as u32);
        match m.pull(size_of::<Eth>() as u32) {
            Some(eth_header) => {
                let eth_header = unsafe{ &mut *(eth_header as *mut Eth) };
                let eth_type = Eth::ntohs(eth_header.eth_type);

                match eth_type {
                    ETHTYPE_IP => {
                        IP::receive(m);
                    },

                    ETHTYPE_ARP => {
                        ARP::receive(m);
                    },

                    _ => {
                        m.free();
                    }
                }
            },

            None => {
                m.free();
            }
        }
    }
}

impl IP {
    pub fn send(mut m:MBuf, proto:u8, dip:u32) {
        // push the IP header
        let ip_header = unsafe{ &mut *(m.push(size_of::<IP>() as u32) as *mut IP) };
        ip_header.ip_vhl = (4 << 4) | (20 >> 2);
        ip_header.ip_p = proto;
        ip_header.ip_src = IP::htonl(LOCAL_IP);
        ip_header.ip_dst = IP::htonl(dip);
        ip_header.ip_len = IP::htons(m.len as u16);
        ip_header.ip_ttl = 100;
        ip_header.ip_sum = in_cksum((ip_header as *mut _) as *mut u8, size_of::<IP>() as u32);
    }

    // receive an IP packet
    pub fn receive(mut m: MBuf) {
        match m.pull(size_of::<IP>() as u32) {
            Some(ip_header) => {
                let ip_header = unsafe{ &mut *(ip_header as *mut IP) };

                // check IP version and header len
                if ip_header.ip_vhl != ((4 << 4) | (20 >> 2)) {
                    m.free();
                    return
                }

                // validate IP checksum
                // TODO: in_cksum

                // can't support fragmented IP packets
                if IP::htons(ip_header.ip_off) != 0 {
                    m.free();
                    return
                }

                // is the packet addressed to us ?
                if IP::htonl(ip_header.ip_dst) != LOCAL_IP {
                    m.free();
                    return
                }

                match ip_header.ip_p {
                    IPPOTO_UDP => {
                        println!("IP receive: UDP.");
                    },

                    IPPOTO_TCP => {
                        println!("IP receive: TCP.");
                    }

                    _ => {
                        println!("IP receive: unsupported protocol.");
                        m.free();
                        return
                    }
                }

            },

            None => {
                m.free();
                return
            }
        }
    }
}

impl ARP {
    // receives an ARP packet
    pub fn receive(mut _m: MBuf) {
        panic!("no implemented!");
    }
}

impl UDP {
    // sends the UDP packet
    pub fn send(mut m: MBuf, dip:u32, sport:u16, dport:u16) {
        // put the UDP header
        let udp_header = unsafe{ &mut *(m.push(size_of::<UDP>() as u32) as *mut UDP) };
        udp_header.udp_sport = UDP::htons(sport);
        udp_header.udp_dport = UDP::htons(dport);
        udp_header.udp_len = UDP::htons(m.len as u16);
        udp_header.udp_sum = 0; // zero means to checksum is provided

        // now on to the IP layer
        IP::send(m, IPPOTO_UDP, dip);
    }

    // receives a UDP packet
    pub fn receive(mut m:MBuf, mut len:u16, ip_header: &IP) {
        if let Some(udp_header) = m.pull(size_of::<UDP> as u32) {
            let udp_header = unsafe{ &mut *(udp_header as *mut UDP) };
            // TODO: validate UDP checksum

            // validate lengths reported in headers
            if UDP::ntohs(udp_header.udp_len) != len {
                m.free();
                return
            }

            len = len - size_of::<UDP>() as u16;
            if len > m.len as u16 {
                m.free();
                return
            }

            // minium packet size could be larger than the payload
            m.trim(m.len - (len as u32));

            // parse the necessary fields
            let sip = IP::ntohl(ip_header.ip_src);
            let sport = UDP::ntohs(udp_header.udp_sport);
            let dport = UDP::ntohs(udp_header.udp_dport);
            sock_recv_udp(m, sip, dport, sport);
            return 
        }

        m.free();
    }
}

impl TCP {
    // sends the TCP packet
    // try to implement TCP myself
    pub fn send(mut m:MBuf, dip:u32, sport:u16, dport:u16) {
        // put the TCP header
        let tcp_header = unsafe{ &mut *(m.push(size_of::<TCP>() as u32) as *mut TCP) };
        tcp_header.tcp_sport = TCP::htons(sport);
        tcp_header.tcp_dport = TCP::htons(dport);
        
        // make zero only
        tcp_header.tcp_ack = 0;
        tcp_header.tcp_checksum = 0;
        tcp_header.tcp_flags = 0;
        tcp_header.tcp_offset = 0;
        tcp_header.tcp_window = 0;
        tcp_header.tcp_seq = 0;
        tcp_header.tcp_urgent = 0;
        
        // now on the IP layer
        IP::send(m, IPPOTO_TCP, dip);
    }
}