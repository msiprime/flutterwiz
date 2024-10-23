import 'package:flutter_exploring/features/product/data/data_sources/product_datasource.dart';
import 'package:flutter_exploring/features/product/data/data_sources/product_datasource_impl.dart';
import 'package:flutter_exploring/features/product/data/repositories/product_repo_impl.dart';
import 'package:flutter_exploring/features/product/domain/repositories/product_repo.dart';
import 'package:flutter_exploring/features/product/domain/use_cases/product_usecase.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  await initDataSource();
  await initRepository();
  await initUseCase();
  await initBloc();
}

Future<void> initBloc() async {
  // sl.registerFactory(() => ProductBloc(
  //       fetchProductUseCase: sl(),
  //       fetchPopularProductUseCase: sl(),
  //     ));
}

Future<void> initUseCase() async {
  sl.registerLazySingleton<FetchProductUseCase>(
    () => FetchProductUseCase(
      sl(),
    ),
  );
  sl.registerLazySingleton<FetchPopularProductUseCase>(
    () => FetchPopularProductUseCase(
      sl(),
    ),
  );
}

Future<void> initRepository() async {
  sl.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(
      productDataSource: sl(),
    ),
  );
}

Future<void> initDataSource() async {
  sl.registerLazySingleton<ProductDataSource>(() => ProductDataSourceImpl());
}
