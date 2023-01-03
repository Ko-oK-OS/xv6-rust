// Physical memory protection 
pub mod pmpcfg0 {
    use core::arch::asm;

    // Permission enum contains all possible permission modes for pmp registers
    #[derive(Clone, Copy, Debug)]
    pub enum Permission {
        NONE = 0b000,
        R = 0b001,
        W = 0b010,
        RW = 0b011,
        X = 0b100,
        RX = 0b101,
        WX = 0b110,
        RWX = 0b111,
    }

    // Range enum contains all possible addressing modes for pmp registers
    pub enum Range {
        OFF = 0b00,
        TOR = 0b01,
        NA4 = 0b10,
        NAPOT = 0b11,
    }

    // Set the pmp configuration corresponging to the index
    #[inline]
    pub unsafe fn set_pmp(index: usize, range: Range, permission: Permission, locked: bool) {
        assert!(index < 8);
        let mut value = _read();
        let byte = (locked as usize) << 7 | (range as usize) << 3 | (permission as usize);
        value |= byte << (8 * index);
        _write(value);
    }

    #[inline]
    unsafe fn _read() -> usize {
        let bits: usize;
        asm!("csrr {}, pmpcfg0", out(reg) bits);
        bits
    }

    #[inline]
    unsafe fn _write(bits: usize) {
        asm!("csrw pmpcfg0, {}", in(reg) bits);
    }
}

// Physical memory protection address register
pub mod pmpaddr0 {
    use core::arch::asm;

    pub fn write(bits: usize) {
        unsafe {
            asm!("csrw pmpaddr0, {}", in(reg) bits);
        }
    }
}