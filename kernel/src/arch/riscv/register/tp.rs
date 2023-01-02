// read and write tp, the thread pointer, which holds
// this core's hartid (core number), the index into cpus[].
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("mv {}, tp",out(reg)ret);
    ret
}

#[inline]
pub unsafe fn write(x:usize){
    core::arch::asm!("mv tp, {}", in(reg)x);
}