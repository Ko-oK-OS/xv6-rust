use crate::{println, shutdown::*};
use crate::kernel_syscall::*;
use crate::register::satp;
use crate::console::*;
 
pub fn kernel_syscall(
    _: usize, 
    _: usize, 
    _: usize, 
    which: usize
) {
    unsafe{
        satp::write(0);
    }
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

pub fn supervisor_external() {
    let mut uart = UART.acquire();
    let c = uart.get().unwrap();
    println!("{}", c);
    drop(uart);
}