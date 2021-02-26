#[no_mangle]
pub extern "C" fn rust_main() -> !{
    println!("Hello, xv6!");
    panic!("end of rust main");
}