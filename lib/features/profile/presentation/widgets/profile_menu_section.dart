import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../pages/edit_profile_page.dart';
import '../../../pets/presentation/pages/my_pets_page.dart';
import '../../../wishlist/presentation/pages/wishlist_page.dart';

class ProfileMenuSection extends StatelessWidget {
  const ProfileMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA), // Light grey background
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _buildMenuTile(context, Icons.person_rounded, 'Personal Information'),
          _buildDivider(),
          _buildMenuTile(context, Icons.location_on_rounded, 'Addresses'),
          _buildDivider(),
          _buildMenuTile(context, Icons.payment_rounded, 'Payment Methods'),
          _buildDivider(),
          _buildMenuTile(context, Icons.favorite_rounded, 'Wishlist'),
          _buildDivider(),
          _buildMenuTile(context, Icons.star_rounded, 'My Reviews'),
          _buildDivider(),
          _buildMenuTile(context, Icons.track_changes_rounded, 'Track Your Pet'),
        ],
      ),
    );
  }

  Widget _buildMenuTile(BuildContext context, IconData icon, String title) {
    return ListTile(
      onTap: () {
        if (title == 'Personal Information' || title == 'Addresses') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EditProfilePage()),
          );
        } else if (title == 'Wishlist') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WishlistPage()),
          );
        } else if (title == 'Track Your Pet') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyPetsPage()),
          );
        }
      },
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.primary, size: 18),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.black, size: 20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      visualDensity: const VisualDensity(vertical: -1),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, thickness: 0.5, indent: 60, color: Colors.white);
  }
}
