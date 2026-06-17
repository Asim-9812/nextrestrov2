import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spacing.dart';



import 'package:flutter/material.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spacing.dart';

class ShiftSummaryStats extends StatelessWidget {
  final ShiftModel shift;
  final List<GroupedOrder> orders;
  const ShiftSummaryStats({super.key, required this.shift, required this.orders});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    final startTime = DateTime.tryParse(shift.openingTime ?? '');
    final endTime = DateTime.tryParse(shift.closingTime ?? '') ?? DateTime.now();
    String duration = 'N/A';
    if (startTime != null) {
      final diff = endTime.difference(startTime);
      duration = '${diff.inHours}h ${diff.inMinutes % 60}m';
    }

    final totalOrders = orders.length;
    final totalAmount = shift.totalSales;
    final avgOrderValue = totalOrders > 0 ? totalAmount / totalOrders : 0.0;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: isLight ? Colors.white : AppColors.blackGrey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shift Summary',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 24),

          _buildSummaryRow(
            'Shift Duration',
            duration,
            'Total time',
            Icons.access_time_rounded,
            Colors.orange,
          ),
          _buildSummaryRow(
            'Average Order Value',
            'Rs. ${avgOrderValue.toStringAsFixed(2)}',
            'Per transaction',
            Icons.analytics_rounded,
            Colors.green,
          ),
          _buildSummaryRow(
            'No. of Orders',
            totalOrders.toString(),
            'Total orders',
            Icons.assignment_rounded,
            Colors.purple,
          ),
          _buildSummaryRow(
            'Staff on Duty',
            '8', // Static as requested
            'Active staff',
            Icons.people_rounded,
            Colors.orange,
          ),
        ],
      ),
    );
  }


// Existing _buildSummaryRow method stays the same
  Widget _buildSummaryRow(String label, String value, String desc, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(icon, color: color.withValues(alpha: 0.7), size: 22),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                Text(desc, style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
              ],
            ),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        ],
      ),
    );
  }
}