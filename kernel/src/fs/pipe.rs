use super::file::FileTrait;
pub struct Pipe {

}

impl FileTrait for Pipe {
    fn read(&self, addr: usize, buf: &mut [u8]) -> Result<usize, &'static str> {
        Err("No implement")
    }

    fn write(&self, addr: usize, buf: &[u8]) -> Result<usize, &'static str> {
        Err("No implement")
    }
}