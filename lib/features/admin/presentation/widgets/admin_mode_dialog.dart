import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/services/admin_mode_service.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../dashboard/presentation/pages/main_navigation_page.dart';
import '../pages/admin_dashboard_page.dart';

class AdminModeDialog extends StatefulWidget {
  final UserEntity user;

  const AdminModeDialog({super.key, required this.user});

  static Future<void> show(BuildContext context, UserEntity user) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) => AdminModeDialog(user: user),
    );
  }

  @override
  State<AdminModeDialog> createState() => _AdminModeDialogState();
}

class _AdminModeDialogState extends State<AdminModeDialog> {
  bool _rememberChoice = true;

  void _selectMode(String mode) async {
    if (_rememberChoice) {
      await AdminModeService.setPreferredMode(mode);
    }

    if (!mounted) return;
    Navigator.of(context).pop();

    if (mode == 'admin') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const AdminDashboardPage()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainNavigationPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      elevation: 8,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Icon & Title
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primarySoft,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.admin_panel_settings_rounded,
                    color: AppColors.primary,
                    size: 28,
                  ),
                ),
                AppSizes.gapW16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Admin!',
                        style: AppTextStyles.h3.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        widget.user.fullName.isNotEmpty
                            ? widget.user.fullName
                            : widget.user.username,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppSizes.gapH24,

            Text(
              'Select how you would like to proceed into Divine Pets:',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            AppSizes.gapH24,

            // Option 1: Admin Portal
            _buildOptionCard(
              title: 'Admin Portal',
              subtitle: 'Manage orders, inventory & store metrics',
              icon: Icons.dashboard_rounded,
              color: AppColors.primary,
              backgroundColor: const Color(0xFFF0F7FC),
              onTap: () => _selectMode('admin'),
            ),
            AppSizes.gapH12,

            // Option 2: Customer Storefront
            _buildOptionCard(
              title: 'Customer Storefront',
              subtitle: 'Browse store & shop as a pet owner',
              icon: Icons.storefront_rounded,
              color: const Color(0xFFFF782C),
              backgroundColor: const Color(0xFFFFF4EE),
              onTap: () => _selectMode('customer'),
            ),
            AppSizes.gapH16,

            // Remember choice checkbox
            Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: _rememberChoice,
                    activeColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onChanged: (val) {
                      setState(() {
                        _rememberChoice = val ?? true;
                      });
                    },
                  ),
                ),
                AppSizes.gapW8,
                Expanded(
                  child: Text(
                    'Remember my preference for next time',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            AppSizes.gapW16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: color, size: 16),
          ],
        ),
      ),
    );
  }
}
