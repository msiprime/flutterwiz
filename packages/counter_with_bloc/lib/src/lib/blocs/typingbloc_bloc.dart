import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'typingbloc_event.dart';
part 'typingbloc_state.dart';

class TypingBloc extends Bloc<TypingblocEvent, TypingblocState> {
  TypingBloc() : super(TypingblocInitial()) {
    on<OnTypeEvent>(_onTypeEvent,
        transformer: restartableDebounce(Duration(milliseconds: 300)));
  }

  void _onTypeEvent(OnTypeEvent event, Emitter<TypingblocState> emit) async {
    await Future.delayed(Duration(seconds: 5));
    emit(TypingblocNameChanged(event.someText));
  }

  EventTransformer<T> restartableDebounce<T>(Duration duration) {
    return (events, mapper) {
      return events.debounceTime(duration).switchMap(mapper);
    };
  }
}

// okkh
class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('...........................................');
    print('${bloc.runtimeType} $event ${event}');
    print(
        '...................................................E.V.E.N.T Triggered.....................');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('...........................................');
    print('${bloc.runtimeType} $transition');
    print('...........T.R.A.N.S.I.T.I.O.N.............');
  }
}
