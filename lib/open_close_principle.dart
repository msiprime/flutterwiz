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

  print(myResult);
}
