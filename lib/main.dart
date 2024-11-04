import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/dependecies/dependecies.dart';
import 'package:flutter_exploring/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter_exploring/pages/home_page.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_testground/hydrated_bloc_testground.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  await setupServiceLocator();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(
    const MyApp(),
  );
}

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    log('onClose(${bloc.runtimeType})');
    super.onClose(bloc);
  }
}

// my app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => FirebaseUserRepo(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HydratedThemeBloc>(
            create: (context) => HydratedThemeBloc(),
          ),
          BlocProvider<ProductBloc>(
            create: (context) => sl.get<ProductBloc>(),
          ),
        ],
        child: BlocBuilder<HydratedThemeBloc, HydratedThemeState>(
          builder: (context, state) => (state is ThemeChanged)
              ? MaterialApp(
                  debugShowCheckedModeBanner: false,
                  debugShowMaterialGrid: false,
                  theme: state.themeData,
                  darkTheme: state.themeData,
                  themeMode: ThemeMode.system,
                  home: const HomePage(),
                )
              : MaterialApp(
                  debugShowCheckedModeBanner: false,
                  debugShowMaterialGrid: false,
                  theme: ThemeData.light(),
                  darkTheme: ThemeData.dark(),
                  themeMode: ThemeMode.light,
                  home: const HomePage(),
                ),
        ),
      ),
    );
  }
}
