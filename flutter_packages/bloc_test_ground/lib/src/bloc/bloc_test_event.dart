part of 'bloc_test_bloc.dart';

@immutable
sealed class TestEvent {
  const TestEvent();
}

class Increment extends TestEvent {
  final int counter;

  const Increment({
    required this.counter,
  });
}
