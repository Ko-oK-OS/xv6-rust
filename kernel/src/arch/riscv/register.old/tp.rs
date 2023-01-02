// read and write tp, the thread pointer, which holds
// this core's hartid (core number), the index into cpus[].
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    core::arch::asm!("mv $0, tp":"=r"(ret):::"volatile");
    ret
}

#[inline]
pub unsafe fn write(x:usize){
    core::arch::asm!("mv tp, $0"::"r"(x)::"volatile");
}