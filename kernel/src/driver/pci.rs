// use crate::define::layout::{ ECAM, E1000_REGS };
// use crate::net::e1000::e1000_init;
// use core::ptr;
// use core::mem::size_of;
// use core::sync::atomic::{ fence, Ordering };
// pub fn pci_init() {

//     println!("pci init......");
//     // look at each possible PCI device on bus 0.
//     for dev in 0..32 {
//         let bus:usize = 0;
//         let func:usize = 0;
//         let offset:usize = 0;
//         let off = (bus << 16) | (dev << 11) | (func << 8) | (offset);

//         // get base address
//         let base = ECAM + off*size_of::<u32>();
//         let id = unsafe{
//             ptr::read(base as *const u32)
//         };

//         if id == 0x100e8086 {
//             // command and status register.
//             // bit 0 : I/O access enable
//             // bit 1 : memory access enable
//             // bit 2 : enable mastering
//             unsafe{
//                 ptr::write((base + size_of::<u32>()) as *mut u32, 7);

//                 fence(Ordering::SeqCst);

//                 for i in 0..6 {
//                     let old_addr = base + (4+i)*size_of::<u32>();
//                     let old_value = ptr::read(old_addr as *const u32);

//                     // writing all 1's to the BAR causes it to be
//                     // replaced with its size.
//                     ptr::write(old_addr as *mut u32, 0xffffffff);

//                     fence(Ordering::SeqCst);

//                     ptr::write(old_addr as *mut u32, old_value);
                    
//                 }

//                 // tell the e1000 to reveal its registers at
//                 // physical address 0x40000000.
//                 ptr::write((base + 4*size_of::<u32>()) as *mut u32, E1000_REGS as u32);

//                 e1000_init();
//             }

//         }
//     }
// }