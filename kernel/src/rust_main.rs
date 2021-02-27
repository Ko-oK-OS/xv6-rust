use crate::logo::LOGO;

#[no_mangle]
pub extern "C" fn rust_main() -> !{
    println!("{}",LOGO);
    println!("\n");
    println!("xv6 kernel is booting!\n");
    println!("\n");
    panic!("end of rust main");
}