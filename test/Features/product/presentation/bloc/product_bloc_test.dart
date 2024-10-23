import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_exploring/failure/failure.dart';
import 'package:flutter_exploring/features/product/domain/entities/product_entity.dart';
import 'package:flutter_exploring/features/product/domain/use_cases/product_usecase.dart';
import 'package:flutter_exploring/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockFetchProductUseCase extends Mock implements FetchProductUseCase {}

class MockFetchPopularProductUseCase extends Mock
    implements FetchPopularProductUseCase {}

void main() {
  late ProductBloc productBloc;
  late MockFetchProductUseCase mockFetchProductUseCase;
  late MockFetchPopularProductUseCase mockFetchPopularProductUseCase;

  setUp(() {
    mockFetchProductUseCase = MockFetchProductUseCase();
    mockFetchPopularProductUseCase = MockFetchPopularProductUseCase();
    productBloc = ProductBloc(
      fetchProductUseCase: mockFetchProductUseCase,
      fetchPopularProductUseCase: mockFetchPopularProductUseCase,
    );
  });

  group('ProductBloc', () {
    blocTest<ProductBloc, ProductState>(
      'emits [ProductLoading, ProductLoaded] when FetchPopularProductEvent is added and fetchPopularProducts succeeds',
      build: () {
        when(() => mockFetchPopularProductUseCase.fetchPopularProducts())
            .thenAnswer((_) async => Right([ProductEntity(id: 1)]));
        return productBloc;
      },
      act: (bloc) => bloc.add(FetchPopularProductEvent()),
      expect: () => [
        isA<ProductLoading>(),
        isA<ProductLoaded>()
            .having((state) => state.products, 'products', isNotEmpty),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductLoading, ProductError] when FetchProductEvent is added and fetchProducts fails',
      build: () {
        when(() => mockFetchProductUseCase.fetchProducts())
            .thenAnswer((_) async => Left(Failure('Error fetching products')));
        return productBloc;
      },
      act: (bloc) => bloc.add(FetchProductEvent()),
      expect: () => [
        ProductLoading(),
        ProductError('Error fetching products'),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductLoading, ProductLoaded] when FetchPopularProductEvent is added and fetchPopularProducts succeeds',
      build: () {
        when(() => mockFetchPopularProductUseCase.fetchPopularProducts())
            .thenAnswer((_) async => Right([ProductEntity(id: 1)]));
        return productBloc;
      },
      act: (bloc) => bloc.add(FetchPopularProductEvent()),
      expect: () => [
        // isA<ProductLoading>(),
        // isA<ProductLoaded>()
        //     .having((state) => state.products, 'products', isNotEmpty),
        ProductLoading(),
        ProductLoaded([ProductEntity(id: 1)]),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductLoading, ProductError] when FetchPopularProductEvent is added and fetchPopularProducts fails',
      build: () {
        when(() => mockFetchPopularProductUseCase.fetchPopularProducts())
            .thenAnswer(
                (_) async => Left(Failure('Error fetching popular products')));
        return productBloc;
      },
      act: (bloc) => bloc.add(FetchPopularProductEvent()),
      expect: () => [
        ProductLoading(),
        ProductError('Error fetching popular products'),
      ],
    );
  });
}
