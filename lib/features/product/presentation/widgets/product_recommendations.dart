import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../dashboard/presentation/widgets/product_card.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_state.dart';
import '../../domain/entities/product.dart';

class RelatedProductsSection extends StatelessWidget {
  final Product currentProduct;
  const RelatedProductsSection({super.key, required this.currentProduct});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          final relatedProducts = state.products.where((p) {
            return p.id != currentProduct.id && 
                   (p.categoryId == currentProduct.categoryId || 
                    p.petTypeId == currentProduct.petTypeId);
          }).toList();
          
          if (relatedProducts.isEmpty) return const SizedBox.shrink();
          
          relatedProducts.shuffle();
          final displayProducts = relatedProducts.take(5).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
                child: Text('More like this', style: AppTextStyles.h3),
              ),
              AppSizes.gapH16,
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
                  itemCount: displayProducts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: AppSizes.s16),
                      child: ProductCard(
                        product: displayProducts[index],
                        width: 160,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class RecommendedProductsSection extends StatelessWidget {
  final Product currentProduct;
  const RecommendedProductsSection({super.key, required this.currentProduct});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          final otherProducts = state.products
              .where((p) => p.id != currentProduct.id)
              .toList();
          
          if (otherProducts.isEmpty) return const SizedBox.shrink();
          
          otherProducts.shuffle();
          final displayProducts = otherProducts.take(4).toList();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Just For You', style: AppTextStyles.h3),
                AppSizes.gapH16,
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: displayProducts.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: displayProducts[index],
                    );
                  },
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
