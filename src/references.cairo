#[cfg(test)]
mod tests {

    // testing
    #[derive(Drop)]
    struct Person {
        age: u32,
        height: u32,
    }

    fn make_person_older(mut person: Person) {
        person.age += 1
    }

    #[test]
    #[ignore]
    fn test_take_ownership() {
        let person = Person {
            age: 15,
            height: 100,
        };

        make_person_older(person);
        // assert!(person.age == 16)
    }

    // USING REFERENCES MANUALLY WITHOUT THE REF SYNTAX TO RETURN REFERENCE
    fn make_person_older_return_ownership(mut person: Person) -> Person {
        person.age += 1;
        person
    }


    #[test]
    fn test_make_person_older() {
        let person = Person {
            age: 30,
            height: 200,
        };

        let person =make_person_older_return_ownership(person);

        assert!(person.age == 31) 
    }

    // FINALLY - THE WAY TO DO IT AUTOMATICALLY WITH REFERENCE ITSELF
    fn make_person_older_with_reference(ref person: Person) {
        person.age += 1;
    }
    #[test]
    fn test_make_person_older_with_reference() {
        let mut person = Person {
            age: 30,
            height: 200,
    };
    make_person_older_with_reference(ref person);
    assert!(person.age == 31)
    }

}