import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';

class DashboardSummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subValue;
  final double? percentageChange;
  final IconData icon;
  final VoidCallback onShowChart;
  final Color? color;

  const DashboardSummaryCard({
    super.key,
    required this.title,
    required this.value,
    this.subValue,
    this.percentageChange,
    required this.icon,
    required this.onShowChart,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPositive = (percentageChange ?? 0) >= 0;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (color ?? AppColors.primary).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color ?? AppColors.primary, size: 20),
              ),
              IconButton(
                onPressed: onShowChart,
                icon: const Icon(Icons.bar_chart, size: 20, color: AppColors.grey),
                tooltip: 'Show Chart',
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          if (percentageChange != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  isPositive ? Icons.trending_up : Icons.trending_down,
                  size: 14,
                  color: isPositive ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 4),
                Text(
                  '${percentageChange!.abs().toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isPositive ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  'vs prev.',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
