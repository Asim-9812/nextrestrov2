import 'package:divinepets/features/dashboard/presentation/widgets/shop_by_pets.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ShopByPetsSection extends StatelessWidget {
  const ShopByPetsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Shop By Pets', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text('See all', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 13)),
                    Icon(Icons.chevron_right, color: AppColors.primary, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const ShopByPets()
      ],
    );
  }
}
