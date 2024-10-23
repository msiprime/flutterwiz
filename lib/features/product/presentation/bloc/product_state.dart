part of 'product_bloc.dart';

@immutable
sealed class ProductState extends Equatable {}

final class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

final class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

final class ProductLoaded extends ProductState {
  final List<ProductEntity> products;

  ProductLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

final class ProductError extends ProductState {
  final String message;

  ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
