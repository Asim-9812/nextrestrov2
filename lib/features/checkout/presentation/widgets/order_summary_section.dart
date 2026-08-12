import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          AppSizes.gapH16,
          _buildSummaryRow('Subtotal (3 items)', 'Rs. 3900'),
          _buildSummaryRow('Discount', 'Rs. 300', valueColor: AppColors.accentSuccess),
          _buildSummaryRow(
            'Delivery Fee', 
            'Rs. 100', 
            trailingIcon: Icons.info_outline,
          ),
          const Divider(height: 32, thickness: 0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text('Inclusive of all taxes', style: TextStyle(color: Colors.grey, fontSize: 10)),
                ],
              ),
              Text(
                'Rs. 4,300',
                style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.primary, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {Color? valueColor, IconData? trailingIcon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(label, style: const TextStyle(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w500)),
              if (trailingIcon != null) ...[
                const SizedBox(width: 4),
                Icon(trailingIcon, size: 14, color: Colors.black54),
              ],
            ],
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.black, 
              fontWeight: FontWeight.bold, 
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
