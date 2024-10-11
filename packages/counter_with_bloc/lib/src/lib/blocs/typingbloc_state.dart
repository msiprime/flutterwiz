part of 'typingbloc_bloc.dart';

@immutable
sealed class TypingblocState {}

final class TypingblocInitial extends TypingblocState {}

final class TypingblocNameChanged extends TypingblocState {
  final String name;

  TypingblocNameChanged(this.name);
}

final class TypingblocNameError extends TypingblocState {
  final String error;

  TypingblocNameError(this.error);
}
