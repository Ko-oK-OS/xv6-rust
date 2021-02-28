use crate::logo::LOGO;

#[no_mangle]
pub extern "C" fn rust_main() -> !{
    println!("{}",LOGO);
    println!("xv6 kernel is booting!");
    panic!("end of rust main");
}