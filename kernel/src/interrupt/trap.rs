use crate::register::{
    sepc, sstatus, scause, stval, stvec, sip, scause::{Scause, Exception, Trap, Interrupt},
    satp
};
use crate::lock::spinlock::Spinlock;
use crate::process::{cpu};
use crate::define::memlayout::*;
use crate::process::*;
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


//
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
#[no_mangle]
pub unsafe fn usertrap() {
    let sepc = sepc::read();
    let scause = scause::read();

    let which_dev = devintr();
    if !sstatus::is_from_user() {
        panic!("usertrap(): not from user mode");
    }

    // send interrupts and exceptions to kerneltrap(),
    // since we're now in the kernel.
    stvec::write(kerneltrap as usize);

    let my_proc = CPU_MANAGER.myproc().unwrap();

    let mut guard = my_proc.data.acquire();

    let mut extern_data = my_proc.extern_data.get_mut();

    (*extern_data.trapframe).epc = sepc;

    if scause == 8 {
        // system call 
        if guard.killed != 0 {
            //TODO: exit
        }

        // sepc points to the ecall instruction,
        // but we want to return to the next instruction.

        (*extern_data.trapframe).epc += 4;


        // an interrupt will change sstatus &c registers,
        // so don't enable until done with those registers.
        sstatus::intr_on();

        // TODO:syscall()
    }else if which_dev != 0 {
        // ok
    }else {
        println!("usertrap(): unexpected scause {} pid={}", scause, guard.pid);
        println!("                       sepc={} stval={}", sepc, stval::read());
        guard.killed = 1;
    }

    if guard.killed != 0{
        // TODO: exit
    }

    // give up the CPU if this a timer interrupt
    if which_dev ==  2 {
        CPU_MANAGER.yield_proc();
    }

}

//
// return to user space
//

#[no_mangle]
unsafe fn usertrap_ret() {
    extern "C" {
        fn uservec();
        fn trampoline();
    }

    let mut my_proc = CPU_MANAGER.myproc().unwrap();

    // we're about to switch the destination of traps from
    // kerneltrap() to usertrap(), so turn off interrupts until
    // we're back in user space, where usertrap() is correct.

    sstatus::intr_off();

    // send syscalls, interrupts, and exceptions to trampoline.S
    stvec::write(TRAMPOLINE + (uservec as usize - trampoline as usize));

    // set up trapframe values that uservec will need when
    // the process next re-enters the kernel.


    let mut extern_data = my_proc.extern_data.get_mut();
    (*extern_data.trapframe).kernel_satp = satp::read();

}




// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
#[no_mangle]
pub unsafe fn kerneltrap(
    _: usize, _: usize, _: usize, _: usize,
    _: usize, _: usize, _: usize, arg7: usize
) {

    let mut sepc = sepc::read();
    let sstatus = sstatus::read();
    let scause = scause::read();

    // if !sstatus::is_from_supervisor() {
    //     panic!("kerneltrap: not from supervisor mode");
    // }

    if sstatus::intr_get() {
        panic!("kerneltrap: interrupts enabled");
    }
    
    let which_dev = devintr();

    match which_dev {
        0 => {
            // modify sepc to countine running after restoring context
            sepc += 2;
            println!("sepc=0x{:x} stval=0x{:x}", sepc::read(), stval::read());
            let scause = Scause::new(scause);
            match scause.cause(){
                Trap::Exception(Exception::Breakpoint) => println!("BreakPoint!"),

                Trap::Exception(Exception::LoadFault) => panic!("Load Fault!"),

                Trap::Exception(Exception::UserEnvCall) => panic!("User System Call!"),

                Trap::Exception(Exception::LoadPageFault) => panic!("Load Page Fault!"),

                Trap::Exception(Exception::StorePageFault) => panic!("Store Page Fault!"),

                Trap::Exception(Exception::KernelEnvCall) => handler_kernel_syscall(arg7),

                _ => panic!("Unresolved Trap!")
            }

        }

        1 => {
            panic!("Unsolved solution!");

        }

        2 => {
            // println!("Timer Interrupt!");
            CPU_MANAGER.yield_proc();

        }

        _ => {
            unreachable!();
        }
    }

    // store context
    sepc::write(sepc);
    sstatus::write(sstatus);

}


pub unsafe fn clockintr(){
    let mut ticks = TICKSLOCK.acquire();
    *ticks = *ticks + 1;
    if *ticks % 100 == 0{
        println!("TICKS: {}", *ticks);
    }
    drop(ticks);
}

// check if it's an external interrupt or software interrupt,
// and handle it.
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
unsafe fn devintr() -> usize {
    let scause = scause::read();
    let scause = Scause::new(scause);

    match scause.cause(){
            Trap::Interrupt(Interrupt::SupervisorExternal) => {
                println!("Supervisor Enternal Interrupt Occures!");
            // this is a supervisor external interrupt, via PLIC.

            // irq indicates which device interrupted.
            let irq = plic::plic_claim();

            if irq == UART0_IRQ as usize{
                // TODO: uartinit
                println!("uart interrupt")
            }else if irq == VIRTIO0_IRQ as usize{
                // TODO: virtio_disk_init
                println!("virtio0 interrupt")
            }else if irq != 0{
                println!("unexpected intrrupt, irq={}", irq);
            }

            if irq != 0 {
                plic::plic_complete(irq);
            }

            1
        }

        Trap::Interrupt(Interrupt::SupervisorSoft) => {
            // println!("Timer Interupt Occures!");
            // software interrupt from a machine-mode timer interrupt,
            // forwarded by timervec in kernelvec.S.

            if cpu::cpuid() == 0{
                // TODO: clockintr
                clockintr();
                // println!("clockintr!");
            }

            // acknowledge the software interrupt by clearing
            // the SSIP bit in sip.
            sip::write(sip::read() & !2);

            2
        }

        _ => {
            println!("Exception and other Interrupts Occurs!");
            0
        }
    }
    

}