// Dependency Inversion Principle (DIP) in Flutter
//
// Core Idea: High-level modules should not depend on low-level modules.
// Both should depend on abstractions (interfaces).
// Abstractions should not depend on details. Details should depend on abstractions.
// In simpler terms: Decouple your code by making classes depend on interfaces
// rather than concrete implementations. This makes your code more
// flexible, testable, and maintainable.

// Wrong way of implementing the Dependency Inversion Principle
// ignore_for_file: avoid_print
class LedBulb2 {
  void turnOn() {
    print('LedBulb: turned on');
  }

  void turnOff() {
    print('LedBulb: turned off');
  }
}

class Room2 {
  final LedBulb2 bulb;

  const Room2(this.bulb);

  void manageBulb() {
    bulb.turnOn();
    bulb.turnOff();
  }
}

/// Correct way -> Implementing the Dependency Inversion Principle

abstract interface class Bulb {
  void turnOn();

  void turnOff();
}

class LedBulb implements Bulb {
  @override
  void turnOn() {
    print('LedBulb: turned on');
  }

  @override
  void turnOff() {
    print('LedBulb: turned off');
  }
}

class HalogenBulb implements Bulb {
  @override
  void turnOn() {
    print('HalogenBulb: turned on');
  }

  @override
  void turnOff() {
    print('HalogenBulb: turned off');
  }
}

class Room {
  final Bulb bulb;

  const Room(this.bulb);

  void manageBulb() {
    bulb.turnOn();
    bulb.turnOff();
  }
}

// benefits
// 1. Decouples high-level modules from low-level modules.
// 2. Makes code more flexible and maintainable.
// 3. Reduces the risk of breaking changes.
// 4. Improves testability.
// 5. Promotes code reuse.
// 6. Simplifies code maintenance.
// 7. Reduces the risk of tight coupling.
// 8. Makes code more scalable.
// 9. Improves code readability.
// 10. Reduces the risk of bugs and errors.
