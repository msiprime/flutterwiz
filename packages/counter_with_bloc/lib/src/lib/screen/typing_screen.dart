import 'package:counter_with_bloc/counter_with_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypingScreen extends StatelessWidget {
  const TypingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final typingBloc = context.read<TypingBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typing Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your typing is shown here',
            ),
            BlocBuilder(
              builder: (context, state) {
                if (state is TypingblocNameChanged) {
                  return Text(state.name);
                }
                return const Text('Start typing...');
              },
              bloc: typingBloc,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                onChanged: (text) {
                  typingBloc.add(OnTypeEvent(text));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
