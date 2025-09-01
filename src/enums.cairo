#[cfg(tests)]
mod tests {
    mod simple_enums {

        #[derive(partialEq, Drop)]
        enum Error {
            DivideByZero,
            DividendSmallerThanDivisor,
            InexactDivision
        }

        fn Divide(dividend: u32, divisor: u32) -> Result<u32, Error> {
            if divisor == 0 {
                return Result::Err(Error::DivideByZero);
            }

            if divisor > dividend {
              return  Result::Err(Error::DividendSmallerThanDivisor);
            }

            if dividend % divisor != 0 {
                return Result::Err(Error::InexactDivision);
            }

            Result::Ok(dividend / divisor)
        }
    }

    #[test]
    fn test_simple_num() {
        let result = divide(10, 2);
        assert!(result == Result::Ok(5))
    }


    mod enums_with_values {

        #[derive(partialEq, Drop)]
        enum Error {
            DivideByZero,
            DividendSmallerThanDivisor: Divisor,
            InexactDivision: Remainder,
        }

        #[derive(PartialEq, Drop)]
        struct Divison {
         dividend: u32,
         divisor: u32,
        }

        type Remainder = u32;
        
        fn divide(dividend: u32, divisor: u32) -> Result<u32, Error> {
            if divisor == 0 {
                return Result::Err(Error::DivideByZero);
            }

            if divisor > dividend {
                let division = Division {
                    dividend,
                    divisor,
                };
                return Result::Err(Error::DividendSmallerThanDivisor(division));
            }

            if dividend % divisor != 0 {
                let remainder: Remainder = dividend % divisor;
                return Err(Error::InexactDivision(remainder));
            }

            return Ok(dividend / divisor);
        }

        #[test]
        fn test_enum_with_values() {
            let result = divide(10,2);
            assert!(result == Ok(5));

            let result = divide(10,0);
            assert!(result == Err(Error::DivideByZero));
        }
    }
}