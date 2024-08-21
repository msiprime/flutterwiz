import 'package:bloc_test_ground/bloc_test_ground.dart';
import 'package:cubit_test_ground/cubit_test_ground.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/widget/goto_page_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<TestBloc>(
          create: (context) => TestBloc(),
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
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String valueToStore = '';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Test Ground Main'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            GoTo(page: CounterView(), pageName: 'Counter'),
            GoTo(page: BlocTestingPage(), pageName: 'Bloc Testing'),
            TextField(
              onChanged: (valueInsideTextField) {
                valueToStore = valueInsideTextField;
              },
            ),
            FilledButton(
                onPressed: () {
                  print(valueToStore);
                },
                child: const Text('Print Textfield value'))
          ],
        ),
      ),
    );
  }
}
