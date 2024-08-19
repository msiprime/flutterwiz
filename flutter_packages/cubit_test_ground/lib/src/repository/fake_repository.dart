import 'dart:math' as math show Random;

class FakeRepository {
  Future<String> fetchString() async {
    await Future.delayed(const Duration(seconds: 5));
    return 'random number is ${math.Random().nextInt(100)}';
  }
}
