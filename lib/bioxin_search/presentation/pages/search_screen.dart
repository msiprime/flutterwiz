import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/bioxin_search/presentation/bloc/search_bloc.dart';
import 'package:flutter_exploring/bioxin_search/presentation/widgets/bioxin_search_bar.dart';
import 'package:flutter_exploring/bioxin_search/presentation/widgets/popular_products.dart';
import 'package:flutter_exploring/bioxin_search/presentation/widgets/recent_search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearchFocused = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _searchFocusNode.addListener(() {
      setState(() {
        _isSearchFocused = _searchFocusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BioxinSearchField(
                  focusNode: _searchFocusNode,
                  controller: _searchController,
                  onChanged: (query) {
                    context.read<SearchBloc>().add(SearchTextChanged(query));
                  },
                  onSubmitted: (query) {
                    context.read<SearchBloc>().add(SearchSubmitted(query));
                  },
                  onClear: () {
                    _searchController.clear();
                    _searchFocusNode.unfocus();
                  },
                ),
                const SizedBox(height: 10),
                if (_isSearchFocused)
                  BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SearchLoaded) {
                        const double itemHeight = 50.0;

                        double totalHeight = state.items.length * itemHeight;

                        double maxHeight = 300.0;
                        return ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          child: Card(
                            shape: const LinearBorder(),
                            elevation: 5,
                            shadowColor: Colors.black.withOpacity(0.25),
                            child: Flexible(
                              child: SizedBox(
                                height: totalHeight < maxHeight
                                    ? totalHeight
                                    : maxHeight,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) => Divider(
                                    height: 1,
                                    color: Theme.of(context)
                                        .dividerColor
                                        .withOpacity(0.1),
                                  ),
                                  shrinkWrap: true,
                                  itemCount: state.items.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      visualDensity: VisualDensity.standard,
                                      dense: true,
                                      title: Text(
                                        state.items[index].title,
                                        style: const TextStyle(
                                            color: Color(0xFF757C86)),
                                      ),
                                      onTap: () {
                                        // Handle search result tap
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      } else if (state is SearchInitial) {
                        const PopularProducts();
                        // Show popular products initially
                        return const SizedBox.shrink();
                      } else if (state is SearchError) {
                        return const Center(child: Text("No results found."));
                      } else if (state is SearchError) {
                        return Center(child: Text(state.message));
                      }
                      return const PopularProducts(); // Fallback
                    },
                  ),
                const PopularProducts(),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 600,
                  child: RecentSearch(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
