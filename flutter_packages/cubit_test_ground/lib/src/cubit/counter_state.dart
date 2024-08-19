import 'package:equatable/equatable.dart';

enum CounterScreenStatus { initial, loading, loaded, error }

class CounterState extends Equatable {
  final int count;
  final String data;
  final CounterScreenStatus screenStatus;

  CounterState({
    required this.count,
    required this.data,
    required this.screenStatus,
  });

  CounterState.initial()
      : count = 0,
        screenStatus = CounterScreenStatus.initial,
        data = '';

  CounterState copyWith({
    int? count,
    String? data,
    CounterScreenStatus? screenStatus,
  }) {
    return CounterState(
      screenStatus: screenStatus ?? this.screenStatus,
      count: count ?? this.count,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [count, data, screenStatus];
}
