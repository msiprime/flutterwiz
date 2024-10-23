import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/enum_testing.dart';
import 'package:flutter_exploring/features/counter_bloc/pages/counter_bloc_screen.dart';
import 'package:flutter_exploring/pages/rx_dart_learning.dart';
import 'package:flutter_exploring/widget/goto_page_button.dart';
import 'package:gap/gap.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_testground/hydrated_bloc_testground.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_repository/user_repository.dart';

import 'pages/custom_scroll_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(
    const MyApp(),
  );
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Test Ground Main'),
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            GoTo(page: Scaffold(), pageName: 'Counter'),
            Gap(8),
            GoTo(page: HydratedThemePage(), pageName: 'Hydrated Theme'),
            Gap(8),
            GoTo(page: StatusWidget(), pageName: 'Status Widget'),
            Gap(8),
            GoTo(page: RxDartLearningScreen(), pageName: 'RxDart Test Ground'),
            Gap(8),
            GoTo(
                page: CustomScrollViewExample(),
                pageName: 'Custom Scroll View Example'),
            Gap(8),
            GoTo(
                page: CounterBlocScreen(),
                pageName: 'Simple Counter With Bloc'),
          ],
        ),
      ),
    );
  }
}
