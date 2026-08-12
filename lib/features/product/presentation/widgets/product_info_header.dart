import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/entities/product.dart';

class ProductInfoHeader extends StatelessWidget {
  final Product product;

  const ProductInfoHeader({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.secondarySoft.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            product.category,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.secondaryVariant,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
        AppSizes.gapH8,
        Text(
          product.name,
          style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        AppSizes.gapH8,
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 16),
            AppSizes.gapW4,
            Text(
              '${product.rating} (${product.reviewCount})',
              style: AppTextStyles.bodySmall,
            ),
          ],
        ),
        AppSizes.gapH8,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rs. ${product.price.toInt()}',
              style: AppTextStyles.h3.copyWith(color: AppColors.primary),
            ),
            if (product.oldPrice != null)
              Text(
                'Rs. ${product.oldPrice!.toInt()}',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textTertiary,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primaryLighter,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.local_shipping_outlined, color: AppColors.primary, size: 20),
              AppSizes.gapW8,
              Expanded(
                child: Text(
                  'Free delivery\nAbove Rs. 1000',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
