import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/features/counter_bloc/bloc/counter_bloc.dart';

class CounterBlocScreen extends StatelessWidget {
  const CounterBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: const CounterScreenView(),
    );
  }
}

class CounterScreenView extends StatelessWidget {
  const CounterScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.displayMedium,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
