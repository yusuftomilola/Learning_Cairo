#[derive(Drop)]
struct Human {
    health: u32,
    strength: u32,
}

#[derive(Drop)]
struct Orca {
    health: u32,
    strength: u32,
}

trait Action<T> {
    fn new() -> T;
    fn get_health(self: @T) -> u32;
    fn get_strength(self: @T) -> u32;
    fn is_alive(self: @T) -> bool;
    fn train(ref self: T);
    fn heal(ref self: T);
    fn hurt(ref self: T);
}

impl HumanActionImpl of Action<Human> {
    fn new() -> Human {
        Human {
            health: 100,
            strength: 50,
        }
    }

     fn get_health(self: @Human) -> u32 {
        *self.health
     }

    fn get_strength(self: @Human) -> u32 {
        *self.strength
    }

    fn is_alive(self: @Human) -> bool {
        *self.health > 0
    }

    fn train(ref self: Human) {
        if self.is_alive() {
            self.strength += 5
        }
    }

    fn heal(ref self: Human) {
if self.is_alive() {
            self.health += 10
        }    }

    fn hurt(ref self: Human) {
        if self.health > 10 {
            self.health -= 10
        } else {
            self.health = 0
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    use super::Action;

fn human_vs_human_fight(ref human_1: Human, ref human_2: Human) -> Result<(), ByteArray> {
        if !human_1.is_alive() || !human_2.is_alive() {
            return Result::Err("One of the opponents is already dead");
        }

        if human_1.get_strength() == human_2.get_strength() {
            human_1.hurt();
            human_2.hurt();
        } else if human_1.get_strength() > human_2.get_strength() {
            human_2.hurt();
        } else {
            human_1.hurt();
        }

        return Result::Ok(());
    }

    #[test]
    fn test_human_vs_human_fight() {
        let mut elanka: Human = HumanActionImpl::new();
        let mut degra: Human = HumanActionImpl::new();

        match human_vs_human_fight(ref elanka, ref degra) {
            Result::Ok(()) => {
                assert!(elanka.get_health() == 90);
                assert!(degra.get_health() == 90);
                assert!(degra.is_alive());
                assert!(elanka.is_alive());
            },
            Result::Err(_error) => assert!(false)
        }
    }

    // USING GENERICS
    fn fight<T1,T2>(ref human_1: T1, ref human_2: T2) -> Result<(), ByteArray> {
        if !human_1.is_alive() || !human_2.is_alive() {
            return Result::Err("One of the humans is already dead");
        }

        if human_1.get_strength() == human_2.get_strength() {
            human_1.hurt();
            human_2.hurt();
        } else if human_1.get_strength() > human_2.get_strength() {
            human_2.hurt();
        } else {
            human_1.hurt();
        }

        return Result::Ok(());
    }

     #[test]
    fn test_fight() {
        let mut elanka: Human = HumanActionImpl::new();
        let mut degra: Human = HumanActionImpl::new();

        match human_vs_human_fight(ref elanka, ref degra) {
            Result::Ok(()) => {
                assert!(elanka.get_health() == 90);
                assert!(degra.get_health() == 90);
                assert!(degra.is_alive());
                assert!(elanka.is_alive());
            },
            Result::Err(_error) => assert!(false)
        }
    }
}