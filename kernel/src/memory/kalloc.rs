use crate::lock::spinlock::Spinlock;
struct Run{
    next:Run
}

struct Kmem{
    run:Run
}

static kmem:Spinlock<Kmem> = Spinlock::new(Kmem{run:{}}, "mem");

pub fn kinit(){
    println!("kinit......")
    
}