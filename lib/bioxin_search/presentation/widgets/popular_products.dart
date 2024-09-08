import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/bioxin_search/presentation/cubit/product_cubit.dart';
import 'package:flutter_exploring/bioxin_search/presentation/cubit/product_state.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  void initState() {
    context.read<ProductCubit>().fetchPopularProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state.state == ProductScreenState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.state == ProductScreenState.error) {
            return Center(child: Text('An error occurred: ${state.message}'));
          }
          if (state.state == ProductScreenState.success) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Popular search ',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Flexible(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        width: 100,
                        height: 120,
                        color: const Color(0xFFF1F6F9),
                        margin: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              product.productCoverImage ?? '',
                              width: 82,
                              height: 82,
                              scale: 0.5,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              product.productName ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
