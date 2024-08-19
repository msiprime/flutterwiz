import 'package:cubit_test_ground/cubit_test_ground.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Hello World'),
            FilledButton(
              onPressed: () {
                const GoTo(page: CubitPage(), pageName: 'Counter');
              },
              child: const Text('Go to this page'),
            )
          ],
        ),
      ),
    );
  }
}

class GoTo extends StatelessWidget {
  final Widget page;
  final String pageName;

  const GoTo({
    super.key,
    required this.page,
    required this.pageName,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => page));
        },
        child: Text('Go to $pageName'));
  }
}
