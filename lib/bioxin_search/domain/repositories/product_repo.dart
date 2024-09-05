import 'package:flutter_exploring/bioxin_search/domain/entities/product_entity.dart';
import 'package:flutter_exploring/failure/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();

  Future<Either<Failure, List<ProductEntity>>> getPopularProducts();
}
