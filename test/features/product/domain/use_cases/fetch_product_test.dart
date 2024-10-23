import 'package:flutter_exploring/features/product/domain/entities/product_entity.dart';
import 'package:flutter_exploring/features/product/domain/use_cases/fetch_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'product_repo.mock.dart';

void main() {
  late MockProductRepo mockProductRepo;
  late FetchProductUseCase useCase;

  setUp(() {
    mockProductRepo = MockProductRepo();
    useCase = FetchProductUseCase(mockProductRepo);
  });

  test(
      'should return a list of ProductEntity when the call to the repository is successful',
      () async {
    // Arrange
    final productList = [ProductEntity(id: 1)];
    when(
      () => mockProductRepo.getProducts(),
    ).thenAnswer(
      (_) async => Right(productList),
    );

    // Act
    final result = await useCase.fetchProducts();

    // Assert
    expect(result, equals(Right(productList)));
    verify(() => mockProductRepo.getProducts()).called(1);
    verifyNoMoreInteractions(mockProductRepo);
  });
}
