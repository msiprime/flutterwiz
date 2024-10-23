import 'package:flutter_exploring/failure/failure.dart';
import 'package:flutter_exploring/features/product/domain/entities/product_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();

  Future<Either<Failure, List<ProductEntity>>> getPopularProducts();
}
