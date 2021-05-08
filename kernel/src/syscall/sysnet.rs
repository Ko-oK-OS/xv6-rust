use crate::net::{ mbuf::MBuf };
use crate::lock::spinlock::{ Spinlock, SpinlockGuard };
use alloc::boxed::Box;


// static mut UDPSOCKET_LIST:Spinlock<UdpSocket> = Spinlock::new(UdpSocket::new(), "udpsock");

struct UdpSocket {
    next: Spinlock<Box<UdpSocket>>, // the next socket in the list
    raddr: u32, // the remote IPv4 address
    lport: u16, // the local UDP port number,
    rport: u16, // the remote UDP port number,
    rxq: MBuf, // a queue of packets waiting to be received
}

impl UdpSocket {
    // const fn new() -> Self {
    //     Self{
    //         next: Spinlock::new(Box::<UdpSocket>::new_zeroed().assume_init(), "udpsock"),
    //         raddr: 0,
    //         lport: 0,
    //         rport: 0,
    //         rxq: MBuf::new()
    //     }
    // }

    pub fn alloc<'a>(raddr:u32, lport:u16, rport:u16) -> Result<SpinlockGuard<'a, UdpSocket>, &'static str> {

        Err("no implemented")
    }
}

// called by protocol handler to deliver UDP packets
pub fn sock_recv_udp(mut m: MBuf, raddr:u32, lport:u16, rport:u16) {
    // Find the socket that handles this mbuf and deliver it, waking
    // any sleeping reader. Free the mbuf if there no sockets 
    // registered to handle it.

    // match UdpSocket::alloc(raddr, lport, rport) {
    //     Ok(sock) => {
    //         sock.rxq = m;
    //     }

    //     Err(err) => {
    //         println!("err: {}", err);
    //         m.free();
    //         return
    //     }
    // }

}