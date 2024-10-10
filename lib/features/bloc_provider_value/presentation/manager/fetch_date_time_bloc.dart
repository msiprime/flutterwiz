import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fetch_date_time_event.dart';
part 'fetch_date_time_state.dart';

class FetchDateTimeBloc extends Bloc<FetchDateTimeEvent, FetchDateTimeState> {
  FetchDateTimeBloc() : super(FetchDateTimeInitial()) {
    on<FetchDateTimeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
