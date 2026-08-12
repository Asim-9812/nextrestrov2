import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/sample_products.dart';
import '../../../dashboard/presentation/widgets/product_card.dart';
import '../bloc/wishlist_bloc.dart';
import '../widgets/wishlist_item_tile.dart';

import 'package:divinepets/features/notification/presentation/pages/notification_page.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 16),
                  _buildHeroBanner(),
                AppSizes.gapH24,
                
                // List Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        '${state.items.length} Items',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.primary),
                      ),
                      const Spacer(),
                      _buildOutlineAction(Icons.share_outlined, 'Share Wishlist', Colors.grey.shade600, () {}),
                      const SizedBox(width: 12),
                      _buildOutlineAction(Icons.delete_outline_rounded, 'Clear All', Colors.redAccent, () {
                        context.read<WishlistBloc>().add(const ClearWishlist());
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                
                // Wishlist Items
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: state.items.isEmpty 
                    ? _buildEmptyState()
                    : Column(
                        children: state.items.map((product) => WishlistItemTile(product: product)).toList(),
                      ),
                ),
                
                AppSizes.gapH32,
                
                // Recommendations Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('You May Also Like', style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w800, fontSize: 16)),
                          const SizedBox(width: 6),
                          const Icon(Icons.pets, color: AppColors.primary, size: 16),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              'View All',
                              style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.chevron_right, color: AppColors.primary, size: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                
                // Horizontal Recommendations
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ProductCard(
                          product: sampleProducts[index + 17],
                          width: 160,
                          imageHeight: 110,
                        ),
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 120), // Bottom padding
              ],
            ),
          );
        },
      ),
    ));
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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'My Wishlist',
                      style: AppTextStyles.h3.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.pets, color: AppColors.primary, size: 20),
                  ],
                ),
                const Text(
                  'Your saved favorites ❤️',
                  style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          _buildNotificationIcon(context),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon(BuildContext context) {
    return GestureDetector(
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
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Icon(Icons.favorite_border_rounded, size: 80, color: Colors.grey.shade200),
          const SizedBox(height: 16),
          Text(
            'Your wishlist is empty',
            style: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF2EEFF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          // Illustration Placeholder
          Container(
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/dashboard_assets/pup.png', // Using pup.png as illustration
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'See something you love?',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  'Add more items to your wishlist and\nget notified when they\'re on sale!',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 10, height: 1.4),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_active_outlined, size: 16),
                  label: const Text('Price Drop Alerts', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: AppColors.primary, width: 0.5),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOutlineAction(IconData icon, String text, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 6),
            Text(
              text,
              style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
