import 'package:flutter/material.dart';
import 'package:flutter_exploring/value_notifier_test_ground.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.light(),
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
                  goToPage(context, const ValueNotifierTestGround());
                },
                child: const Text('Go To ValueNotifier Test Ground')),
          ],
        ),
      ),
    );
  }
}

void goToPage(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
