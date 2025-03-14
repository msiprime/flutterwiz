import 'package:flutter/material.dart';

class GoTo extends StatelessWidget {
  final Widget page;
  final String pageName;

  const GoTo({
    super.key,
    required this.page,
    required this.pageName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: FilledButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => page));
          },
          child: Text(
            'Go to $pageName page',
            style: TextStyle(fontSize: 16),
          )),
    );
  }
}
