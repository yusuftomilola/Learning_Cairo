#[cfg(test)]
mod tests {

    #[derive(Drop)]
    struct Person {
        height: u32,
        age: u32,
    }

    // OWNERSHIP NOT BEEN RETURNED
    fn get_age(person: Person) -> u32 {
            person.age
    }

    #[test]
    fn test_get_age() {
        let person = Person {
            height: 200,
            age: 28,
        };

        let age: u32 = get_age(person);
        assert!(age == 28, "Invalid age test")
        // assert!(person.age == 28) ownership has been moved so this wont work
    }

    // RETURNING OWNERSHIP BACK TO THE OWNER
    fn get_age_return_owernership(person: Person) -> (u32, Person) {
        (person.age, person)
    }

    #[test]
    fn test_get_age_return_owernership() {
        let person = Person {
            age: 30,
            height: 250,
        };

        let (age, person) = get_age_return_owernership(person);

        assert!(age == 30);
        assert!(person.age == 30);
    }

    // WE WANT ONLY THE VALUE AND NOT THE OWNERSHIP RETURNED AS WELL - USING SNAPSHOTS, THE OWNERSHIP WONT BE TRANSFERED AT ALL IN THE FIRST PLACE
     fn get_age_with_snapshot(person: @Person) -> u32 {
        *person.age
     }

     #[test]
    fn test_get_age_with_snapshot() {
         let person = Person {
        age: 40,
        height: 50
     };

     let age: u32 = get_age_with_snapshot(@person);

     assert!(age == 40)
     assert!(person.age == 40)
    }
}