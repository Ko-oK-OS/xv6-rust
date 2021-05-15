use crate::register::{
    sepc, sstatus, scause, stval, stvec, sip, scause::{Scause, Exception, Trap, Interrupt},
    satp, tp
};
use crate::lock::spinlock::Spinlock;
use crate::process::{cpu};
use crate::define::memlayout::*;
use crate::process::*;
use crate::console::*;
use super::*;

static mut TICKSLOCK:Spinlock<usize> = Spinlock::new(0, "time");

pub fn trap_init(){
    println!("trap init......");
}

// set up to take exceptions and traps while in the kernel.
pub unsafe fn trap_init_hart() {
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
pub unsafe fn usertrap_ret() -> ! {
    extern "C" {
        fn uservec();
        fn trampoline();
        fn userret();
    }

    let my_proc = CPU_MANAGER.myproc().unwrap();

    // we're about to switch the destination of traps from
    // kerneltrap() to usertrap(), so turn off interrupts until
    // we're back in user space, where usertrap() is correct.

    sstatus::intr_off();

    // send syscalls, interrupts, and exceptions to trampoline.S
    stvec::write(TRAMPOLINE + (uservec as usize - trampoline as usize));

    // set up trapframe values that uservec will need when
    // the process next re-enters the kernel.


    let mut extern_data = my_proc.extern_data.get_mut();

    (*extern_data.trapframe).kernel_satp = satp::read(); // kernel page table
    (*extern_data.trapframe).kernel_sp = extern_data.kstack + PGSIZE; // process's kernel stack
    (*extern_data.trapframe).kernel_trap = usertrap as usize;
    (*extern_data.trapframe).kernel_hartid = tp::read(); // hartid for cpuid()

    // set up the registers that trampoline.S's sret will use
    // to get to user space.

    let mut sstatus = sstatus::read();
    sstatus = sstatus::clear_spp(sstatus); // clear SPP to 0 for user mode
    sstatus = sstatus::user_intr_on(sstatus); // enable interrupts in user mode
    sstatus::write(sstatus);

    // set S Exception Program Counter to the saved user pc. 
    sepc::write((*extern_data.trapframe).epc);
    
    // tell trampoline.S the user page table to switch to
    let satp= extern_data.pagetable.as_ref().unwrap().as_satp();

    // jump to trampoline.S at the top of memory, which
    // switches to the user page table, restores user registers,
    // and switches to user mode with sret. 
    let userret_virt = TRAMPOLINE + (userret as usize - trampoline as usize);
    let userret_virt: extern "C" fn(usize, usize) -> ! = 
    core::mem::transmute(userret_virt);

    userret_virt(TRAMPOLINE, satp);

}




// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
#[no_mangle]
pub unsafe fn kerneltrap(
   arg0: usize, arg1: usize, arg2: usize, _: usize,
   _: usize, _: usize, _: usize, which: usize
) {

    let mut sepc = sepc::read();
    let sstatus = sstatus::read();
    let scause = scause::read();

    // if !sstatus::is_from_supervisor() {
    //     panic!("kerneltrap: not from supervisor mode");
    // }

    if sstatus::intr_get() {
        panic!("kerneltrap(): interrupts enabled");
    }
    
    let which_dev = devintr();

    match which_dev {
        0 => {
            // modify sepc to countine running after restoring context
            sepc += 2;
            
            let scause = Scause::new(scause);
            match scause.cause(){
                Trap::Exception(Exception::Breakpoint) => println!("BreakPoint!"),

                Trap::Exception(Exception::LoadFault) => panic!("Load Fault!"),

                Trap::Exception(Exception::LoadPageFault) => panic!("Load Page Fault!"),

                Trap::Exception(Exception::StorePageFault) => panic!("Store Page Fault!"),

                Trap::Exception(Exception::KernelEnvCall) => kernel_syscall(arg0, arg1, arg2, which),

                _ => panic!("Unresolved Trap! scause:{:?}", scause.cause())
            }

        }

        1 => {
            panic!("Unsolved solution!");
            

        }

        2 => {
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
                // TODO: uartintr
                uart_intr();
                println!("uart interrupt");

            }else if irq == VIRTIO0_IRQ as usize{
                // TODO: virtio_disk_intr
                println!("virtio0 interrupt");
            }else if irq != 0{
                println!("unexpected intrrupt, irq={}", irq);
            }

            if irq != 0 {
                plic::plic_complete(irq);
            }

            1
        }

        Trap::Interrupt(Interrupt::SupervisorSoft) => {

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
            0
        }
    }
    

}