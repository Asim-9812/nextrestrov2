import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';

class DashboardSummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final double? percentageChange;
  final String? comparisonLabel;
  final IconData icon;
  final Color? color;
  final VoidCallback? onShowChart;
  final VoidCallback? onExpand;
  final bool isExpanded;
  final bool isSmall;

  const DashboardSummaryCard({
    super.key,
    required this.title,
    required this.value,
    this.percentageChange,
    this.comparisonLabel,
    required this.icon,
    this.color,
    this.onShowChart,
    this.onExpand,
    this.isExpanded = false,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPositive = (percentageChange ?? 0) >= 0;
    final themeColor = color ?? AppColors.primary;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
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
            children: [
              // Icon with circular background
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: themeColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: themeColor, size: 32),
              ),
              const SizedBox(width: 12),
              // Value and Title
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Percentage change
                    if (percentageChange != null)
                      Row(
                        children: [
                          Icon(
                            isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                            size: 12,
                            color: isPositive ? Colors.green : Colors.red,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${percentageChange!.abs().toStringAsFixed(1)}%',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: isPositive ? Colors.green : Colors.red,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            comparisonLabel ?? 'vs yesterday',
                            style: const TextStyle(
                              fontSize: 9,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
