part of 'typingbloc_bloc.dart';

@immutable
sealed class TypingblocEvent {}

class OnTypeEvent extends TypingblocEvent {
  final String someText;

  OnTypeEvent(this.someText);

  @override
  String toString() => 'OnTypeEvent(text: $someText)';
}
