#[cfg(test)]
mod tests {

    #[test]
    fn test_array_macro() {
        let mut arr: Array<u8> = array![1,2,3,4,5];
        arr.append(6);
        let removed_value: Option<u8> = arr.pop_front();
        let first_value: u8 = *arr.at(0);
        let test_value: u8 = *arr.get(0).unwrap().unbox();

        assert!(arr.len() == 5);
        assert!(removed_value == Some(1));
        assert!(first_value == 2);
        assert!(test_value == 2);
    }

    fn add_array(arr: Span<u8>) -> u8 {
        let mut sum: u8 = 0;
        for i in 0..arr.len() {
            sum += *arr.at(i);
        }
        sum
    }

    #[test]
    fn test_add_array() {
        let arr: Array<u8> = array![1,2,3,4,5];
        let sum: u8 = add_array(arr.span());
        assert!(sum == 15) 
    }
}