import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final int strength; // 0 to 5

  const PasswordStrengthIndicator({
    super.key,
    required this.strength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7FC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.shield_outlined,
            color: AppColors.primary,
            size: 24,
          ),
          AppSizes.gapW12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Password strength',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      _getStrengthText(),
                      style: AppTextStyles.bodySmall.copyWith(
                        color: _getStrengthColor(),
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                AppSizes.gapH8,
                Row(
                  children: List.generate(5, (index) {
                    return Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          right: index == 4 ? 0 : 4,
                        ),
                        height: 6,
                        decoration: BoxDecoration(
                          color: index < strength
                              ? _getStrengthColor()
                              : AppColors.textQuaternary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStrengthColor() {
    if (strength <= 2) return const Color(0xFFFF8A4C); // Orange/Medium
    if (strength <= 3) return Colors.orange;
    return AppColors.accentSuccess;
  }

  String _getStrengthText() {
    if (strength <= 2) return 'Medium';
    if (strength <= 3) return 'Strong';
    return 'Very Strong';
  }
}
