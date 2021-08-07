use crate::shutdown::*;
use crate::kernel_syscall::*;
use crate::register::satp;
use crate::console::*;
use crate::memory::*;
use crate::process::*;
use crate::define::layout::PGSIZE;

use core::ptr::write_bytes;
 
pub fn kernel_syscall(
    _: usize, 
    _: usize, 
    _: usize, 
    which: usize
) {
    match which  {
        SHUTDOWN => {
            println!("\x1b[1;31mShutdown!\x1b[0m");
            system_reset(
                RESET_TYPE_SHUTDOWN,
                RESET_REASON_NO_REASON
            );
        },

        REBOOT => {
            println!("\x1b[1;31mReboot!\x1b[0m");
            system_reset(
                RESET_TYPE_COLD_REBOOT,
                RESET_REASON_NO_REASON
            );
        },

        _ => {
            panic!("Unresolved Kernel Syscall!");
        }
    }
}

// pub fn supervisor_external() {
//     let mut uart = UART.acquire();
//     let c = uart.get().unwrap();
//     println!("{}", c);
//     drop(uart);
// }

pub fn instr_handler(sepc: usize) {
    panic!("Instruction Fault occuer in 0x{:x}", sepc);
}

// lazy allocate memory when user call sys_sbrk
// we add the size of user process but not allocate
// memory, so it'll generate a page fault when user
// access invalid virtual address, we will allocate page
// here supported by stval and map virtual address into 
// physical address.
pub unsafe fn lazy_allocate(stval: usize) {
    // staval contains the virtual address that cause page fault.
    let mut va = VirtualAddress::new(stval);
    // page alignment
    va.pg_round_down();

    let extern_data = CPU_MANAGER.myproc().unwrap().extern_data.get_mut();
    let page_table = extern_data.pagetable.as_mut().unwrap();

    let mm = RawPage::new_zeroed() as *mut u8;
    write_bytes(mm, 0, PGSIZE);
    let pa = PhysicalAddress::new(mm as usize);

    if !page_table.map(
        va,
        pa,
        PGSIZE,
        PteFlags::W | PteFlags::R | PteFlags::X | PteFlags::U
    ) {
        panic!("lazy_allocate(): fail to allocate physical address for invalid virtual address.");
    }
}