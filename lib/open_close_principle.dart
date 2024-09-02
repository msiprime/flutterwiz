abstract interface class Shape {
  double calculateArea();
}

class Rectangle implements Shape {
  final double height;
  final double width;

  Rectangle({
    required this.height,
    required this.width,
  });

  @override
  double calculateArea() {
    return height * width;
  }
}

class Circle implements Shape {
  final double radius;

  Circle({required this.radius});

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

main() {
  double height = 10.5;
  double width = 5.6;

  final myResult = AreaCalculator().calculateArea(
    Rectangle(height: height, width: width),
  );
  final myResult2 = AreaCalculator().calculateArea(
    Circle(radius: height),
  );

  print('$myResult2 $myResult');
}
