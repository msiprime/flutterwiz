import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_exploring/features/counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('counter bloc', () {
    // testing initial state
    test('Initial state should be 0', () {
      final bloc = CounterBloc();
      expect(bloc.state, 0);
    });

    blocTest<CounterBloc, int>(
      'initial state',
      build: () => CounterBloc(),
      act: (bloc) {
        // initial event -> state 0
      },
      expect: () => <int>[],
    );

    blocTest<CounterBloc, int>(
      'After first increment event',
      build: () => CounterBloc(),
      act: (bloc) {
        bloc.add(CounterIncremented());
      },
      expect: () => <int>[
        1,
      ],
    );
    blocTest<CounterBloc, int>(
      'After second increment event',
      build: () => CounterBloc(),
      act: (bloc) {
        bloc.add(CounterIncremented());
        bloc.add(CounterIncremented());
      },
      expect: () => <int>[
        1,
        2,
      ],
    );

    blocTest<CounterBloc, int>(
      'seed function testing with counter',
      build: () => CounterBloc(),
      seed: () => 5,
      act: (bloc) {
        bloc.add(CounterIncremented());
      },
      expect: () => <int>[6],
    );
  });
}
