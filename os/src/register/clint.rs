// core local interruptor (CLINT), which contains the timer.
const CLINT:usize = 0x2000000;
pub const CLINT_MTIME:usize = CLINT + 0xBFF8;

#[inline]
pub fn CLINT_MTIMECMP(hartid:usize) -> usize{
    let ret:usize;
    ret = CLINT + 0x4000 + 8*hartid;
    ret
}


