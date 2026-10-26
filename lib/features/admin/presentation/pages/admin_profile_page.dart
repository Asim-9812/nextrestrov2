import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/services/admin_mode_service.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../dashboard/presentation/pages/main_navigation_page.dart';

class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        String name = 'Administrator';
        String username = 'admin';
        String email = 'admin@divinepets.com';
        String role = 'System Admin';

        if (state is Authenticated) {
          name = state.user.fullName.isNotEmpty ? state.user.fullName : state.user.username;
          username = state.user.username;
          email = state.user.email;
          role = state.user.role ?? 'Administrator';
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Profile Header Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, Color(0xFF1E3A8A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.admin_panel_settings, color: AppColors.primary, size: 48),
                    ),
                    AppSizes.gapH12,
                    Text(
                      name,
                      style: AppTextStyles.h3.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '@$username • $email',
                      style: AppTextStyles.bodySmall.copyWith(color: Colors.white70),
                    ),
                    AppSizes.gapH12,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.verified, color: Colors.amber, size: 16),
                          AppSizes.gapW8,
                          Text(
                            role,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AppSizes.gapH24,

              // Quick Actions
              _buildSectionTitle('Portal Actions'),
              AppSizes.gapH12,

              // Switch to Customer View button
              _buildActionCard(
                context,
                icon: Icons.storefront_rounded,
                iconColor: const Color(0xFFFF782C),
                title: 'Switch to Customer Storefront',
                subtitle: 'Browse store and manage app as a regular customer',
                onTap: () async {
                  await AdminModeService.setPreferredMode('customer');
                  if (!context.mounted) return;
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const MainNavigationPage()),
                    (route) => false,
                  );
                },
              ),
              AppSizes.gapH12,
              // System Logs
              _buildActionCard(
                context,
                icon: Icons.history_rounded,
                iconColor: AppColors.primary,
                title: 'Audit Logs & Activity',
                subtitle: 'View recent admin operations and system logs',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Audit Logs page placeholder')),
                  );
                },
              ),
              AppSizes.gapH12,

              // Logout Button
              _buildActionCard(
                context,
                icon: Icons.logout_rounded,
                iconColor: Colors.red,
                title: 'Logout Admin Session',
                subtitle: 'Sign out safely from Divine Pets',
                onTap: () {
                  context.read<AuthBloc>().add(LogoutEvent());
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEEEEEE)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        title: Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.textTertiary, fontSize: 11),
        ),
        trailing: const Icon(Icons.chevron_right, color: AppColors.textTertiary),
      ),
    );
  }
}
