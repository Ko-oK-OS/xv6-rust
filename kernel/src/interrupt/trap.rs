use crate::{define::fs::DIRSIZ, driver::virtio_disk::DISK, register::{
    sepc, sstatus, scause, stval, stvec, sip, scause::{Scause, Exception, Trap, Interrupt},
    satp, tp
}, syscall::syscall};
use crate::lock::spinlock::Spinlock;
use crate::process::{cpu};
use crate::define::memlayout::*;
use crate::process::*;
use crate::console::*;
use super::*;

pub static mut TICKSLOCK:Spinlock<usize> = Spinlock::new(0, "time");

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


/// handle an interrupt, exception, or system call from user space.
/// called from trampoline.S
#[no_mangle]
pub unsafe fn usertrap() {
    let sepc = sepc::read();
    let scause = Scause::new(scause::read());

    // let which_dev = device_intr();
    if !sstatus::is_from_user() {
        panic!("usertrap(): not from user mode");
    }

    // send interrupts and exceptions to kerneltrap(),
    // since we're now in the kernel.
    stvec::write(kerneltrap as usize);

    let my_proc = CPU_MANAGER.myproc().unwrap();
    let mut extern_data = my_proc.extern_data.get_mut();

    let tf = &mut *extern_data.trapframe;
    tf.epc = sepc;

    match scause.cause() {
        Trap::Exception(Exception::UserEnvCall) => {
            // user system call
            if my_proc.killed() {
                exit(-1);
            }
            // Spec points to the ecall instruction,
            // but we want to return to the next instrcution
            tf.update_epc();

            // An interrupt will change sstatus &c registers,
            // so don't enable until done with those registers. 
            sstatus::intr_on();
            syscall();
        },

        // Device interrupt
        Trap::Interrupt(Interrupt::SupervisorExternal) => {
            // this is a supervisor external interrupt, via PLIC.
            // irq indicates which device interrupted.
            let plic = PLIC.acquire();
            if let Some(interrupt) = plic.claim() {
                match interrupt {
                    VIRTIO0_IRQ => {
                        DISK.acquire().intr();
                    },

                    UART0_IRQ => {
                        // UART.intr();
                        panic!("uart intr");
                    },

                    _ => {
                        panic!("Unresolved interrupt");
                    }
                }
                plic.complete(interrupt);
            }
            
        },

        // Clock Interrupt
        Trap::Interrupt(Interrupt::SupervisorSoft) => {

            // software interrupt from a machine-mode timer interrupt,
            // forwarded by timervec in kernelvec.S.

            if cpu::cpuid() == 0{
                clockintr();
            }

            // acknowledge the software interrupt by clearing
            // the SSIP bit in sip.
            sip::write(sip::read() & !2);
            
            if my_proc.killed() {
                exit(-1);
            }
            // yield up the CPU if this is a timer interrupt
            my_proc.yielding();

        },

        _ => {
            println!("usertrap: unexpected scacuse: {:?}\n pid: {}", scause.cause(), my_proc.pid());
            println!("sepc: {}, stval: {}", sepc, stval::read());
            my_proc.modify_kill(true);
        }

    }

    if my_proc.killed() {
        exit(-1);
    }
    
    usertrap_ret();
}


/// return to user space
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


    let extern_data = my_proc.extern_data.get_mut();
    extern_data.user_init();

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
    // println!("trampoline address: 0x{:x}", trampoline as usize);
    // println!("userret address: 0x{:x}", userret as usize);
    let userret_virt = TRAMPOLINE + (userret as usize - trampoline as usize);
    let userret_virt: extern "C" fn(usize, usize) -> ! = 
    core::mem::transmute(userret_virt);


    // println!("jump to trampoline to enter user pagetable");
    // println!("userret_virt addr: 0x{:x}", userret_virt as usize);
    // println!("userret addr: 0x{:x}", userret as usize);
    userret_virt(TRAPFRAME, satp);
}

/// interrupts and exceptions from kernel code go here via kernelvec,
/// on whatever the current kernel stack is.
#[no_mangle]
pub unsafe fn kerneltrap(
   arg0: usize, arg1: usize, arg2: usize, _: usize,
   _: usize, _: usize, _: usize, which: usize
) {
    let mut sepc = sepc::read();
    let sstatus = sstatus::read();
    let scause = scause::read();
    let stval = stval::read();

    // println!("sepc: 0x{:x}", sepc);
    // println!("sstatus: 0x{:x}", sstatus);
    // println!("scause: 0x{:x}", scause);
    // println!("stval: 0x{:x}", stval);

    if sstatus::intr_get() {
        panic!("kerneltrap(): interrupts enabled");
    }
    // Update progrma counter
    sepc += 2;
    let scause = Scause::new(scause);
    // println!("{:?}", scause.cause());
    match scause.cause(){
        Trap::Exception(Exception::Breakpoint) => println!("BreakPoint!"),

        Trap::Exception(Exception::LoadFault) => panic!("Load Fault!"),

        Trap::Exception(Exception::LoadPageFault) => panic!("Load Page Fault!"),

        Trap::Exception(Exception::StorePageFault) => panic!("Store Page Fault!"),

        Trap::Exception(Exception::KernelEnvCall) => kernel_syscall(arg0, arg1, arg2, which),

        Trap::Exception(Exception::InstructionFault) => instr_handler(sepc),

        Trap::Exception(Exception::InstructionPageFault) => instr_handler(sepc),

        // Device Interruput
        Trap::Interrupt(Interrupt::SupervisorExternal) => {
            // this is a supervisor external interrupt, via PLIC.
            // irq indicates which device interrupted.
            let plic = PLIC.acquire();
            if let Some(interrupt) = plic.claim() {
                match interrupt {
                    VIRTIO0_IRQ => {
                        DISK.acquire().intr();
                    },

                    UART0_IRQ => {
                        // UART.intr();
                        panic!("uart intr");
                    },

                    _ => {
                        panic!("Unresolved interrupt");
                    }
                }
                plic.complete(interrupt);
            }
            
        },

        // Clock Interrupt
        Trap::Interrupt(Interrupt::SupervisorSoft) => {

            // software interrupt from a machine-mode timer interrupt,
            // forwarded by timervec in kernelvec.S.

            if cpu::cpuid() == 0{
                clockintr();
            }

            // acknowledge the software interrupt by clearing
            // the SSIP bit in sip.
            sip::write(sip::read() & !2);
        }

        _ => {       
            panic!("Unresolved Trap!");
        }
    }
    // store context
    sepc::write(sepc);
    sstatus::write(sstatus);

}


pub unsafe fn clockintr(){
    let mut ticks = TICKSLOCK.acquire();
    *ticks = *ticks + 1;
    // if *ticks % 100 == 0{
    //     println!("TICKS: {}", *ticks);
    // }
    drop(ticks);
}
