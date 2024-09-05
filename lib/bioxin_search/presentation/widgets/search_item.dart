import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.searchItemName,
    required this.onDelete,
  });

  final String searchItemName;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.3),
          ),
        ),
      ),
      child: Chip(
        visualDensity: VisualDensity.compact,
        clipBehavior: Clip.none,
        padding: const EdgeInsets.all(0),
        labelPadding: const EdgeInsets.all(0),
        side: BorderSide.none,
        label: SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          child: Text(
            searchItemName,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        onDeleted: () {},
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
