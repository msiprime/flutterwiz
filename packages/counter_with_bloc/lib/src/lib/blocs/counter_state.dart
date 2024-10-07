abstract class CounterState {
  CounterState();
}

class CounterStateInitial extends CounterState {
  CounterStateInitial();
}

class CounterStateSuccess extends CounterState {
  final int count;

  CounterStateSuccess(this.count);
}
