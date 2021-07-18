// use super::File;
pub struct Pipe {

}

impl Pipe {
    pub fn read(&self, addr: usize, len: usize) -> Result<usize, &'static str> {
        Err("No implement")
    }

    pub fn write(&self, addr: usize, len: usize) -> Result<usize, &'static str> {
        Err("No implement")
    }

    pub fn readable(&self) -> bool {
        false
    }

    pub fn writeable(&self) -> bool {
        false
    }

    pub fn close(witable: bool) {
        
    }
}