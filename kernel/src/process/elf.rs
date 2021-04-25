const ELF_MAGIC: usize = 0x464C457F; // elf magic number

// File header
pub struct ElfHeader {
    pub magic: usize, // must equal ELF_MAGIC,
    pub elf: [u8; 12],
    pub f_type: u16,
    pub machine: u16,
    pub entry: usize,
    
}