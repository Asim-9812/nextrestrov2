import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class PetTabNav extends StatelessWidget {
  final String activeTab;
  final Function(String) onTabChanged;

  const PetTabNav({
    super.key,
    required this.activeTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F3FF),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem('Overview', Icons.grid_view_rounded),
          _buildNavItem('Health', Icons.favorite_outline_rounded),
          _buildNavItem('History', Icons.assignment_outlined),
          _buildNavItem('Gallery', Icons.image_outlined),
          _buildNavItem('Profile', Icons.person_outline_rounded),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, IconData icon) {
    final bool isActive = activeTab == label;
    return GestureDetector(
      onTap: () => onTabChanged(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? AppColors.primary : Colors.grey.shade400,
              size: 22,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                color: isActive ? AppColors.primary : Colors.grey.shade400,
              ),
            ),
            if (isActive)
              Container(
                margin: const EdgeInsets.only(top: 2),
                height: 4,
                width: 4,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
