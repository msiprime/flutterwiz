import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rxdart/rxdart.dart';

class RxDartLearningScreen extends HookWidget {
  const RxDartLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subject = useMemoized(() => BehaviorSubject<String>(), [key]);
    useEffect(() => subject.close, [subject]);

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
            initialData: 'Please start typing...',
            stream: subject.stream
                .distinct()
                .debounceTime(const Duration(seconds: 1)),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.toString());
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Loading');
              } else if (snapshot.connectionState == ConnectionState.done) {
                return const Text('Done');
              } else {
                return const Text('Empty');
              }
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          decoration: const InputDecoration(border: OutlineInputBorder()),
          onChanged: (value) {
            subject.sink.add(value);
          },
        ),
      ),
    );
  }
}
