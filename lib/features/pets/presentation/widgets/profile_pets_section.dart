import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../pages/my_pets_page.dart';
import '../pages/pet_edit_page.dart';

class ProfilePetsSection extends StatelessWidget {
  const ProfilePetsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildPetCard(context),
          const SizedBox(width: 16),
          _buildAddPetCard(context),
        ],
      ),
    );
  }

  Widget _buildPetCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyPetsPage()),
        );
      },
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade100),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                'assets/images/dashboard_assets/dogshop.png',
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Daisy', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  Text('Dog', style: TextStyle(color: Colors.grey, fontSize: 9)),
                  Text('2 years 3 months', style: TextStyle(color: Colors.grey, fontSize: 8)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddPetCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PetEditPage()),
        );
      },
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: AppColors.primarySoft,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary.withOpacity(0.1)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: AppColors.primary, size: 24),
            ),
            const SizedBox(height: 12),
            const Text('Add new pet', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
