import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/bioxin_search/data/models/search_model.dart';

import '../../domain/use_cases/product_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductUseCase productUseCase;
  final List<SearchResultItem> searchHistory = [];

  SearchBloc(this.productUseCase) : super(const SearchInitial()) {
    on<SearchTextChanged>(_onSearchTextChanged);
    on<SearchSubmitted>(_onSearchSubmitted);
  }

  FutureOr<void> _onSearchTextChanged(
      SearchTextChanged event, Emitter<SearchState> emit) async {
    emit(const SearchLoading());
    if (event.query.isEmpty) {
      // Fetch popular products
      final result = await productUseCase.fetchPopularProducts();
      result.fold(
        (failure) => emit(const SearchError('Failed to load popular products')),
        (products) {
          final items = products
              .map((product) => SearchResultItem(
                  image: product.productCoverImage ?? '',
                  title: product.productName ?? ''))
              .toList();
          emit(SearchLoaded(items));
        },
      );
    } else {
      // Perform search
      final result = await productUseCase.searchProducts(event.query);
      result.fold(
        (failure) => emit(const SearchError('Failed to load search results')),
        (products) {
          final filteredItems = products
              .map((product) => SearchResultItem(
                  image: product.productCoverImage ?? '',
                  title: product.productName ?? ''))
              .toList();
          emit(SearchLoaded(filteredItems));
        },
      );
    }
  }

  FutureOr<void> _onSearchSubmitted(
      SearchSubmitted event, Emitter<SearchState> emit) {
    final newItem = SearchResultItem(image: image1, title: event.query);
    searchHistory.add(newItem);
    emit(SearchLoaded(searchHistory));
  }
}

const image1 =
    'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
const image2 =
    'https://images.unsplash.com/photo-1539634936668-036d13a9cc3b?q=80&w=3132&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
const image3 =
    'https://images.unsplash.com/photo-1517751243320-0cc45ec82da7?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
