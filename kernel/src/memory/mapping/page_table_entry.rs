#[derive(Debug, Copy, Clone)]
pub struct PageTableEntry(u64);

impl PageTableEntry{
    fn into(&self) -> u64{
        self.0
    }
}

