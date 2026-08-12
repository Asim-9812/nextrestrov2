import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/presentation/bloc/product_bloc.dart';
import '../../../product/presentation/bloc/product_state.dart';
import 'product_card.dart';

class BestSellersGrid extends StatelessWidget {
  const BestSellersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const double spacing = 16.0;
    
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          final products = List.from(state.products)..shuffle();
          final displayProducts = products.take(4).toList();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double itemWidth = (constraints.maxWidth - spacing) / 2;
                
                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: displayProducts.map((product) {
                    return ProductCard(
                      product: product,
                      width: itemWidth,
                      showBadge: true,
                    );
                  }).toList(),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
