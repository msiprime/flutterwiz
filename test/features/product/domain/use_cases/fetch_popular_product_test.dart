import 'package:flutter_exploring/failure/failure.dart';
import 'package:flutter_exploring/features/product/domain/entities/product_entity.dart';
import 'package:flutter_exploring/features/product/domain/use_cases/fetch_popular_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'product_repo.mock.dart';

void main() {
  late MockProductRepo mockProductRepo;
  late FetchPopularProductUseCase useCase;

  setUp(() {
    mockProductRepo = MockProductRepo();
    useCase = FetchPopularProductUseCase(mockProductRepo);
  });

  group('FetchPopularProductUseCase', () {
    test(
        'should return a list of ProductEntity when the call to the repository is successful',
        () async {
      // Arrange
      final productList = [ProductEntity(id: 1)];
      when(
        () => mockProductRepo.getPopularProducts(),
      ).thenAnswer(
        (_) async => Right(productList),
      );

      // Act
      final result = await useCase.fetchPopularProducts();

      // Assert
      expect(result, equals(Right(productList)));
      verify(() => mockProductRepo.getPopularProducts()).called(1);
      verifyNoMoreInteractions(mockProductRepo);
    });

    test(
      'should return a Failure when the call to the repository fails',
      () async {
        // Arrange
        when(() => mockProductRepo.getPopularProducts()).thenAnswer(
          (_) async => Left(Failure()),
        );
        // Act
        final result = await useCase.fetchPopularProducts();

        // Assert
        expect(result, equals(Left(Failure())));
        verify(() => mockProductRepo.getPopularProducts()).called(1);
        verifyNoMoreInteractions(mockProductRepo);
      },
    );
  });
}
