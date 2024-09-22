import 'package:flutter_exploring/bioxin_search/data/models/product_response.dart';
import 'package:flutter_exploring/failure/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProductDataSource {
  Future<Either<Failure, List<ProductModel>>> getProducts();

  // Path: lib/bioxin_search/data/data_sources/product_datasource.dart

  Future<Either<Failure, List<ProductModel>>> getPopularProducts();
}
