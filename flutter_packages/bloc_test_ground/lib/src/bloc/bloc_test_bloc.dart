import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_test_event.dart';
part 'bloc_test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<TestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
