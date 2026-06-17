import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';

class DashboardSummaryCardPortrait extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String? comparison;

  const DashboardSummaryCardPortrait({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.comparison,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withValues(alpha: 0.1)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [color.withValues(alpha: 0.1), color.withValues(alpha: 0.05)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: Icon(icon, color: color, size: 14),
                  ),
                  if (comparison != null)
                    Text(
                      comparison!,
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: comparison!.startsWith('+') 
                            ? Colors.green 
                            : comparison!.startsWith('-') 
                                ? Colors.red 
                                : AppColors.grey,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    title,
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
      ),
    );
  }
}
