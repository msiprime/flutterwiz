//ignore_for_file: avoid_print

// LSP -> Liskov Substitution Principle
// Objects in a program should be replaceable with instances of their subtypes
// without altering the correctness of that program.
// In other words, objects should be replaceable with their subtypes without
// affecting the program's behavior.

// Mathematically, if S is a subtype of T, then objects of type T may be replaced

abstract class Bird {
  void fly();
}

class Duck implements Bird {
  @override
  void fly() {
    print('Duck is flying');
  }
}

class Ostrich implements Bird {
  @override
  void fly() {
    print('Ostrich cannot fly');
  }
}

class BirdFlyer {
  final Bird bird;

  BirdFlyer(this.bird);

  void fly() {
    bird.fly();
  }
}

void main() {
  final birdFlyer = BirdFlyer(Duck());
  birdFlyer.fly();

  final birdFlyer2 = BirdFlyer(Ostrich());
  birdFlyer2.fly();
}

// benefits
// - Code is more maintainable
// - Code is more readable
// - Code is more flexible
// - Code is more scalable
// - Code is more reusable
// - Code is more testable
// - Code is more understandable
// reduce bugs and errors
