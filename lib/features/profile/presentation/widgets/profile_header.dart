import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../pages/edit_profile_page.dart';

class ProfileHeader extends StatelessWidget {
  final UserEntity user;
  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF2EEFF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              // Profile Image with Border
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary.withOpacity(0.2), width: 2),
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.primary,
                  foregroundImage: AssetImage('assets/images/profile.jpg'),
                  child: Icon(Icons.person, color: Colors.white, size: 40), // Fallback shows if image fails
                ),
              ),
              AppSizes.gapW16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName.isNotEmpty ? user.fullName : user.username,
                      style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                    const SizedBox(height: 4),
                    _buildInfoItem(Icons.phone_outlined, user.phone),
                    _buildInfoItem(Icons.email_outlined, user.email),
                    _buildInfoItem(Icons.location_on_outlined, user.branchName ?? 'N/A'),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfilePage()),
                );
              },
              child: Row(
                children: const [
                  Icon(Icons.edit, color: AppColors.primary, size: 16),
                  SizedBox(width: 4),
                  Text(
                    'Edit',
                    style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    if (text.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Icon(icon, size: 12, color: Colors.grey),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
