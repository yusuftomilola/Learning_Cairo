#[executable]
fn example() -> u32 {
    10
}

fn exampleTwo() -> u32 {
    example() + 2
}

fn double(x: u32) -> u32 {
    x * 2
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_functions() {
        assert!(example() == 10)
    }

    #[test]
    fn test_function_two() {
        assert!(exampleTwo() == 12)
    }

    #[test]
    fn test_function_three() {
        assert!(double(2) == 4)
    }
}
