import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exploring/bioxin_search/domain/entities/product_entity.dart';
import 'package:flutter_exploring/bioxin_search/presentation/cubit/product_cubit.dart';
import 'package:flutter_exploring/bioxin_search/presentation/cubit/product_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchPopularProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state.state == ProductScreenState.loading) {
            return _buildLoadingSkeleton();
          } else if (state.state == ProductScreenState.success) {
            return _buildProductList(state.products);
          } else if (state.state == ProductScreenState.error) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildLoadingSkeleton() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          width: 100,
          height: 120,
          margin: const EdgeInsets.only(right: 8.0),
          child: Skeletonizer(
            containersColor: Colors.red,
            enabled: true,
            justifyMultiLineText: true,
            textBoneBorderRadius:
                TextBoneBorderRadius(BorderRadius.circular(8)),
            // enableSwitchAnimation: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Skeleton.leaf(
                  child: Container(
                    width: 82,
                    height: 82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 80,
                  height: 16,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProductList(List<ProductEntity> products) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
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
              const SizedBox(height: 8),
              Text(
                product.productName ?? '',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
