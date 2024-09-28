import 'package:flutter_exploring/bioxin_search/data/models/product_response.dart';
import 'package:flutter_exploring/failure/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProductDataSource {
  Future<Either<Failure, List<ProductModel>>> getProducts();
  // as an example, we can add another method to get popular products
  Future<Either<Failure, List<ProductModel>>> getPopularProducts();
}
