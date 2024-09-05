import 'package:flutter_exploring/bioxin_search/domain/entities/product_entity.dart';
import 'package:flutter_exploring/bioxin_search/domain/repositories/product_repo.dart';
import 'package:flutter_exploring/failure/failure.dart';
import 'package:fpdart/fpdart.dart';

class ProductUseCase {
  final ProductRepo _productRepository;

  ProductUseCase(this._productRepository);

  Future<Either<Failure, List<ProductEntity>>> fetchProducts() async {
    return await _productRepository.getProducts();
  }

  Future<Either<Failure, List<ProductEntity>>> fetchPopularProducts() async {
    return await _productRepository.getPopularProducts();
  }

  Future<Either<Failure, List<ProductEntity>>> searchProducts(
      String query) async {
    final productsResult = await _productRepository.getProducts();
    return productsResult.fold(
      (failure) => Left(failure),
      (products) {
        final filteredProducts = products
            .where((product) =>
                product.productName!
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                product.category!.toLowerCase().contains(query.toLowerCase()))
            .toList();
        return Right(filteredProducts);
      },
    );
  }
}
