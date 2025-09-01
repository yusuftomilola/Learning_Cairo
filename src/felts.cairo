#[cfg(test)]
mod tests {

    #[test]
    fn felts_explicit_vs_implicit() {
        let a = 5;
        let b: felt252 = 5;
        assert!(a == b)
    }

    #[test]
    fn test_arithmetic() {
        let a: felt252 = 10;
        let b: felt252 = 2;
        assert!(a + b == 12, "It's not correct");
        assert!(a - b == 8, "It's not correct");
        assert!(a * b == 20, "It's not correct");
    }

    #[test]
    fn test_byte_array() {
        let byte_array: ByteArray = "This is a longer";
        assert!(byte_array.len() == 16);
    }
}