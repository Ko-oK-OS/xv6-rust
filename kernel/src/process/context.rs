// Saved registers for kernel context switches.
#[repr(C)]
#[derive(Debug)]
pub struct Context{
    ra:usize,
    sp:usize,

    // callee-saved
    s0:usize,
    s1:usize,
    s2:usize,
    s3:usize,
    s4:usize,
    s5:usize,
    s6:usize,
    s7:usize,
    s8:usize,
    s9:usize,
    s10:usize,
    s11:usize
}

impl Context{
    pub const fn new() -> Self{
        Self{
            ra:0,
            sp:0,
            s0:0,
            s1:0,
            s2:0,
            s3:0,
            s4:0,
            s5:0,
            s6:0,
            s7:0,
            s8:0,
            s9:0,
            s10:0,
            s11:0

        }
    }

    pub fn ra(&self) -> usize {
        self.ra
    }

    pub fn write_zero(&mut self) {
        self.ra = 0;
        self.sp = 0;
        self.s0 = 0;
        self.s1 = 0;
        self.s2 = 0;
        self.s3 = 0;
        self.s4 = 0;
        self.s5 = 0;
        self.s6 = 0;
        self.s7 = 0;
        self.s8 = 0;
        self.s9 = 0;
        self.s10 = 0;
        self.s11 = 0;
    }

    pub fn write_ra(&mut self, ra: usize) {
        self.ra = ra;
    }

    pub fn write_sp(&mut self, sp: usize) {
        self.sp = sp;
    }
}