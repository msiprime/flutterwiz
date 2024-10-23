part of 'product_bloc.dart';

@immutable
sealed class ProductEvent extends Equatable {}

class FetchProductEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class FetchPopularProductEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}
