import 'package:flutter/material.dart';
import 'package:divinepets/core/constants/app_colors.dart';
import 'package:divinepets/core/constants/app_sizes.dart';
import '../../../order/domain/entities/order_detail_entity.dart';

class BillingDetailsCard extends StatelessWidget {
  final OrderDetailEntity? order;
  final bool showTitle;
  final bool useCardStyle;

  const BillingDetailsCard({
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
            'Billing Details',
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
                  errorBuilder: (_, __, ___) => const Icon(Icons.person, size: 40, color: AppColors.primary),
                ),
              ),
            ),
            AppSizes.gapW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Billing Name', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500)),
                  Text(
                    order != null ? 'Customer #${order!.customerId}' : 'Asim Shrestha',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
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
                  const Text('Billing Address', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500)),
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
