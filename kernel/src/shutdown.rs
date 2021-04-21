use crate::kernel_syscall::{*, self};

#[doc(hidden)] #[allow(unused)]
pub const RESET_TYPE_SHUTDOWN: usize = 0x0000_0000;
#[doc(hidden)] #[allow(unused)]
pub const RESET_TYPE_COLD_REBOOT: usize = 0x0000_0001;
#[doc(hidden)] #[allow(unused)]
pub const RESET_TYPE_WARM_REBOOT: usize = 0x0000_0002;

#[doc(hidden)] #[allow(unused)]
pub const RESET_REASON_NO_REASON: usize = 0x0000_0000;
#[doc(hidden)] #[allow(unused)]
pub const RESET_REASON_SYSTEM_FAILURE: usize = 0x0000_0001;

const TEST_FAIL:u32 = 0x3333;
const TEST_PASS:u32 = 0x5555;
const TEST_RESET:u32 = 0x7777;

pub fn system_reset(reset_type: usize, reset_reason: usize) {
    const VIRT_TEST: *mut u32 = 0x10_0000 as *mut u32;

    // Fail = 0x3333,
    // Pass = 0x5555,
    // Reset = 0x7777,

    let mut value = match reset_type {
        RESET_TYPE_SHUTDOWN => TEST_PASS,
        RESET_TYPE_COLD_REBOOT => TEST_RESET,
        RESET_TYPE_WARM_REBOOT => TEST_RESET,
        _ => TEST_FAIL,
    };

    if reset_reason == RESET_REASON_SYSTEM_FAILURE {
        value = TEST_FAIL
    }

    unsafe {
        core::ptr::write_volatile(VIRT_TEST, value);
    }

    unreachable!();
}

pub fn shutdown() {
    kernel_syscall(SHUTDOWN, 0, 0, 0);
}

pub fn reboot() {
    kernel_syscall(REBOOT, 0, 0, 0);
}