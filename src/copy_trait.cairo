#[cfg(test)]
mod tests {
    // function to add one
    fn add_one(x: u32) -> u32 {
        x + 1
    }

    #[test]
    fn test_add_one() {
        let x: u32 = 1;
        let y: u32 = add_one(x);
        assert!(y == 2,"Y should be 2");
        assert!(x == 1);
    }

    
}