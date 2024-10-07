import 'dart:async';

import 'package:counter_with_bloc/src/lib/blocs/clunter_event.dart';
import 'package:counter_with_bloc/src/lib/blocs/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterStateSuccess(0)) {
    on<CounterIncremented>(_onCounterIncremented);
  }

  FutureOr<void> _onCounterIncremented(event, emit) {
    emit(CounterStateSuccess((state as CounterStateSuccess).count + 1));
  }
}
