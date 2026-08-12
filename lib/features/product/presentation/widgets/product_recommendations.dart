import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/sample_products.dart';
import '../../../dashboard/presentation/widgets/product_card.dart';

class RelatedProductsSection extends StatelessWidget {
  const RelatedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
          child: Text('More like this', style: AppTextStyles.h3),
        ),
        AppSizes.gapH16,
        SizedBox(
          height: 240, // Increased height to prevent overflow
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: AppSizes.s16),
                child: ProductCard(
                  product: sampleProducts[index + 9],
                  width: 160,
                  showBadge: index == 1,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class RecommendedProductsSection extends StatelessWidget {
  const RecommendedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemCount: 4,
            itemBuilder: (context, index) {
              return ProductCard(
                product: sampleProducts[index + 13],
                showBadge: index == 1 || index == 2,
              );
            },
          ),
        ],
      ),
    );
  }
}
