import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'typingbloc_event.dart';
part 'typingbloc_state.dart';

class TypingBloc extends Bloc<TypingblocEvent, TypingblocState> {
  TypingBloc() : super(TypingblocInitial()) {
    on<OnTypeEvent>(
      _onTypeEvent,
      transformer: restartable(),
    );
  }

  Future<void> _onTypeEvent(
      OnTypeEvent event, Emitter<TypingblocState> emit) async {
    await Future.delayed(const Duration(milliseconds: 1000), () {
      emit(TypingblocNameChanged(event.someText));
    });
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('...........................................');
    print('${bloc.runtimeType} $event');
    print('...............xxxxxxxxxxx............................');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('...........................................');
    print('${bloc.runtimeType} $change');
    print('...............xxxxxxxxxxx............................');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('...........................................');
    print('${bloc.runtimeType} $error');
    print('...............xxxxxxxxxxx............................');
  }
}
