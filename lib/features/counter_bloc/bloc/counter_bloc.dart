import 'dart:async';

import 'package:flutter/foundation.dart' show immutable;
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncremented>(_onCounterIncremented);
    on<CounterDecremented>(_onCounterDecremented);
    on<CounterReset>(_onCounterReset);
  }

  FutureOr<void> _onCounterIncremented(
      CounterIncremented event, Emitter<int> emit) {
    emit(state + 1);
  }

  FutureOr<void> _onCounterDecremented(
      CounterDecremented event, Emitter<int> emit) {
    emit(state - 1);
  }

  FutureOr<void> _onCounterReset(CounterReset event, Emitter<int> emit) {
    emit(0);
  }
}
