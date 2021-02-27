use crate::register::{
    sepc, sstatus, scause
};

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
#[no_mangle]
pub unsafe fn kerneltrap() {
    let which_dev = 0;
    let sepc = sepc::read();
    let sstatus = sstatus::read();
    let scause = scause::read();

    if (sstatus & (sstatus::SSTATUS::SPP as usize)) == 0{
        panic!("kerneltrap: not from supervisor mode");
    }

    if sstatus::intr_get() != false{
        panic!("kerneltrap: interrupts enabled");
    }

    sepc::write(sepc);
    sstatus::write(sstatus);

}