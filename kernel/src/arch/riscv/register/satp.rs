// use riscv's sv39 page table scheme.
pub const SATP_SV39:usize =  8 << 60;

// supervisor address translation and protection;
// holds the address of the page table.
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    llvm_asm!("csrr $0, satp":"=r"(ret):::"volatile");
    ret
}

pub unsafe fn write(x: usize){
    // println!("write satp");
    llvm_asm!("csrw satp, $0"::"r"(x)::"volatile");
}