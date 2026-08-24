import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/sample_products.dart';
import '../../../product/domain/entities/product.dart';
import '../../../product/presentation/bloc/product_bloc.dart';
import '../../../product/presentation/bloc/product_state.dart';
import 'product_card.dart';

class RecommendedPetsList extends StatelessWidget {
  const RecommendedPetsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const SizedBox(
            height: 240,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        
        List<Product> displayProducts = [];
        if (state is ProductLoaded && state.products.isNotEmpty) {
          final products = List.from(state.products)..shuffle();
          displayProducts = products.take(5).toList().cast<Product>();
        } else {
          displayProducts = sampleProducts.take(5).toList();
        }

        if (displayProducts.isEmpty) return const SizedBox.shrink();
          
        return SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: displayProducts.length,
            itemBuilder: (context, index) {
              final product = displayProducts[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ProductCard(
                  product: product,
                  width: 170,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
