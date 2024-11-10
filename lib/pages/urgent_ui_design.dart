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
                isLoading: false,
                hintText: 'Enter your name',
              ),
              const SizedBox(height: 20),
              PassWordTextField(),
              const SizedBox(height: 20),
              PrimaryButton(
                onPressed: () {},
                title: 'Sign In',
                fixedSize: const Size(5, 10),
              ),
              const SizedBox(height: 20),
              SecondaryButton(title: 'Sign Up', onPressed: () {}),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 50,
    this.width = double.infinity,
    this.titleStyle,
    this.fixedSize,
    this.maximumSize,
    this.isLoading = false,
  });

  final double height;
  final double width;

  final String title;
  final TextStyle? titleStyle;
  final VoidCallback onPressed;

  final Size? fixedSize;
  final Size? maximumSize;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize:
            fixedSize != null ? WidgetStateProperty.all(fixedSize!) : null,
        maximumSize:
            maximumSize != null ? WidgetStateProperty.all(maximumSize!) : null,
        minimumSize: WidgetStateProperty.all(Size(width, height)),
        textStyle: WidgetStateProperty.all(
          Theme.of(context).textTheme.bodyLarge,
        ),
        visualDensity: VisualDensity.standard,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        backgroundColor:
            WidgetStateProperty.all(Theme.of(context).primaryColor),
        foregroundColor:
            WidgetStateProperty.all(Theme.of(context).colorScheme.onPrimary),
      ),
      clipBehavior: Clip.antiAlias,
      child: isLoading
          ? SizedBox(
              height: height / 2,
              width: height / 2,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(title, style: titleStyle),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 50,
    this.width = double.infinity,
    this.titleStyle,
    this.fixedSize,
    this.maximumSize,
    this.isLoading = false,
  });

  final double height;
  final double width;

  final String title;
  final TextStyle? titleStyle;
  final VoidCallback onPressed;

  final Size? fixedSize;
  final Size? maximumSize;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize:
            fixedSize != null ? WidgetStateProperty.all(fixedSize!) : null,
        maximumSize:
            maximumSize != null ? WidgetStateProperty.all(maximumSize!) : null,
        minimumSize: WidgetStateProperty.all(Size(width, height)),
        textStyle: WidgetStateProperty.all(
          Theme.of(context).textTheme.bodyLarge,
        ),
        visualDensity: VisualDensity.standard,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.primary.withOpacity(0.15),
        ),
        foregroundColor:
            WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
      ),
      clipBehavior: Clip.antiAlias,
      child: isLoading
          ? SizedBox(
              height: height / 2,
              width: height / 2,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(title, style: titleStyle),
    );
  }
}

class PassWordTextField extends StatelessWidget {
  const PassWordTextField({
    super.key,
    this.onChanged,
    this.textController,
    this.isLoading = false,
  });

  final bool isLoading;
  final void Function(String)? onChanged;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);
    return ValueListenableBuilder(
      valueListenable: obscureText,
      builder: (context, value, child) {
        return AppTextField.roundedBorder(
          onChanged: onChanged,
          textController: textController,
          isLoading: isLoading,
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
              value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: Colors.grey,
            ),
            onPressed: () {
              obscureText.value = !obscureText.value;
            },
          ),
        );
      },
    );
  }
}

//class PrimaryButton extends StatelessWidget {
//   const PrimaryButton({
//     super.key,
//     required this.title,
//     required this.onPressed,
//     this.height = 50,
//     this.width = double.infinity,
//     this.titleStyle,
//     this.fixedSize,
//     this.maximumSize,
//     this.isLoading = false,
//   });
//
//   final double height;
//   final double width;
//
//   final String title;
//   final TextStyle? titleStyle;
//   final VoidCallback onPressed;
//
//   final Size? fixedSize;
//   final Size? maximumSize;
//
//   final bool isLoading;
//
//   @override
//   Widget build(BuildContext context) {
//     // ValueNotifier<bool> loading = ValueNotifier(isLoading);
//     return FilledButton(
//       onPressed: onPressed,
//       style: ButtonStyle(
//         fixedSize:
//             fixedSize != null ? WidgetStateProperty.all(fixedSize!) : null,
//         maximumSize:
//             maximumSize != null ? WidgetStateProperty.all(maximumSize!) : null,
//         minimumSize: WidgetStateProperty.all(Size(width, height)),
//         textStyle: WidgetStateProperty.all(
//           Theme.of(context).textTheme.bodyLarge,
//         ),
//         visualDensity: VisualDensity.standard,
//         shape: WidgetStateProperty.all(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         backgroundColor:
//             WidgetStateProperty.all(Theme.of(context).primaryColor),
//         foregroundColor:
//             WidgetStateProperty.all(Theme.of(context).colorScheme.onPrimary),
//       ),
//       clipBehavior: Clip.antiAlias,
//       child: isLoading
//           ? SizedBox(
//               height: height / 2,
//               width: height / 2,
//               child: const CircularProgressIndicator(
//                 strokeWidth: 2,
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//               ),
//             )
//           : Text(title, style: titleStyle),
//     );
//   }
// }
