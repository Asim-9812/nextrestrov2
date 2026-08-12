import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ProfileOrdersCard extends StatelessWidget {
  const ProfileOrdersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildOrderItem(Icons.assignment_outlined, 'All Orders', '11'),
          _buildDivider(),
          _buildOrderItem(Icons.inventory_2_outlined, 'Processing', '8'),
          _buildDivider(),
          _buildOrderItem(Icons.local_shipping_outlined, 'Delivered', '8'),
          _buildDivider(),
          _buildOrderItem(Icons.close_rounded, 'Cancelled', '8'),
        ],
      ),
    );
  }

  Widget _buildOrderItem(IconData icon, String label, String count) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        Text(
          count,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 30,
      width: 0.5,
      color: Colors.grey.shade300,
    );
  }
}
