import 'package:flutter_exploring/failure/failure.dart';
import 'package:flutter_exploring/features/product/data/models/product_response.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProductDataSource {
  Future<Either<Failure, List<ProductModel>>> getProducts();

  Future<Either<Failure, List<ProductModel>>> getPopularProducts();
}
