import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/features/user/domain/entities/user.dart';
import 'package:flutter_exploring/features/user/domain/use_cases/user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.getUsers) : super(UserInitial()) {
    on<FetchUsers>(_onFetchUsers);
  }

  final GetUsers getUsers;

  FutureOr<void> _onFetchUsers(
    FetchUsers event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    await Future<void>.delayed(Duration(seconds: 2));
    try {
      final users = await getUsers();
      users.fold(
        (l) => emit(UserError(l)),
        (r) => emit(UserLoaded(r)),
      );
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
