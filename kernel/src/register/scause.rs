use bit_field::BitField;
use core::mem::size_of;

// Supervisor Trap Cause
#[inline]
pub unsafe fn read() -> usize {
    let ret:usize;
    llvm_asm!("csrr $0, scause":"=r"(ret):::"volatile");
    ret
}

#[inline]
pub unsafe fn write(x:usize){
    llvm_asm!("csrw scause, $0"::"r"(x)::"volatile");
}

// scause register
#[derive(Clone, Copy)]
pub struct Scause{
    bits: usize
}

// Trap Cause
#[derive(Copy, Clone, Debug, Eq, PartialEq)]
pub enum Trap{
    Interrupt(Interrupt),
    Exception(Exception),
}

// Interrupt
#[derive(Copy, Clone, Debug, Eq, PartialEq)]
pub enum Interrupt{
    UserSoft,
    SupervisorSoft,
    UserTimer,
    SupervisorTimer,
    UserExternal,
    SupervisorExternal,
    Unknown
}

// Exception
#[derive(Copy, Clone, Debug, Eq, PartialEq)]
pub enum Exception {
    InstructionMisaligned,
    InstructionFault,
    IllegalInstruction,
    Breakpoint,
    LoadFault,
    StoreMisaligned,
    StoreFault,
    UserEnvCall,
    KernelEnvCall,
    InstructionPageFault,
    LoadPageFault,
    StorePageFault,
    Unknown
}


impl Interrupt{
    pub fn from(nr: usize) -> Self {
        match nr{
            0 => Interrupt::UserSoft,
            1 => Interrupt::SupervisorSoft,
            4 => Interrupt::UserTimer,
            5 => Interrupt::SupervisorTimer,
            8 => Interrupt::UserExternal,
            9 => Interrupt::SupervisorExternal,
            _ => Interrupt::Unknown
        }
    }
}

impl Exception{
    pub fn from(nr: usize) -> Self {
        match nr {
            0 => Exception::InstructionMisaligned,
            1 => Exception::InstructionFault,
            2 => Exception::IllegalInstruction,
            3 => Exception::Breakpoint,
            5 => Exception::LoadFault,
            6 => Exception::StoreMisaligned,
            7 => Exception::StoreFault,
            8 => Exception::UserEnvCall,
            9 => Exception::KernelEnvCall,
            12 => Exception::InstructionPageFault,
            13 => Exception::LoadPageFault,
            15 => Exception::StorePageFault,
            _ => Exception::Unknown
        }
    }
}

impl Scause{

    // new a Scause Object by usize
    #[inline]
    pub fn new(scause: usize) -> Self{
        Self{
            bits: scause
        }
    }

    // Returns the contents of the register as raw bits
    #[inline]
    pub fn bits(&self) -> usize{
        self.bits
    }

    // Returns the code field
    pub fn code(&self) -> usize{
        let bit =  1 << (size_of::<usize>() * 8 -1);
        self.bits & !bit
    }

    // Trap Cause
    #[inline]
    pub fn cause(&self) -> Trap{
        if self.is_interrupt() {
            Trap::Interrupt(Interrupt::from(self.code()))
        }else{
            Trap::Exception(Exception::from(self.code()))
        }
    }


    // Is trap cause an interrupt
    #[inline]
    pub fn is_interrupt(&self) -> bool {
        self.bits.get_bit(size_of::<usize>()*8 - 1)
    }
    // Is trap cause an exception
    #[inline]
    pub fn is_exception(&self) -> bool{
        !self.is_interrupt()
    }

    
}

