//! Legacy SBI calls used by the S-mode payload entry path.

use core::arch::asm;

const SBI_SET_TIMER: usize = 0;
const SBI_CONSOLE_PUTCHAR: usize = 1;
const SBI_CONSOLE_GETCHAR: usize = 2;

#[inline(always)]
unsafe fn call(extension: usize, arg0: usize, arg1: usize, arg2: usize) -> usize {
    let mut value = arg0;
    asm!(
        "ecall",
        inlateout("a0") value,
        in("a1") arg1,
        in("a2") arg2,
        in("a7") extension,
    );
    value
}

pub unsafe fn set_timer(deadline: usize) {
    let _ = call(SBI_SET_TIMER, deadline, 0, 0);
}

pub fn console_putchar(byte: u8) {
    unsafe {
        let _ = call(SBI_CONSOLE_PUTCHAR, byte as usize, 0, 0);
    }
}

pub fn console_getchar() -> Option<u8> {
    let value = unsafe { call(SBI_CONSOLE_GETCHAR, 0, 0, 0) };
    if value == usize::MAX {
        None
    } else {
        Some(value as u8)
    }
}
