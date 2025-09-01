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

    #[derive(Drop, Copy)]
    struct Person {
        age: u32,
        height: u32
    }

    // function to get age
    fn get_age(person: Person) -> u32 {
        person.age
    }

    #[test]
    fn test_get_age() {
        let person = Person {
            age: 30,
            height: 150,
        };

        let age: u32 = get_age(person);
        assert!(age == 30)
        assert!(person.age == 30)
    }

    // function to increase age
    fn increase_age(mut person: Person) {
        person.age += 1
    }

    #[test]
    fn test_increase_age() {
        let person = Person {
             age: 40,
             height: 200
        };

        increase_age(person);
        assert!(person.age == 40, "The age should still be 40 as the copy is the one been mutated and not the original. Mutates will only work on the copy and not the original.");
        assert!(person.age == 41, "The age should still be 40 as the copy is the one been mutated and not the original. Mutates will only work on the copy and not the original.");
    }
}