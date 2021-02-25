#[no_mangle]
pub extern "C" fn rust_main() -> !{
    print!("Hello, xv6!");
    loop{}
}