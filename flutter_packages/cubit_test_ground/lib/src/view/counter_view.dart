import 'package:cubit_test_ground/cubit_test_ground.dart';
import 'package:cubit_test_ground/src/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Counter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Skeletonizer(
                  enabled: state is CounterLoading,
                  child: SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text('Item number $index as title'),
                            subtitle: const Text('Subtitle here'),
                            trailing: const Icon(Icons.ac_unit),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            TextButton(
              onPressed: () {
                context.read<CounterCubit>().fetchData();
              },
              child: const Text('Fetch Data'),
            ),
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
