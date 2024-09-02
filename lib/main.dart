import 'package:cubit_test_ground/cubit_test_ground.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/widget/goto_page_button.dart';
import 'package:user_repository/user_repository.dart';

void main() => runApp(const MyApp());

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
          BlocProvider<CounterCubit>(
            create: (context) => CounterCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          theme: ThemeData.dark(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.dark,
          home: const HomePage(),
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
            GoTo(page: CounterView(), pageName: 'Counter'),
          ],
        ),
      ),
    );
  }
}
