import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_exploring/main.dart';
import 'package:gap/gap.dart';

class LeakyPage extends StatelessWidget {
  const LeakyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const Column(
          children: [
            SizedBox(height: 20),
            Gap(8),
            Text(
              'Welcome to the Leaky Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(8),
            LeakyWidget(),
            Gap(8),
            Text(
              'Type something in the text field above and navigate to the Home Page',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeakyWidget extends StatefulWidget {
  const LeakyWidget({super.key});

  @override
  LeakyWidgetState createState() => LeakyWidgetState();
}

class LeakyWidgetState extends State<LeakyWidget>
    with DisposableMixin<LeakyWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_printText);
  }

  @override
  void dispose() {
    _controller.removeListener(_printText);
    log("disposing from default dispose method");
    _controller.dispose();
    super.dispose();
  }

  void _printText() {
    log(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(controller: _controller);
  }

  @override
  List<ChangeNotifier> get disposables => [_controller];
}
