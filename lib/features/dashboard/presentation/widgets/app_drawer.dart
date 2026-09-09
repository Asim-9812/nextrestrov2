import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/app_error_widget.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../../../notification/presentation/pages/notification_page.dart';
import '../../../order/presentation/pages/my_orders_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../../pets/presentation/pages/my_pets_page.dart';
import '../../../order/presentation/bloc/order_bloc.dart';
import '../../../order/presentation/bloc/order_state.dart';
import '../../../order/domain/entities/order_entity.dart';

class AppDrawer extends StatelessWidget {
  final Function(int)? onNavigate;
  const AppDrawer({super.key, this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [

          // Header with Logo
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: const BoxDecoration(
              color: Color(0xFFF2EEFF), // Light purple background
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: AppLogo(size: 32, pawColor: Colors.white),
            ),
          ),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              children: [
                // Profile Section
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    if (onNavigate != null) {
                      onNavigate!(3); // Navigate to Profile tab
                    }
                  },
                  child: _buildProfileSection(),
                ),
                AppSizes.gapH24,
                
                // My Orders Section
                _buildOrdersSection(context),
                AppSizes.gapH24,
                
                // Main Menu
                _buildDrawerItem(
                  FontAwesomeIcons.paw, 
                  'Your Pets', 
                  onTap: () {
                    Navigator.pop(context); // Close drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyPetsPage()),
                    );
                  },
                ),
                _buildDrawerItem(Icons.grid_view_rounded, 'Categories', onTap: () {}),
                _buildDrawerItem(FontAwesomeIcons.tag, 'Brands', onTap: () {}),
                _buildDrawerItem(FontAwesomeIcons.percent, 'Deals & Offers', onTap: () {}),
                
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Divider(color: Color(0xFFEEEEEE)),
                ),
                
                // Secondary Menu
                _buildDrawerItem(
                  Icons.notifications_rounded, 
                  'Notifications', 
                  badgeCount: 2, 
                  onTap: () {
                    Navigator.pop(context); // Close drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationPage()),
                    );
                  },
                ),
                _buildDrawerItem(Icons.headset_mic_rounded, 'Help & Support', onTap: () {}),
                _buildDrawerItem(FontAwesomeIcons.circleQuestion, 'FAQs', onTap: () {}),
                _buildDrawerItem(Icons.info_rounded, 'About Us', onTap: () {}),
                _buildDrawerItem(
                  Icons.error_outline_rounded, 
                  'Error Page', 
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AppErrorWidget()),
                    );
                  },
                ),
                
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Divider(color: Color(0xFFEEEEEE)),
                ),
                
                // Logout
                _buildLogoutItem(context),
                AppSizes.gapH24,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F3FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.primary,
            foregroundImage: AssetImage('assets/images/profile.jpg'),
            child: Icon(Icons.person, color: Colors.white, size: 25),
          ),
          AppSizes.gapW12,
          Text(
            'Hi, Asim',
            style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Colors.black, size: 24),
        ],
      ),
    );
  }

  Widget _buildOrdersSection(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        int pendingCount = 0;
        int confirmedCount = 0;
        int shippedCount = 0;
        int deliveredCount = 0;
        int cancelledCount = 0;

        if (state is OrderLoaded) {
          pendingCount = state.orders.where((o) => o.status == OrderStatus.pending).length;
          confirmedCount = state.orders.where((o) => o.status == OrderStatus.confirmed).length;
          shippedCount = state.orders.where((o) => o.status == OrderStatus.shipped).length;
          deliveredCount = state.orders.where((o) => o.status == OrderStatus.delivered).length;
          cancelledCount = state.orders.where((o) => o.status == OrderStatus.cancelled).length;
        }

        return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color(0xFFF6F3FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Orders',
                    style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyOrdersPage()),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'See all',
                          style: AppTextStyles.bodySmall.copyWith(color: Colors.grey.shade600, fontSize: 11),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey.shade600, size: 14),
                      ],
                    ),
                  ),
                ],
              ),
              AppSizes.gapH16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOrderStatusItem(context, Icons.hourglass_empty_rounded, 'Pending', pendingCount),
                  _buildOrderStatusItem(context, Icons.check_circle_outline_rounded, 'Confirmed', confirmedCount),
                  _buildOrderStatusItem(context, FontAwesomeIcons.truck, 'Shipped', shippedCount),
                  _buildOrderStatusItem(context, FontAwesomeIcons.bagShopping, 'Delivered', deliveredCount),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOrderStatusItem(BuildContext context, IconData icon, String label, int badgeCount) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); // Close drawer
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyOrdersPage()),
        );
      },
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(icon, size: 22, color: Colors.black),
              Positioned(
                right: -6,
                top: -6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    badgeCount.toString(),
                    style: const TextStyle(
                      color: Colors.white, 
                      fontSize: 10, 
                      fontWeight: FontWeight.bold,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(fontSize: 10, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, {int? badgeCount, required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: AppColors.primary, size: 22),
      title: Text(
        title,
        style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (badgeCount != null)
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                badgeCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      visualDensity: const VisualDensity(vertical: -2),
    );
  }

  Widget _buildLogoutItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AuthBloc>().add(LogoutEvent());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF2EEFF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.logout_rounded, color: Colors.black, size: 22),
            AppSizes.gapW12,
            Text(
              'Logout',
              style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
