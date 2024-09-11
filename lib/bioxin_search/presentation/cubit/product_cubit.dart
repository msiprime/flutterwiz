import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/bioxin_search/domain/use_cases/product_usecase.dart';
import 'package:flutter_exploring/bioxin_search/presentation/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductUseCase productUseCase;

  ProductCubit(this.productUseCase) : super(ProductState.initial());

  void fetchPopularProducts() async {
    emit(state.copyWith(state: ProductScreenState.loading));
    await Future.delayed(const Duration(seconds: 200));
    try {
      final result = await productUseCase.fetchPopularProducts();
      result.fold(
        (failure) => emit(state.copyWith(
          state: ProductScreenState.error,
          message: 'Failed to load popular products',
        )),
        (products) => emit(state.copyWith(
          state: ProductScreenState.success,
          products: products,
        )),
      );
    } catch (e) {
      emit(state.copyWith(
        state: ProductScreenState.error,
        message: 'An error occurred',
      ));
    }
  }

  void searchProducts(String query) async {
    emit(state.copyWith(state: ProductScreenState.loading));
    await Future.delayed(const Duration(seconds: 2));
    try {
      final result = await productUseCase.searchProducts(query);
      result.fold(
        (failure) => emit(state.copyWith(
          state: ProductScreenState.error,
          message: 'Failed to load search results',
        )),
        (products) => emit(state.copyWith(
          state: ProductScreenState.success,
          products: products,
        )),
      );
    } catch (e) {
      emit(state.copyWith(
        state: ProductScreenState.error,
        message: 'An error occurred',
      ));
    }
  }
}
