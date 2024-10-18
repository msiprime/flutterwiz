import 'package:counter_with_bloc/counter_with_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/enum_testing.dart';
import 'package:flutter_exploring/widget/goto_page_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_testground/hydrated_bloc_testground.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(
    const MyApp(),
  );
}

// oh shit hydrated bloc /// dang

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
          BlocProvider<TypingBloc>(
            create: (context) => TypingBloc(),
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
            GoTo(page: TypingScreen(), pageName: 'Typing Test Ground'),
            Gap(8),
            GoTo(page: RxDartLearningScreen(), pageName: 'RxDart Test Ground'),
          ],
        ),
      ),
    );
  }
}

class RxDartLearningScreen extends HookWidget {
  const RxDartLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subject = useMemoized(() => BehaviorSubject<String>(), [key]);
    useEffect(() => subject.close, [subject]);

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
            initialData: 'Please start typing...',
            stream: subject.stream
                .distinct()
                .debounceTime(const Duration(seconds: 1)),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Loading');
              } else if (snapshot.connectionState == ConnectionState.done) {
                return const Text('Done');
              } else {
                return const Text('Empty');
              }
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          decoration: const InputDecoration(border: OutlineInputBorder()),
          onChanged: (value) {
            subject.sink.add(value);
          },
        ),
      ),
    );
  }
}
