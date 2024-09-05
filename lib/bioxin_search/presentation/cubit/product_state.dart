import 'package:flutter_exploring/bioxin_search/domain/entities/product_entity.dart';

enum ProductScreenState { initial, loading, success, error }

class ProductState {
  final ProductScreenState state;
  final List<ProductEntity> products;
  final String message;

  ProductState({
    required this.state,
    this.products = const [],
    this.message = '',
  });

  ProductState.initial()
      : this(
          state: ProductScreenState.initial,
          products: [],
          message: '',
        );

  ProductState copyWith({
    ProductScreenState? state,
    List<ProductEntity>? products,
    String? message,
  }) {
    return ProductState(
      state: state ?? this.state,
      products: products ?? this.products,
      message: message ?? this.message,
    );
  }
}
