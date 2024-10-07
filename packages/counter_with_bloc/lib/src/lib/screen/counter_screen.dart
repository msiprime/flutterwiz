import 'package:counter_with_bloc/src/lib/blocs/clunter_event.dart';
import 'package:counter_with_bloc/src/lib/blocs/counter_bloc.dart';
import 'package:counter_with_bloc/src/lib/blocs/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CounterBloc>().stream.listen((state) {
      if (state is CounterStateSuccess) {
        print('Counter value: ${(state).count}');
      }
    });
    final counterValue =
        context.watch<CounterBloc>().state as CounterStateSuccess;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${counterValue.count}',
              style: TextStyle(fontSize: 32),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().add(CounterIncremented());
          // await Future.delayed(const Duration(milliseconds: 0));

          context.read<CounterBloc>().add(CounterIncremented());
          // await Future.delayed(const Duration(milliseconds: 0));

          context.read<CounterBloc>().add(CounterIncremented());
          // await Future.delayed(const Duration(milliseconds: 0));

          context.read<CounterBloc>().add(CounterIncremented());
          // await Future.delayed(const Duration(milliseconds: 0));

          context.read<CounterBloc>().add(CounterIncremented());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
