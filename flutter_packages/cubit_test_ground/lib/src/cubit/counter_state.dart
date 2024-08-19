import 'package:equatable/equatable.dart';

enum Counter { initial, loading, loaded }

class CounterState extends Equatable {
  final int count;

  CounterState(this.count);

  @override
  List<Object?> get props => [count];
}

class FakeRepository {
  Future<String> fetchString() async {
    await Future.delayed(const Duration(seconds: 5));
    return 'fake string';
  }
}
