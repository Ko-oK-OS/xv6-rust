pub mod page_table;
pub mod page_table_entry;
pub mod kvm;


pub use page_table::*;
pub use page_table_entry::*;
pub use kvm::*;

use crate::define::layout::PGSIZE;

pub fn page_round_up(addr: usize) -> usize{
    (addr + PGSIZE - 1) & !(PGSIZE - 1)
}

pub fn page_round_down(addr: usize) -> usize{
    addr & !(PGSIZE - 1)
}