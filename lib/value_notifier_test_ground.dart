import 'package:flutter/material.dart';

class ValueNotifierTestGround extends StatelessWidget {
  const ValueNotifierTestGround({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> counter = ValueNotifier<int>(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier Test Ground'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(DateTime.now().toIso8601String()),
            ValueListenableBuilder(
              valueListenable: counter,
              builder: (_, value, __) {
                return Text('Counter: $value');
              },
            ),
            ElevatedButton(
              onPressed: () {
                counter.value++;
              },
              child: const Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
