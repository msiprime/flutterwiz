import 'package:cubit_test_ground/src/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(DateTime.now().toIso8601String()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(DateTime.now().toIso8601String()),
            Text('You have pushed the button this many times:'),
            Text('${context.read<CounterCubit>().state}',
                style: Theme.of(context).textTheme.titleMedium),
            Text(
              // '${state}',
              // '${context.watch<CounterCubit>().state}',
              '${context.select((CounterCubit cubit) => cubit.state)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton(
                onPressed: () {
                  context.read<CounterCubit>().reset();
                },
                child: Text('Reset Counter')),
            TextButton(
                onPressed: () {
                  context.read<CounterCubit>().stopWatch();
                },
                child: Text('Stop watch')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterCubit>().increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
