import 'package:flutter_exploring/failure/failure.dart';
import 'package:flutter_exploring/features/product/domain/entities/product_entity.dart';
import 'package:flutter_exploring/features/product/domain/repositories/product_repo.dart';
import 'package:fpdart/fpdart.dart';

class FetchPopularProductUseCase {
  final ProductRepo _productRepository;

  FetchPopularProductUseCase(this._productRepository);

  Future<Either<Failure, List<ProductEntity>>> fetchPopularProducts() async {
    return await _productRepository.getPopularProducts();
  }
}
