import 'package:flutter/material.dart';

/// {@template cubit_test_ground}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class CubitTestGround {
  /// {@macro cubit_test_ground}
  const CubitTestGround();
}

class CubitPage extends StatelessWidget {
  const CubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
