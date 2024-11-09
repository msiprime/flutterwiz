import 'package:flutter/material.dart';
import 'package:flutter_exploring/widget/app_textfield.dart';

class UrgentUiDesign extends StatelessWidget {
  const UrgentUiDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField.roundedBorder(
                hintText: 'Enter your name',
              ),
              const SizedBox(height: 20),
              AppTextField.roundedBorder(
                hintText: 'Enter your name',
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
