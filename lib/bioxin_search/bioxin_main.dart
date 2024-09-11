import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/bioxin_search/data/data_sources/product_datasource_impl.dart';
import 'package:flutter_exploring/bioxin_search/data/repositories/product_repo_impl.dart';
import 'package:flutter_exploring/bioxin_search/domain/use_cases/product_usecase.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'presentation/bloc/search_bloc.dart';
import 'presentation/cubit/product_cubit.dart';
import 'presentation/pages/search_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(
            ProductUseCase(
              ProductRepoImpl(
                productDataSource: ProductDataSourceImpl(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ProductCubit(
            ProductUseCase(
              ProductRepoImpl(
                productDataSource: ProductDataSourceImpl(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SearchScreen(),
        theme: ThemeData.light().copyWith(
          extensions: [
            const SkeletonizerConfigData(
              justifyMultiLineText: true,
              ignoreContainers: false,
              effect: ShimmerEffect(),
            ),
          ],
        ),
        darkTheme: ThemeData.dark().copyWith(
          extensions: [
            SkeletonizerConfigData.dark(
              justifyMultiLineText: true,
              ignoreContainers: false,
              effect: PulseEffect(
                from: Colors.grey[800]!,
                to: Colors.grey[900]!,
              ),
            ),
          ],
        ),
        themeMode: ThemeMode.system,
      ),
    ),
  );
}
