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
                obscureText: true,
                hintText: 'Enter your name',
              ),
              const SizedBox(height: 20),
              PassWordTextField(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class PassWordTextField extends StatelessWidget {
  const PassWordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);
    return ValueListenableBuilder(
        valueListenable: obscureText,
        builder: (context, value, child) {
          return AppTextField.roundedBorder(
            hintText: 'Enter your password',
            obscureText: value,
            suffixIcon: IconButton(
              iconSize: 10,
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              style: ButtonStyle(
                padding: WidgetStateProperty.all(EdgeInsets.zero),
                visualDensity: VisualDensity.compact,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                splashFactory: NoSplash.splashFactory,
              ),
              icon: Icon(
                size: 20,
                value
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Colors.grey,
              ),
              onPressed: () {
                obscureText.value = !obscureText.value;
              },
            ),
          );
        });
  }
}
