import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class FreeDeliveryBanner extends StatelessWidget {
  final double currentTotal;
  final double threshold;

  const FreeDeliveryBanner({
    super.key,
    required this.currentTotal,
    this.threshold = 1500,
  });

  @override
  Widget build(BuildContext context) {
    final remaining = threshold - currentTotal;
    final progress = (currentTotal / threshold).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2EEFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.local_shipping_outlined, color: AppColors.primary, size: 20),
              ),
              AppSizes.gapW12,
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                    children: [
                      const TextSpan(text: "You're "),
                      TextSpan(
                        text: "Rs. ${remaining > 0 ? remaining.toInt() : 0} ",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: "away from "),
                      const TextSpan(
                        text: "FREE delivery!",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Stack(
            children: [
              Container(
                height: 8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    height: 8,
                    width: constraints.maxWidth * progress,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rs. ${currentTotal.toInt()}', style: TextStyle(color: Colors.grey.shade600, fontSize: 10)),
              Text('Free Delivery', style: TextStyle(color: Colors.grey.shade600, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}
