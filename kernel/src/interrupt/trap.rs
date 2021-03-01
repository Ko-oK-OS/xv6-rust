use crate::register::{
    sepc, sstatus, scause, stval, stvec
};
use crate::define::memlayout;

use super::*;




pub unsafe fn trap_init_hart() {
    extern "C" {
        fn kernelvec();
    }

    stvec::write(kernelvec as usize);
}



// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
#[no_mangle]
pub unsafe fn kerneltrap() {
    let mut which_dev = 0;
    let sepc = sepc::read();
    let sstatus = sstatus::read();
    let scause = scause::read();

    if (sstatus & (sstatus::SSTATUS::SPP as usize)) == 0{
        panic!("kerneltrap: not from supervisor mode");
    }

    if sstatus::intr_get() != false{
        panic!("kerneltrap: interrupts enabled");
    }
    
    which_dev = devintr();
    if which_dev == 0{
        println!("scause {}\n", scause);
        println!("sepc={} stval={}\n", sepc::read(), stval::read());
        panic!("kerneltrap");
    }


    if which_dev == 2{
        panic!("kerneltrap");
    }

    if which_dev == 0{
        panic!("kerneltrap");
    }

    sepc::write(sepc);
    sstatus::write(sstatus);

}

unsafe fn devintr() -> usize {
    let scause = scause::read();
    let flag_1 = (scause & 0xff) == 9;
    let flag_2:bool = scause & 0x8000000000000000 !=0;
    if flag_1 &&flag_2 {
        // this is a supervisor external interrupt, via PLIC.

        // irq indicates which device interrupted.
        let irq = plic::plic_claim();

        if irq == memlayout::UART0_IRQ as u32{
            println!("uart interrupt")
        }else if irq == memlayout::VIRTIO0_IRQ as u32{
            println!("virtio0 interrupt")
        }else{
            println!("unexpected intrrupt, irq={}", irq);
        }

        return 1;
    }else if scause == 0x8000000000000001{
        return 2;
    }else{
        return 0;
    }
    

}