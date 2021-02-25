// machine exception program counter, holds the
// instruction address to which a return from
// exception will go.
#[inline]
pub unsafe fn write(mepc: usize) {
    llvm_asm!("csrw mepc, $0" :: "r"(mepc)::"volatile");
}