 fn unsigned_Integers() {
    let _a: u8 = 255;
    let _b: u16 = 65535;
    let _c: u32 = 4294967295;
    let _d: u64 = 18446744073709551615;
    let _e: u128 = 340282366920938463463374607431768211455;
    let _f: u256 = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
 
    let _g = 57_u8;
    let _h= 456_u16;
    let _i=4567_u32;
    let _j=123456_u64;
    let _k=1234567_u128;
    let _l=123456789_u256;

    let _m: usize = 4294967295;
    let _n = 4294967295_usize;
 }

 fn signed_Integers() {
    let _a: i8 = -128;
    let _b: i16 = -32768;
    let _c: i32 = -2147483648;
    let _d: i64 = -9223372036854775808;
    let _e: i128 = -170141183460469231731687303715884105728;

    let _f = -128_i8;
    let _g = -32768_i16;
    let _h = -2147483648_i32;
    let _i = -9223372036854775808_i64;
    let _j = -170141183460469231731687303715884105728_i128;


 }

 #[cfg(test)]
 mod tests {
    use super::*;  
    use alexandria_math::fast_root::fast_sqrt;
    use alexandria_math::fast_power::fast_power;

#[test]
    fn test_unsigned_integers() {
        unsigned_Integers()
    }

    #[test]
    fn test_basic_arithmetic() {
        let a: u32 = 50;
        let b: u32 = 10;
        assert!(a + b == 60);
        assert!(a - b == 40);
        assert!(a / b == 5);
        assert!(a * b == 500);
    }

    #[test]
    #[should_panic]
    fn test_unit_overflow_protection() {
        let a: u8 = 255;
        let b = 1_u8;
        a + b;
    }

    #[test]
    #[should_panic]
    fn test_unit_underflow_protection() {
        let a = 0_u8;
        let b = 1_u8;
        a - b;
    }

    #[test]
    fn test_mixing_types_success() {
        let a: u8 = 4;
        let b: i8 = 6;
        assert!(a + b.try_into().unwrap() == 10)
    }

    #[test]
    #[should_panic]
    fn test_mixing_types_failure() {
        let a: u32 = 10;
        let b: i64 = -4;
        assert!(a + b.try_into().unwrap() == 6, "")
    }

    #[test]
    fn test_advanced_math() {
        let a: u32 = 4;
        assert!(fast_power(a,2) == 16);
        assert!(fast_sqrt(a.try_into().unwrap(), 1) == 2)
    }
 }