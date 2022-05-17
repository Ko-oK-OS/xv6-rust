use core::panic;

use crate::syscall::handle_syscall;
use crate::driver::plic::{plic_claim, plic_complete};
use crate::driver::virtio_disk::DISK;
use crate::arch::riscv::qemu::fs::DIRSIZ;
use crate::arch::riscv::{sepc, sstatus, scause, stval, stvec, sip, scause::{Scause, Exception, Trap, Interrupt}};
use crate::lock::spinlock::Spinlock;
use crate::process::cpu;
use crate::arch::riscv::qemu::layout::*;
use crate::process::*;
use crate::driver::console::*;
use crate::shutdown::*;
use super::*;

pub static mut TICKS_LOCK:Spinlock<usize> = Spinlock::new(0, "time");

/// Set up to take exceptions and traps while in the kernel.
pub unsafe fn trap_init_hart() {
    extern "C" {
        fn kernelvec();
    }
    stvec::write(kernelvec as usize);
}


/// handle an interrupt, exception, or system call from user space.
/// called from trampoline.S
#[no_mangle]
pub unsafe fn user_trap() {
    let sepc = sepc::read();
    let scause = Scause::new(scause::read());

    if !sstatus::is_from_user() {
        panic!("user_trap(): not from user mode");
    }
    // send interrupts and exceptions to kerneltrap(),
    // since we're now in the kernel.
    extern "C" {
        fn kernelvec();
    }
    stvec::write(kernelvec as usize);

    let my_proc = CPU_MANAGER.myproc().unwrap();
    let tf = &mut *my_proc.trapframe;
    tf.epc = sepc;
    // println!("{}", sepc);
    match scause.cause() {
        
        Trap::Exception(Exception::UserEnvCall) => {
            
            // user system call
            if my_proc.killed() {
                PROC_MANAGER.exit(1);
            }
            // Spec points to the ecall instruction,
            // but we want to return to the next instrcution
            tf.update_epc();

            // An interrupt will change sstatus &c registers,
            // so don't enable until done with those registers. 
            sstatus::intr_on();
            handle_syscall();
            
        },

        // Device interrupt
        Trap::Interrupt(Interrupt::SupervisorExternal) => {
            // this is a supervisor external interrupt, via PLIC.
            // irq indicates which device interrupted.
            if let Some(interrupt) = plic_claim() {
                match interrupt {
                    VIRTIO0_IRQ => {
                        DISK.acquire().intr();
                    },

                    UART0_IRQ => {
                        UART.intr();
                    },

                    _ => {
                        panic!("Unresolved interrupt");
                    }
                }
                plic_complete(interrupt);
            }
            
        },

        // Clock Interrupt
        Trap::Interrupt(Interrupt::SupervisorSoft) => {
            // software interrupt from a machine-mode timer interrupt,
            // forwarded by timervec in kernelvec.S.
            if cpu::cpuid() == 0{
                clock_intr();
            }
            // acknowledge the software interrupt by clearing
            // the SSIP bit in sip.
            sip::clear_ssip();
            if my_proc.killed() {
                PROC_MANAGER.exit(1);
            }
            // yield up the CPU if this is a timer interrupt
            my_proc.yielding();
        },

        _ => {
            println!("usertrap: unexpected scacuse: {:?}\n pid: {}", scause.cause(), my_proc.pid());
            println!("sepc: 0x{:x}, stval: 0x{:x}", sepc, stval::read());
            my_proc.modify_kill(true);
        }

    }

    if my_proc.killed() {
        PROC_MANAGER.exit(1);
    }
    
    user_trap_ret();
}


/// return to user space
#[no_mangle]
pub unsafe fn user_trap_ret() -> ! {
    extern "C" {
        fn uservec();
        fn trampoline();
        fn userret();
        fn etext();
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
 
    my_proc.user_init();

    // set up the registers that trampoline.S's sret will use
    // to get to user space.
    // Set S Previous Privilege mode to User. 
    let mut sstatus = sstatus::read();
    sstatus = sstatus::clear_spp(sstatus); // clear SPP to 0 for user mode
    sstatus = sstatus::user_intr_on(sstatus); // enable interrupts in user mode
    sstatus::write(sstatus);

    // set S Exception Program Counter to the saved user pc. 
    sepc::write((*my_proc.trapframe).epc);

    // if (*my_proc.trapframe).epc == 0 {
    //     println!("In user_trap_ret, pid {}", my_proc.pid);
    // }

    // println!("------{}", (*my_proc.trapframe).epc);
    
    // tell trampoline.S the user page table to switch to
    let satp = my_proc.pagetable.as_ref().unwrap().as_satp();

    // jump to trampoline.S at the top of memory, which
    // switches to the user page table, restores user registers,
    // and switches to user mode with sret. 
    let userret_virt = TRAMPOLINE + (userret as usize - trampoline as usize);
    let userret_virt: extern "C" fn(usize, usize) -> ! = 
    core::mem::transmute(userret_virt as usize);
    
    userret_virt(TRAPFRAME, satp);
    
}

/// interrupts and exceptions from kernel code go here via kernelvec,
/// on whatever the current kernel stack is.
#[no_mangle]
pub unsafe fn kernel_trap(
   _: usize, _: usize, _: usize, _: usize,
   _: usize, _: usize, _: usize, which: usize
) {
    let sepc = sepc::read();
    let sstatus = sstatus::read();
    let scause = scause::read();
    let stval = stval::read();

    if !sstatus::is_from_supervisor() {
        panic!("not from supervisor mode");
    }

    if sstatus::intr_get() {
        panic!("kerneltrap(): interrupts enabled");
    }

    let mut local_spec = sepc;
    // Update progrma counter
    let scause = Scause::new(scause);
    match scause.cause() {
        Trap::Exception(Exception::Breakpoint) => {
            local_spec += 2;
            println!("BreakPoint!");
        },

        Trap::Exception(Exception::LoadFault) => panic!("Load Fault!"),

        Trap::Exception(Exception::LoadPageFault) => {
            panic!("[Panic] Load Page Fault!\n stval: 0x{:x}\n sepc: 0x{:x}\n", stval, sepc);
        },

        Trap::Exception(Exception::StorePageFault) => {
            panic!("[Panic] Store Page Fault!\n stval: 0x{:x}\n sepc: 0x{:x}\n", stval, sepc);
        },

        Trap::Exception(Exception::KernelEnvCall) => {
            match which  {
                SHUTDOWN => {
                    println!("\x1b[1;31mShutdown!\x1b[0m");
                    system_reset(
                        RESET_TYPE_SHUTDOWN,
                        RESET_REASON_NO_REASON
                    );
                },
        
                REBOOT => {
                    println!("\x1b[1;31mReboot!\x1b[0m");
                    system_reset(
                        RESET_TYPE_COLD_REBOOT,
                        RESET_REASON_NO_REASON
                    );
                },
        
                _ => {
                    panic!("Unresolved Kernel Syscall!");
                }
            }
        },

        Trap::Exception(Exception::InstructionFault) => panic!("Instruction Fault, sepc: 0x{:x}", sepc),

        Trap::Exception(Exception::InstructionPageFault) => {
            println!("sepc: 0x{:x}", sepc);
            println!("stval: 0x{:x}", stval);
            panic!();
        },

        // Device Interruput
        Trap::Interrupt(Interrupt::SupervisorExternal) => {
            // this is a supervisor external interrupt, via PLIC.
            // interrupt indicates which device interrupted.
            if let Some(interrupt) = plic_claim() {
                match interrupt {
                    VIRTIO0_IRQ => {
                        DISK.acquire().intr();
                    },

                    UART0_IRQ => {
                        UART.intr();
                        // uart_intr();
                    },

                    _ => {
                        panic!("Unresolved interrupt");
                    }
                }
                plic_complete(interrupt);
            }
            
        },

        // Clock Interrupt
        Trap::Interrupt(Interrupt::SupervisorSoft) => {
            // software interrupt from a machine-mode timer interrupt,
            // forwarded by timervec in kernelvec.S.

            if cpu::cpuid() == 0{
                clock_intr();
            }
            // acknowledge the software interrupt by clearing
            // the SSIP bit in sip.
            sip::clear_ssip();

            // give up the cpu. 
            CPU_MANAGER.mycpu().try_yield_proc();
        }

        _ => {       
            panic!("Unresolved Trap!");
        }
    }
    // store context
    sepc::write(local_spec);
    sstatus::write(sstatus);

}


pub unsafe fn clock_intr(){
    let mut ticks = TICKS_LOCK.acquire();
    *ticks = *ticks + 1;
    drop(ticks);
}
