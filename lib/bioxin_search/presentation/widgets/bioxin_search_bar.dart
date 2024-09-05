import 'package:flutter/material.dart';
import 'package:flutter_exploring/bioxin_search/presentation/asset/bioxin_filter_icon.dart';
import 'package:flutter_exploring/bioxin_search/presentation/asset/bioxin_search_icon.dart';

class BioxinSearchField extends StatelessWidget {
  const BioxinSearchField({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.onFilter,
    this.controller,
    this.onTap,
    this.focusNode,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String)? onSubmitted;
  final VoidCallback? onFilter;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchBar(
            focusNode: focusNode,
            textStyle: WidgetStatePropertyAll(Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(
                    color: const Color(0xFF757C86),
                    fontWeight: FontWeight.w400)),
            onSubmitted: onSubmitted,
            onChanged: onChanged,
            onTap: onTap,
            controller: controller,
            textInputAction: TextInputAction.search,
            constraints: const BoxConstraints(
              minHeight: 56,
            ),
            side: const WidgetStatePropertyAll(
              BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            elevation: const WidgetStatePropertyAll(0),
            shape: const WidgetStatePropertyAll(
              RoundedRectangleBorder(),
            ),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 0,
              ),
            ),
            hintText: 'Search',
            backgroundColor: const WidgetStatePropertyAll(
              Colors.transparent,
            ),
            leading: CustomPaint(
              size: const Size(16, 16),
              painter: BioxinSearchIcon(),
            ),
          ),
        ),
        FilledButton(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(
              const Size(56, 56),
            ),
            backgroundColor: WidgetStateProperty.all(const Color(0xFF231F20)),
            shape: WidgetStateProperty.all(
              const RoundedRectangleBorder(),
            ),
          ),
          onPressed: onFilter,
          child: CustomPaint(
            size: const Size(25, 25),
            painter: BioxinFilterIcon(),
          ),
        ),
      ],
    );
  }
}
