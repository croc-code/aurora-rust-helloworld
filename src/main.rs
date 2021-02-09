#[no_mangle]
pub extern "C" fn __libc_csu_init() {}

#[no_mangle]
pub extern "C" fn __libc_csu_fini() {}

fn main() {
    println!("Hello, world!");
}
