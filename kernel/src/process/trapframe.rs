use crate::arch::riscv::register::satp;

// per-process data for the trap handling code in trampoline.S.
// sits in a page by itself just under the trampoline page in the
// user page table. not specially mapped in the kernel page table.
// the sscratch register points here.
// uservec in trampoline.S saves user registers in the trapframe,
// then initializes registers from the trapframe's
// kernel_sp, kernel_hartid, kernel_satp, and jumps to kernel_trap.
// usertrapret() and userret in trampoline.S set up
// the trapframe's kernel_*, restore user registers from the
// trapframe, switch to the user page table, and enter user space.
// the trapframe includes callee-saved user registers like s0-s11 because the
// return-to-user path via usertrapret() doesn't return through
// the entire kernel call stack.

pub struct Trapframe {
    /*0 */      pub kernel_satp:usize, // kernel page table
    /*8 */      pub kernel_sp:usize, // top of process's kernel stack
    /*16 */     pub kernel_trap:usize, // usertrap()
    /*24 */     pub epc:usize, // saved user program counter
    /*32 */     pub kernel_hartid:usize, // saved kernel tp
    /*40 */     pub ra:usize,
    /*48 */     pub sp:usize,
    /*56 */     pub gp:usize,
    /*64 */     pub tp:usize,
    /*72 */     pub t0:usize,
    /*80 */     pub t1:usize,
    /*88 */     pub t2:usize,
    /*96 */     pub s0:usize,
    /*104 */    pub s1:usize,
    /*112 */    pub a0:usize,
    /*120 */    pub a1:usize,
    /*128 */    pub a2:usize,
    /*136 */    pub a3:usize,
    /*144 */    pub a4:usize,
    /*152 */    pub a5:usize,
    /*160 */    pub a6:usize,
    /*168 */    pub a7:usize,
    /*176 */    pub s2:usize,
    /*184 */    pub s3:usize,
    /*192 */    pub s4:usize,
    /*200 */    pub s5:usize,
    /*208 */    pub s6:usize,
    /*216 */    pub s7:usize,
    /*224 */    pub s8:usize,
    /*232 */    pub s9:usize,
    /*240 */    pub s10:usize,
    /*248 */    pub s11:usize,
    /*256 */    pub t3:usize,
    /*264 */    pub t4:usize,
    /*272 */    pub t5:usize,
    /*280 */    pub t6:usize
}


impl Trapframe {
    pub fn update_epc(&mut self) {
        self.epc += 4;
    }
}
