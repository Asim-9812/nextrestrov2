import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class DeliveryDetailsSection extends StatefulWidget {
  const DeliveryDetailsSection({super.key});

  @override
  State<DeliveryDetailsSection> createState() => _DeliveryDetailsSectionState();
}

class _DeliveryDetailsSectionState extends State<DeliveryDetailsSection> {
  int _selectedMethodIndex = 0; // 0 for Standard, 1 for Express

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
          Row(
            children: const [
              Icon(Icons.local_shipping, color: AppColors.primary, size: 20),
              SizedBox(width: 8),
              Text(
                'Delivery Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.primary),
              ),
            ],
          ),
          AppSizes.gapH16,
          _buildMethodTile(
            index: 0,
            title: 'Standard Delivery',
            duration: '(1-3 days)',
            description: 'Doorstep delivery via delivery partners',
            price: 'FREE',
            priceColor: AppColors.accentSuccess,
          ),
          _buildMethodTile(
            index: 1,
            title: 'Express Delivery',
            duration: '(Same day)',
            description: 'Delivered before 2PM (Kathmandu Valley)',
            price: 'Rs. 199',
            priceColor: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildMethodTile({
    required int index,
    required String title,
    required String duration,
    required String description,
    required String price,
    required Color priceColor,
  }) {
    final isSelected = _selectedMethodIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedMethodIndex = index),
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF7F8FA) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.grey.shade100),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: AppColors.primary,
              size: 18,
            ),
            AppSizes.gapW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(text: title),
                        const TextSpan(text: ' '),
                        TextSpan(text: duration, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: TextStyle(color: priceColor, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
