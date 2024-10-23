import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/features/counter_bloc/bloc/counter_bloc.dart';

class CounterBlocScreen extends StatelessWidget {
  const CounterBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CounterBlocScreen'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(CounterIncremented());
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
