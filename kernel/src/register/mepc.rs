pub unsafe fn write(mepc: usize) {
    llvm_asm!("csrw mepc, $0" :: "r"(mepc)::"volatile");
}