part of 'bloc_test_bloc.dart';

@immutable
sealed class TestState {
  const TestState();
}

final class TestInitial extends TestState {}

final class TestIncrement extends TestState {
  final int counter;

  const TestIncrement(this.counter);
}
