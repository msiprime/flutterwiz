import 'package:cubit_test_ground/src/repository/fake_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void fetchData() async {
    emit(state.copyWith(screenStatus: CounterScreenStatus.loading));
    try {
      final data = await FakeRepository().fetchString();
      emit(state.copyWith(
        screenStatus: CounterScreenStatus.loaded,
        data: data,
      ));
    } catch (e) {
      emit(state.copyWith(screenStatus: CounterScreenStatus.error));
    }
  }
}
