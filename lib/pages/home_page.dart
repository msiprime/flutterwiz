import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exploring/pages/memory_leak_page.dart';
import 'package:flutter_exploring/widget/goto_page_button.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text(
          'Home Page',
        ),
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Gap(8),
            Text(
              'Welcome to the Home Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(8),
            GoTo(page: LeakyPage(), pageName: "Leaky Widget")
          ],
        ),
      ),
    );
  }
}
