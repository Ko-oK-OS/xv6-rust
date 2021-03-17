// Saved registers for kernel context switches.
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
    const fn new() -> Self{
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
}