import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../notification/presentation/pages/notification_page.dart';
import '../../../order/presentation/pages/my_orders_page.dart';
import '../../../pets/presentation/pages/my_pets_page.dart';
import '../../../pets/presentation/widgets/profile_pets_section.dart';
import 'settings_page.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_orders_card.dart';
import '../widgets/profile_menu_section.dart';
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
    context.read<AuthBloc>().add(FetchProfileEvent());
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
                    if (user != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ProfileHeader(user: user),
                      )
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

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('My Pets', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const MyPetsPage()),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'View all',
                                      style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.w500),
                                    ),
                                    Icon(Icons.chevron_right, color: AppColors.primary, size: 14),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const ProfilePetsSection(),
                          AppSizes.gapH24,

                          const Text('Account', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 16),
                          const ProfileMenuSection(),
                          AppSizes.gapH24,

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
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            icon: const Icon(Icons.settings_outlined, color: Colors.black, size: 26),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationPage()),
              );
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.notifications_none_rounded, size: 28, color: Colors.black),
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
                    child: const Center(
                      child: Text(
                        '3',
                        style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold, height: 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
            color: const Color(0xFFF2EEFF),
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
