//ignore_for_file: avoid_print

// OCP: Open-Close Principle
// Software entities should be open for extension, but closed for modification.
// In other words, you should be able to add new functionality to
// an object without modifying its structure.

// class Shape {
//   String type;
//
//   Shape(this.type);
// }
//
// class AreaCalculator {
//   final Shape shape;
//
//   AreaCalculator(this.shape);
//
//   double calculateArea() {
//     if (shape.type == 'rectangle') {
//       return 4 * 2;
//     } else if (shape.type == 'circle') {
//       return 3.14 * 2 * 2;
//     } else {
//       return 0;
//     }
//   }
// }

abstract interface class Shape {
  double calculateArea();
}

class Rectangle implements Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double calculateArea() {
    return width * height;
  }
}

class Circle implements Shape {
  final double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }
}

class AreaCalculator {
  double calculateArea(Shape shape) {
    return shape.calculateArea();
  }
}

void main() {
  final rectangle = Rectangle(4, 2);
  final circle = Circle(2);

  final areaCalculator = AreaCalculator();

  print(areaCalculator.calculateArea(rectangle));
  print(areaCalculator.calculateArea(circle));
}
