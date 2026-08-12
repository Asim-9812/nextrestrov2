import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/entities/product.dart';

class ProductReviewsSection extends StatelessWidget {
  final Product product;

  const ProductReviewsSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Ratings & Reviews (223)', style: AppTextStyles.h3),
        ),
        AppSizes.gapH16,
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          padding: const EdgeInsets.all(AppSizes.s16),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8FA),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Overall Rating Summary', style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600, color: Colors.black87)),
              AppSizes.gapH12,
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 20),
                  AppSizes.gapW8,
                  const Text(
                    '4.8 / 5',
                    style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
              AppSizes.gapH16,
              _buildRatingBar(5, 0.8),
              _buildRatingBar(4, 0.4),
              _buildRatingBar(3, 0.2),
              _buildRatingBar(2, 0.1),
              _buildRatingBar(1, 0.3),
            ],
          ),
        ),
        AppSizes.gapH24,
        _buildStaticReview('Sarah Thompsons', '2 days ago', '"My Golden Retriever absolutely loves this Food! His coat looks shinier, and he\'s been much more energetic since switching to Royal Canin."', 28),
        _buildStaticReview('Sarah Thompsons', '2 days ago', '"My Golden Retriever absolutely loves this Food! His coat looks shinier, and he\'s been much more energetic since switching to Royal Canin."', 28),
        _buildStaticReview('Sarah Thompsons', '2 days ago', '"My Golden Retriever absolutely loves this Food! His coat looks shinier, and he\'s been much more energetic since switching to Royal Canin."', 28),
        Center(
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'See more',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRatingBar(int stars, double percentage) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 25,
            child: Row(
              children: [
                Text('$stars', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(width: 2),
                const Icon(Icons.star, color: Colors.orange, size: 12),
              ],
            ),
          ),
          AppSizes.gapW8,
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: percentage,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFE985F)),
                minHeight: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaticReview(String name, String date, String comment, int helpful) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.all(AppSizes.s16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.black),
              ),
              Row(
                children: List.generate(5, (index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 16,
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            date,
            style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),
          ),
          AppSizes.gapH12,
          Text(
            comment,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 12,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          AppSizes.gapH12,
          Row(
            children: [
              const Icon(Icons.thumb_up_rounded, size: 14, color: Colors.black87),
              const SizedBox(width: 8),
              Text(
                '$helpful Helpful',
                style: const TextStyle(color: Colors.black87, fontSize: 11, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
