import 'package:flutter_exploring/failure/failure.dart';
import 'package:flutter_exploring/features/product/data/data_sources/product_datasource.dart';
import 'package:flutter_exploring/features/product/domain/entities/product_entity.dart';
import 'package:flutter_exploring/features/product/domain/repositories/product_repo.dart';
import 'package:fpdart/fpdart.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductDataSource productDataSource;

  ProductRepoImpl({
    required this.productDataSource,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> getPopularProducts() async {
    try {
      return await productDataSource.getPopularProducts().then((value) {
        return value.fold(
          (failure) => Left(failure),
          (products) =>
              Right(products.map((product) => product.toEntity()).toList()),
        );
      });
    } catch (e) {
      return Future.value(Left(Failure('Error fetching popular products')));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      return await productDataSource.getProducts().then((value) {
        return value.fold(
          (failure) => Left(failure),
          (products) =>
              Right(products.map((product) => product.toEntity()).toList()),
        );
      });
    } catch (e) {
      return Future.value(Left(Failure('Error fetching products')));
    }
  }
}
