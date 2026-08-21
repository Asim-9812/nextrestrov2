import 'package:divinepets/features/pets/presentation/pages/pet_edit_page.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../widgets/pet_selector_card.dart';
import '../widgets/pet_tab_nav.dart';
import '../widgets/pet_overview_header.dart';
import '../widgets/pet_health_overview.dart';
import '../widgets/pet_reminders_list.dart';
import '../widgets/pet_support_banner.dart';

class MyPetsPage extends StatefulWidget {
  const MyPetsPage({super.key});

  @override
  State<MyPetsPage> createState() => _MyPetsPageState();
}

class _MyPetsPageState extends State<MyPetsPage> {
  int _selectedPetIndex = 0;
  String _activeTab = 'Overview';

  final List<Map<String, dynamic>> _pets = [
    {
      'name': 'Bruno',
      'breed': 'Golden Retriever',
      'age': '2 Years, 4 Months',
      'gender': 'Male',
      'image': 'assets/images/dashboard_assets/pup.png',
    },
    {
      'name': 'Milo',
      'breed': 'Persian Cat',
      'age': '1 Year, 2 Months',
      'gender': 'Female',
      'image': 'assets/images/dashboard_assets/catshop.png',
    },
    {
      'name': 'Luna',
      'breed': 'Shih Tzu',
      'age': '3 Years, 1 Month',
      'gender': 'Female',
      'image': 'assets/images/dashboard_assets/pup.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'My Pets',
                  style: AppTextStyles.h2.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.pets, color: AppColors.primary, size: 18),
              ],
            ),
            Text(
              'Your furry family members',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PetEditPage()),
              );
            },
            icon: const Icon(Icons.add_circle_outline, color: AppColors.primary, size: 20),
            label: const Text(
              'Add Pet',
              style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Pet Selector List
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _pets.length + 1,
                itemBuilder: (context, index) {
                  if (index == _pets.length) {
                    return const AddPetCard();
                  }
                  return PetSelectorCard(
                    pet: _pets[index],
                    isSelected: _selectedPetIndex == index,
                    onTap: () => setState(() => _selectedPetIndex = index),
                  );
                },
              ),
            ),
            AppSizes.gapH24,
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pet Details Content
                  PetOverviewHeader(pet: _pets[_selectedPetIndex]),
                  AppSizes.gapH24,
                  // Horizontal Tab Navigation
                  PetTabNav(
                    activeTab: _activeTab,
                    onTabChanged: (tab) => setState(() => _activeTab = tab),
                  ),
                ],
              ),
            ),
            AppSizes.gapH32,
            
            // Health Overview
            const PetHealthOverview(),
            AppSizes.gapH32,
            
            // Reminders Section
            const PetRemindersList(),
            AppSizes.gapH32,
            
            // Support Banner
            const PetSupportBanner(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
