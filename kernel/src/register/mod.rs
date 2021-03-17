pub mod mstatus;
pub mod mepc;
pub mod sstatus;
pub mod satp;
pub mod medeleg;
pub mod mideleg;
pub mod sie;
pub mod mhartid;
pub mod tp;
pub mod sip;
pub mod mie;
pub mod sepc;
pub mod stvec;
pub mod mtvec;
pub mod sscratch;
pub mod mscratch;
pub mod scause;
pub mod stval;
pub mod mcounteren;
pub mod time;
pub mod sp;
pub mod ra;
pub mod clint;

#[inline]
// flush the TLB.
pub unsafe fn sfence_vma(){
    // println!("flush the TLB");
    // llvm_asm!("sfence.vma zero, zero"::::"volatile");
    // println!("finish sfence vma");
    println!("Pass sfence vma");
}