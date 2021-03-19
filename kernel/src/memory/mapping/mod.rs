pub mod page_table;
pub mod page_table_entry;
pub mod kvm;

use crate::define::memlayout::PGSIZE;

pub fn page_round_up(addr: usize) -> usize{
    (addr + PGSIZE - 1) & !(PGSIZE - 1)
}

pub fn page_round_down(addr: usize) -> usize{
    addr & !(PGSIZE - 1)
}