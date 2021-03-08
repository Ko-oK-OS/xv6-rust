use crate::register::{
    sepc, sstatus, scause, stval, stvec, sip
};
use crate::lock::spinlock::Spinlock;
use crate::process::{cpu};
use crate::define::memlayout;
use super::*;

use lazy_static::*;

lazy_static! {
    static ref TICKSLOCK:Spinlock<usize> = Spinlock::new(0, "time");
}
static mut TICKS:usize = 0;

pub unsafe fn trap_init_hart() {
    println!("trap init hart......");
    extern "C" {
        fn kernelvec();
    }

    stvec::write(kernelvec as usize);
}




// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
#[no_mangle]
pub unsafe fn kerneltrap() {
    let sepc = sepc::read();
    let sstatus = sstatus::read();
    let scause = scause::read();

    if (sstatus & (sstatus::SSTATUS::SPP as usize)) == 0{
        panic!("kerneltrap: not from supervisor mode");
    }

    if sstatus::intr_get() != false{
        panic!("kerneltrap: interrupts enabled");
    }
    
    let which_dev = devintr();
    if which_dev == 0{
        println!("scause={}", scause);
        println!("sepc={} stval={}", sepc::read(), stval::read());
        panic!("kerneltrap");
    }


    if which_dev == 2{
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
            // TODO: uartinit
            println!("uart interrupt")
        }else if irq == memlayout::VIRTIO0_IRQ as u32{
            // TODO: virtio_disk_init
            println!("virtio0 interrupt")
        }else if irq != 0{
            println!("unexpected intrrupt, irq={}", irq);
        }

        if irq != 0 {
            plic::plic_complete(irq);
        }

        return 1;
    }else if scause == 0x8000000000000001{
        // software interrupt from a machine-mode timer interrupt,
        // forwarded by timervec in kernelvec.S.
        if cpu::cpuid() == 0{
            // TODO: clockintr
            // clockintr();
            println!("clockintr!");
        }


        // acknowledge the software interrupt by clearing
        // the SSIP bit in sip.
        sip::write(sip::read() & !2);

        return 2;
    }else{
        return 0;
    }
    

}