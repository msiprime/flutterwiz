import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_date_time_event.dart';
part 'fetch_date_time_state.dart';

class FetchDateTimeBloc extends Bloc<FetchDateTimeEvent, FetchDateTimeState> {
  FetchDateTimeBloc() : super(FetchDateTimeInitial()) {
    on<FetchDateTimeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}