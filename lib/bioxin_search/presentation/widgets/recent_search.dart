import 'package:flutter/material.dart';
import 'package:flutter_exploring/bioxin_search/presentation/widgets/search_item.dart';

class RecentSearch extends StatelessWidget {
  const RecentSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRecentSearchHeader(context),
        _buildRecentSearchItems(context),
      ],
    );
  }

  Widget _buildRecentSearchItems(BuildContext context) {
    return Column(
      children: [
        SearchItem(
            searchItemName: 'Anti-Freckle Whitening Serum', onDelete: () {}),
        SearchItem(
            searchItemName: 'Anti-Freckle Whitening Serum', onDelete: () {}),
        SearchItem(
            searchItemName: 'Anti-Freckle Whitening Serum', onDelete: () {}),
        SearchItem(
            searchItemName: 'Anti-Freckle Whitening Serum', onDelete: () {}),
        SearchItem(
            searchItemName: 'Anti-Freckle Whitening Serum', onDelete: () {}),
      ],
    );
  }

  Widget _buildRecentSearchHeader(BuildContext context) {
    return Row(
      children: [
        Text(
          'Recent searches',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Clear all',
            style: TextStyle(
              color: Color(0xFF585E6C),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
