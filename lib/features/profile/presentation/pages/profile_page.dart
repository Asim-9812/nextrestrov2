import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/services/admin_mode_service.dart';
import '../../../admin/presentation/pages/admin_dashboard_page.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../notification/presentation/pages/notification_page.dart';
import '../../../notification/presentation/bloc/notification_bloc.dart';
import '../../../notification/presentation/bloc/notification_state.dart';
import '../../../order/presentation/pages/my_orders_page.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_orders_card.dart';
import '../widgets/profile_support_section.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is! ProfileLoaded) {
      context.read<AuthBloc>().add(FetchProfileEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final user = (state is Authenticated) ? state.user : (state is ProfileLoaded ? state.user : null);

            return RefreshIndicator(
              onRefresh: () async {
                context.read<AuthBloc>().add(FetchProfileEvent());
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 10),
                    if (user != null) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ProfileHeader(user: user),
                      ),
                      if (user.isAdmin) ...[
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: _buildAdminPortalButton(context),
                        ),
                      ],
                    ]
                    else if (state is AuthLoading)
                      const Center(child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircularProgressIndicator(),
                      )),
                    
                    AppSizes.gapH24,
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('My Orders', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const MyOrdersPage()),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'View all orders',
                                      style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.w500),
                                    ),
                                    Icon(Icons.chevron_right, color: AppColors.primary, size: 14),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const ProfileOrdersCard(),
                          AppSizes.gapH24,

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     const Text('My Pets', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          //     GestureDetector(
                          //       onTap: () {
                          //         Navigator.push(
                          //           context,
                          //           MaterialPageRoute(builder: (context) => const MyPetsPage()),
                          //         );
                          //       },
                          //       child: Row(
                          //         children: [
                          //           Text(
                          //             'View all',
                          //             style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.w500),
                          //           ),
                          //           Icon(Icons.chevron_right, color: AppColors.primary, size: 14),
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(height: 16),
                          // const ProfilePetsSection(),
                          // AppSizes.gapH24,

                          // const Text('Account', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          // const SizedBox(height: 16),
                          // const ProfileMenuSection(),
                          // AppSizes.gapH24,

                          const Text('Supports & Others', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 16),
                          const ProfileSupportSection(),

                          const SizedBox(height: 16),
                          _buildLogoutButton(context),
                          const SizedBox(height: 120),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Profile',
                  style: AppTextStyles.h3.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  'Manage your account and pets',
                  style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const SettingsPage()),
          //     );
          //   },
          //   icon: const Icon(Icons.settings_outlined, color: Colors.black, size: 26),
          //   padding: EdgeInsets.zero,
          //   constraints: const BoxConstraints(),
          // ),
          // const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationPage()),
              );
            },
            child: BlocBuilder<NotificationBloc, NotificationState>(
              builder: (context, state) {
                int count = 0;
                if (state is NotificationLoaded) {
                  count = state.unreadCount;
                }
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Icons.notifications_none_rounded, size: 28, color: Colors.black),
                    if (count > 0)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF782C),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                          child: Center(
                            child: Text(
                              '$count',
                              style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold, height: 1),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdminPortalButton(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7FC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: () async {
          final navigator = Navigator.of(context);
          await AdminModeService.setPreferredMode('admin');
          if (!mounted) return;
          navigator.pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const AdminDashboardPage()),
            (route) => false,
          );
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.admin_panel_settings_rounded, color: Colors.white, size: 22),
        ),
        title: const Text(
          'Switch to Admin Portal',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.primary),
        ),
        subtitle: const Text(
          'Manage orders, inventory, and portal analytics',
          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.primary, size: 16),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: ListTile(
        onTap: () {
          context.read<AuthBloc>().add(LogoutEvent());
        },
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primarySoft,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.logout_rounded, color: AppColors.primary, size: 20),
        ),
        title: const Text(
          'Logout',
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
