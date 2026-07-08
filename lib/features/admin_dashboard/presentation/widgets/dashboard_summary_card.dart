import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';

class DashboardSummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subValue;
  final double? percentageChange;
  final IconData icon;
  final VoidCallback? onShowChart;
  final VoidCallback? onExpand;
  final bool isExpanded;
  final bool isSmall;
  final Color? color;

  const DashboardSummaryCard({
    super.key,
    required this.title,
    required this.value,
    this.subValue,
    this.percentageChange,
    required this.icon,
    this.onShowChart,
    this.onExpand,
    this.isExpanded = false,
    this.isSmall = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPositive = (percentageChange ?? 0) >= 0;
    
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(isSmall ? 12 : 16),
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
                    padding: EdgeInsets.all(isSmall ? 6 : 8),
                    decoration: BoxDecoration(
                      color: (color ?? AppColors.primary).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(icon, color: color ?? AppColors.primary, size: isSmall ? 16 : 20),
                  ),
                  if (onShowChart != null)
                    IconButton(
                      onPressed: onShowChart,
                      icon: const Icon(Icons.bar_chart, size: 20, color: AppColors.grey),
                      tooltip: 'Show Chart',
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                ],
              ),
              if (!isSmall) const Spacer(),
              if (isSmall) const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: isSmall ? 12 : 14,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: isSmall ? 16 : 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
              if (percentageChange != null) ...[
                SizedBox(height: isSmall ? 4 : 8),
                Row(
                  children: [
                    Icon(
                      isPositive ? Icons.trending_up : Icons.trending_down,
                      size: isSmall ? 12 : 14,
                      color: isPositive ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${percentageChange!.abs().toStringAsFixed(1)}%',
                      style: TextStyle(
                        fontSize: isSmall ? 10 : 12,
                        fontWeight: FontWeight.w600,
                        color: isPositive ? Colors.green : Colors.red,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'vs prev.',
                      style: TextStyle(
                        fontSize: isSmall ? 8 : 10,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
        if (onExpand != null)
          Positioned(
            bottom: 12,
            right: 12,
            child: IconButton(
              onPressed: onExpand,
              icon: Icon(
                isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                size: 24,
                color: AppColors.white,
              ),
              tooltip: isExpanded ? 'Collapse' : 'Expand Breakdown',
              style: IconButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.all(4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
      ],
    );
  }
}
