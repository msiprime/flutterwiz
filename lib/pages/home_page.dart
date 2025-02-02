import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exploring/widget/goto_page_button.dart';
import 'package:gap/gap.dart';
import 'package:hydrated_bloc_testground/hydrated_bloc_testground.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.grey[800],
        middle: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Gap(8),
            GoTo(
              page: const Scaffold(),
              pageName: 'Hydrated Bloc Testground',
            ),
          ],
        ),
      ),
    );
  }
}
