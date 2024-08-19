import 'package:cubit_test_ground/src/cubit/counter_cubit.dart';
import 'package:cubit_test_ground/src/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();
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
            Text('${counterCubit.state}'),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                if (state is CounterInitial) {
                  return Text('Initial');
                } else if (state is CounterLoading) {
                  return CircularProgressIndicator();
                } else if (state is CounterError) {
                  return Text('Error');
                } else if (state is CounterLoaded) {
                  return Text(state.data);
                } else {
                  return Text('Unknown');
                }
              },
            ),
            // Text('${context.select((CounterCubit cubit) => cubit.state)}'),
            TextButton(
                onPressed: () {
                  context.read<CounterCubit>().fetchData();
                },
                child: Text('fetch data')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
