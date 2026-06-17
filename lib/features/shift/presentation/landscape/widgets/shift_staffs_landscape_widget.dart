import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spacing.dart';

class ShiftStaffsSection extends StatelessWidget {
  const ShiftStaffsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: isLight ? Colors.white : AppColors.blackGrey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Staff On Duty',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 24),

          _buildStaffRow(
            name: 'John Smith',
            position: 'Cashier',
            clockIn: '08:00 AM',
            icon: Icons.point_of_sale_rounded,
            color: Colors.blue,
          ),

          _buildDivider(),

          _buildStaffRow(
            name: 'Sarah Wilson',
            position: 'Waiter',
            clockIn: '08:15 AM',
            icon: Icons.room_service_rounded,
            color: Colors.green,
          ),

          _buildDivider(),

          _buildStaffRow(
            name: 'Michael Brown',
            position: 'Chef',
            clockIn: '07:45 AM',
            icon: Icons.restaurant_rounded,
            color: Colors.orange,
          ),

          _buildDivider(),

          _buildStaffRow(
            name: 'Emma Davis',
            position: 'Manager',
            clockIn: '07:30 AM',
            icon: Icons.manage_accounts_rounded,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildStaffRow({
    required String name,
    required String position,
    required String clockIn,
    required IconData icon,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: color,
              size: 22,
            ),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  position,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Clock In',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
              Text(
                clockIn,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: Colors.grey.withValues(alpha: 0.1),
    );
  }
}