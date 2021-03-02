use crate::lock::spinlock::Spinlock;
pub struct Run{
    next: Option<Run>
}

pub struct Kmem{
    run:Run
}

static kmem:Spinlock<Kmem> = Spinlock::new(Kmem{run:None}, "mem");

pub fn kinit(){
    extern "C"{
        fn end();
    }
    println!("kinit......")

}