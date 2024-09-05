part of 'search_bloc.dart';

@immutable
sealed class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchTextChanged extends SearchEvent {
  final String query;

  const SearchTextChanged(this.query);

  @override
  List<Object> get props => [query];
}

class SearchSubmitted extends SearchEvent {
  final String query;

  const SearchSubmitted(this.query);

  @override
  List<Object> get props => [query];
}
