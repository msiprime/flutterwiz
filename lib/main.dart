import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_exploring/dependecies/dependecies.dart';
import 'package:flutter_exploring/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter_exploring/pages/home_page.dart';
import 'package:flutter_exploring/theme/app_theme.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_testground/hydrated_bloc_testground.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  await setupServiceLocator();
  await dotenv.load(fileName: ".env");
  Gemini.init(apiKey: dotenv.env['GEMINI_API_KEY_PAID'] ?? '');
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
    return MultiBlocProvider(
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
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: ThemeMode.light,
                home: const HomePage(),
              ),
      ),
    );
  }
}

mixin DisposableMixin<T extends StatefulWidget> on State<T> {
  List<ChangeNotifier> get disposables;

  @override
  void dispose() {
    super.dispose();

    for (final disposable in disposables) {
      disposable.dispose();
    }

    log('dispose $runtimeType disposables');
  }
}
