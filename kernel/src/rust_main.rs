pub const LOGO: &'static str = include_str!("logo.txt");

#[no_mangle]
pub extern "C" fn rust_main() -> !{
    println!("{}",LOGO);
    println!("Hello, xv6!");
    panic!("end of rust main");
}