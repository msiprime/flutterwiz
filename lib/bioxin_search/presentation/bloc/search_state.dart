part of 'search_bloc.dart';

@immutable
sealed class SearchState extends Equatable {
  const SearchState();
}

final class SearchInitial extends SearchState {
  const SearchInitial();

  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  final List<SearchResultItem> items;

  const SearchLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchLoading extends SearchState {
  const SearchLoading();

  @override
  List<Object> get props => [];
}
