use super::File;
pub struct Pipe {

}

impl File for Pipe {
    fn read(&self, addr: usize, buf: &mut [u8]) -> Result<usize, &'static str> {
        Err("No implement")
    }

    fn write(&self, addr: usize, buf: &[u8]) -> Result<usize, &'static str> {
        Err("No implement")
    }

    fn readable(&self) -> bool {
        false
    }

    fn writeable(&self) -> bool {
        false
    }
}