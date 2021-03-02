
extern "C" {
    fn etext();
}

static kernel_page:PageTable = PageTable::kvmmake();
pub struct PageTable(u64);

// Initialize the one kernel_pagetable
pub fn kvminit() -> PageTable{
    println!("kvminit......")
}

impl PageTable{
    fn kvmmake() -> PageTable{

    }
}