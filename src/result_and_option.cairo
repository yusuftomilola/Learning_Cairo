fn find_even(x: u32) -> Option<u32> {
    if x % 2 == 0 {
        Option::Some(x)
    } else {
        Option::None
    }
}

fn divide(a: u32, b: u32) -> Result<u32, ByteArray> {
    if b == 0 {
        Result::Err("Can't divide by zero")
    } else {
        Result::Ok(a/b)
    }
}

