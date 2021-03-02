use crate::lock::spinlock::Spinlock;

extern "C" {
    // first address after kernel.
    // defined by kernel.ld.
    fn end();
}



pub fn kinit(){
    extern "C"{
        fn end();
    }
    println!("kinit......")

}