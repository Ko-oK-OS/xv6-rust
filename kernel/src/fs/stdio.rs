// use super::File;

pub struct Stdin ();
pub struct Stdout ();

impl Stdin {
    fn readable(&self) -> bool { true }
    fn writeable(&self) -> bool { false }
    fn read(&self, _addr: usize, buf: &mut [u8]) -> Result<usize, &'static str> {
        Err("No implement")
    }

    fn write(&self, _addr: usize, _buf: &[u8]) -> Result<usize, &'static str> {
        panic!("Stdin cannot be written.")
    }
}

impl Stdout {
    fn readable(&self) -> bool { false }
    fn writeable(&self) -> bool { true }
    fn read(&self, _addr: usize, _buf: &mut [u8]) -> Result<usize, &'static str> {
        panic!("Stdout cannot be read.")
    }
    fn write(&self, _addr: usize, buf: &[u8]) -> Result<usize, &'static str> {
       println!("{}", core::str::from_utf8(buf).unwrap());
       Ok(buf.len())
    }
}
