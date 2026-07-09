import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/admin_dashboard/data/models/dashboard_summary_model.dart';

class TopSellingSection extends StatelessWidget {
  final List<TopSellingProduct> products;
  final List<TopSellingCategory> categories;
  final bool isPortrait;

  const TopSellingSection({
    super.key,
    required this.products,
    required this.categories,
    this.isPortrait = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isPortrait) {
      return Column(
        children: [
          _buildProductCard(),
          const SizedBox(height: 24),
          _buildCategoryPlaceholder(),
        ],
      );
    }

    return _buildProductCard();
  }

  Widget _buildProductCard() {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Selling Items',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 24),
          if (products.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Text('No data available', style: TextStyle(color: AppColors.grey)),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length > 5 ? 5 : products.length,
              separatorBuilder: (context, index) => const Divider(height: 16),
              itemBuilder: (context, index) {
                final product = products[index];
                return Row(
                  children: [
                    // Circular Index
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.ashGrey.withValues(alpha: 0.3),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Product Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/momo.jpg',
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 48,
                          height: 48,
                          color: AppColors.lightGrey,
                          child: const Icon(Icons.image, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Name and quantity
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.productName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            '${product.quantitySold} plates',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Price
                    Text(
                      'Rs. ${product.totalSales.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildCategoryPlaceholder() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 40),
          Center(
            child: Column(
              children: [
                Icon(Icons.category_outlined, size: 48, color: AppColors.lightGrey),
                SizedBox(height: 16),
                Text(
                  'Category data coming soon',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
