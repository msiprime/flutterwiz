import "dart:async";

import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
part "login_event.dart";
part "login_state.dart";

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<CustomLoginEvent>(_onCustomLoginEvent);
  }

  FutureOr<void> _onCustomLoginEvent(
    CustomLoginEvent event,
    Emitter<LoginState> emit,
  ) {
    // TODO: Add Logic
  }
}
