import 'package:flutter_exploring/failure/failure.dart';
import 'package:flutter_exploring/features/product/domain/entities/product_entity.dart';
import 'package:flutter_exploring/features/product/domain/repositories/product_repo.dart';
import 'package:fpdart/fpdart.dart';

class FetchProductUseCase {
  final ProductRepo _productRepository;

  FetchProductUseCase(this._productRepository);

  Future<Either<Failure, List<ProductEntity>>> fetchProducts() async {
    return await _productRepository.getProducts();
  }
}

class FetchPopularProductUseCase {
  final ProductRepo _productRepository;

  FetchPopularProductUseCase(this._productRepository);

  Future<Either<Failure, List<ProductEntity>>> fetchPopularProducts() async {
    return await _productRepository.getPopularProducts();
  }
}
