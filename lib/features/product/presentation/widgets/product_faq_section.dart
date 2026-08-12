import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/entities/product.dart';

class ProductFAQSection extends StatelessWidget {
  final List<ProductFAQ> faqs;

  const ProductFAQSection({super.key, required this.faqs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('FAQs', style: AppTextStyles.h3),
        ),
        AppSizes.gapH16,
        _buildStaticFAQ(1, 'Is this food suitable for all dog breeds?', 'This formula is specially designed for large breed adult dogs (26-44 kg) aged 15 months to 5 years. For smaller breeds or puppies, choose a formula made for their size and life stage.'),
        _buildStaticFAQ(2, 'How should I store this dog food?', 'Keep the bag in a cool, dry place. Once opened, ensure the bag is tightly sealed or transfer the contents to an airtight container to maintain freshness and prevent pests.'),
        _buildStaticFAQ(3, 'What are the main ingredients?', 'The primary ingredients include real beef, whole grain corn, poultry by-product meal, and beet pulp for fiber. It is also enriched with essential vitamins (A, D3, E) and minerals.'),
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

  Widget _buildStaticFAQ(int index, String question, String answer) {
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
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$index',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              AppSizes.gapW12,
              Expanded(
                child: Text(
                  question,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          AppSizes.gapH12,
          const Divider(color: Colors.white, height: 1, thickness: 1),
          AppSizes.gapH12,
          Text(
            answer,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 11,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
