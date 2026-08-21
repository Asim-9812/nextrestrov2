import 'package:flutter/material.dart';
import 'package:divinepets/core/constants/app_colors.dart';
import 'package:divinepets/core/constants/app_sizes.dart';
import '../../../order/domain/entities/order_detail_entity.dart';

class DeliveryDetailsCard extends StatelessWidget {
  final OrderDetailEntity? order;
  final bool showTitle;
  final bool useCardStyle;

  const DeliveryDetailsCard({
    super.key, 
    this.order,
    this.showTitle = true,
    this.useCardStyle = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle) ...[
          const Text(
            'Delivery Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 20),
        ],
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/profile.jpg', 
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.delivery_dining, size: 40, color: AppColors.primary),
                ),
              ),
            ),
            AppSizes.gapW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Delivery Partner', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500)),
                  const Text(
                    'Nepal Can Move',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chat_bubble_outline, color: AppColors.primary, size: 20),
            const SizedBox(width: 12),
            const Icon(Icons.phone_outlined, color: AppColors.primary, size: 20),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.location_on_outlined, color: AppColors.primary, size: 22),
            ),
            AppSizes.gapW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Delivery Address', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500)),
                  Text(
                    order != null ? 'Kathmandu, Nepal' : 'Asan, Kathmandu - 27',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    order != null ? 'Bagmati Province\nNepal' : 'Kathmandu, Bagmati Province\nNepal',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 11, height: 1.4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );

    if (!useCardStyle) return content;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: content,
    );
  }
}
