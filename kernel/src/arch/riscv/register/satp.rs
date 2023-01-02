// use riscv's sv39 page table scheme.
pub const SATP_SV39:usize =  8 << 60;

// supervisor address translation and protection;
// holds the address of the page table.
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("csrr {}, satp",out(reg)ret);
    ret
}

pub unsafe fn write(x: usize){
    // println!("write satp");
    core::arch::asm!("csrw satp, {}", in(reg)x);
}