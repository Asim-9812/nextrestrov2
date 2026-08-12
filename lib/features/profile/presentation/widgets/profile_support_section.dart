import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ProfileSupportSection extends StatelessWidget {
  const ProfileSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildSupportTile(Icons.history_rounded, 'Returns & Refunds')),
            const SizedBox(width: 16),
            Expanded(child: _buildSupportTile(Icons.headset_mic_rounded, 'Help Center')),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildSupportTile(Icons.description_rounded, 'Terms & Conditions')),
            const SizedBox(width: 16),
            Expanded(child: _buildSupportTile(Icons.policy_rounded, 'Return Policy')),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildSupportTile(Icons.security_rounded, 'Privacy Policy')),
            const SizedBox(width: 16),
            Expanded(child: _buildSupportTile(Icons.info_rounded, 'About Divine Pets')),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildSupportTile(Icons.share_rounded, 'Invite Friends')),
            const SizedBox(width: 16),
            Expanded(child: _buildSupportTile(Icons.star_outline_rounded, 'Rate our App')),
          ],
        ),
      ],
    );
  }

  Widget _buildSupportTile(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.primary, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
