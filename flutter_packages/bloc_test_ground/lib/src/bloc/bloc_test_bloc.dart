import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_test_event.dart';
part 'bloc_test_state.dart';

class TestBloc extends Bloc<TestEvent, int> {
  TestBloc() : super(0) {
    on<Increment>(_onIncrement);
  }

  void _onIncrement(Increment event, Emitter<int> emit) {
    emit(state + 1);
  }
}
