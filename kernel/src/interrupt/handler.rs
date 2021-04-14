use crate::shutdown::*;
use crate::kernel_syscall::*;
use crate::register::satp;
pub fn handler_kernel_syscall(result: usize) {
    unsafe{
        satp::write(0);
    }
    match result  {
        SHUTDOWN => {
             println!("\x1b[1;31mshutdown! Bye~ \x1b[0m");
            system_reset(
                RESET_TYPE_SHUTDOWN,
                RESET_REASON_NO_REASON
            );
        }

        _ => {
            panic!("Unresolved Kernel Syscall!");
        }
    }
}