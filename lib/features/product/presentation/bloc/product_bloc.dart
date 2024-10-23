import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/features/product/domain/entities/product_entity.dart';
import 'package:flutter_exploring/features/product/domain/use_cases/product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchProductUseCase fetchProductUseCase;
  final FetchPopularProductUseCase fetchPopularProductUseCase;

  ProductBloc({
    required this.fetchProductUseCase,
    required this.fetchPopularProductUseCase,
  }) : super(ProductInitial()) {
    on<FetchProductEvent>(_onFetchProductEvent);
    on<FetchPopularProductEvent>(_onFetchPopularProductEvent);
  }

  Future<void> _onFetchProductEvent(
      FetchProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    final result = await fetchProductUseCase.fetchProducts();
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (products) => emit(ProductLoaded(products)),
    );
  }

  Future<void> _onFetchPopularProductEvent(
      FetchPopularProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    final result = await fetchPopularProductUseCase.fetchPopularProducts();
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (products) => emit(ProductLoaded(products)),
    );
  }
}
