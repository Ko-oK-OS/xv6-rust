use crate::register::{
    sepc, sstatus, scause, stval, stvec, sip, scause::{Scause, Exception, Trap}
};
use crate::lock::spinlock::Spinlock;
use crate::process::{cpu};
use crate::define::memlayout;
use super::*;

static mut TICKSLOCK:Spinlock<usize> = Spinlock::new(0, "time");
// static mut TICKS:usize = 0;

pub fn trapinit(){
    println!("trap init......");
}

// set up to take exceptions and traps while in the kernel.
pub unsafe fn trapinithart() {
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

    if sstatus::intr_get() {
        panic!("kerneltrap: interrupts enabled");
    }
    
    let which_dev = devintr();
    if which_dev == 0{
        println!("sepc=0x{:x} stval=0x{:x}", sepc::read(), stval::read());
        // panic!("kerneltrap");
        let scause_obj = Scause::new(scause);
        match scause_obj.cause(){
            Trap::Exception(Exception::Breakpoint) => breakpoint_handler(),

            Trap::Exception(Exception::LoadFault) => panic!("Load Fault!"),

            Trap::Exception(Exception::UserEnvCall) => panic!("User System Call!"),

            Trap::Exception(Exception::LoadPageFault) => panic!("Load Page Fault!"),

            Trap::Exception(Exception::StorePageFault) => panic!("Store Page Fault!"),

            _ => panic!("Unresolved Trap!")
        }
    }


    if which_dev == 2{
        println!("Timer Interrupt!");
    }

    sepc::write(sepc);
    sstatus::write(sstatus);

}


pub unsafe fn clockintr(){
    let mut ticks = TICKSLOCK.acquire();
    *ticks = *ticks + 1;
    if *ticks % 100 == 0{
        println!("TICKS: {}", *ticks);
    }
    TICKSLOCK.release();
}

// check if it's an external interrupt or software interrupt,
// and handle it.
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
unsafe fn devintr() -> usize {
    let scause = scause::read();
    let flag_1 = (scause & 0xff) == 9;
    let flag_2: bool = scause & 0x8000000000000000 !=0;
    if flag_1 && flag_2 {
        // this is a supervisor external interrupt, via PLIC.

        // irq indicates which device interrupted.
        let irq = plic::plic_claim();

        if irq == memlayout::UART0_IRQ as usize{
            // TODO: uartinit
            println!("uart interrupt")
        }else if irq == memlayout::VIRTIO0_IRQ as usize{
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
            clockintr();
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