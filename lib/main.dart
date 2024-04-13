import 'package:flutter/material.dart';
import 'package:flutter_exploring/text_style.dart';

import 'home_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
      title: 'Flutter Exploration',
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
