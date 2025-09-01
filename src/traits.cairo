#[cfg(test)]
mod tests {

    mod traits {

        #[derive(Drop)]
        struct Human {
            health: u32,
            strength: u32,
            intelligence: u32,
        }

        #[derive(Drop)]
        struct Orca {
            health: u32,
            strength: u32,
            intelligence: u32,
        }

        // HUMAN TRAIT
        trait HumanAction {
            fn newHuman() -> Human;
            fn trainHuman(ref self: Human);
            fn studyHuman(ref self: Human);
        }

        // HUMAN TRAIT IMPLEMENTATION
        impl HumanActionImpl of HumanAction {
            fn newHuman() -> Human {
                Human {
                    health: 100,
                    strength: 20,
                    intelligence: 20,
                }
            }
            fn trainHuman(ref self: Human) {
                self.strength += 10
            }
            fn studyHuman(ref self: Human) {
                self.intelligence += 5
            }
        }

        // ORCA TRAIT
        trait OrcaAction {
            fn newOrca() -> Orca;
            fn trainOrca(ref self: Orca);
            fn studyOrca(ref self: Orca);
        }

        // ORCA TRAIT IMPLEMENTATION
        impl OrcaActionImpl of OrcaAction {
            fn newOrca() -> Orca {
                Orca {
                    health: 100,
                    strength: 50,
                    intelligence: 5,
                }
            }

            fn trainOrca(ref self: Orca) {
                self.strength += 10
            }

            fn studyOrca(ref self: Orca) {
                self.intelligence += 1
            }
        }

        #[test]
        fn test_create_charaters() {
            let mut human: Human = HumanAction::newHuman();
            let mut orca: Orca = OrcaAction::newOrca();

            human.studyHuman();
            human.trainHuman();

            orca.studyOrca();
            orca.trainOrca();

            assert!(human.intelligence == 25)
            assert!(human.strength == 30)

            assert!(orca.intelligence == 6)
            assert!(orca.strength == 60)
        }
    }

   
}