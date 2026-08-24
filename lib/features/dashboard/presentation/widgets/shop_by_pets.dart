import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/sample_data.dart';
import '../../../pet_type/domain/entities/pet_type_entity.dart';
import '../../../pet_type/presentation/bloc/pet_type_bloc.dart';
import '../../../pet_type/presentation/bloc/pet_type_state.dart';
import '../../../pet_type/presentation/pages/pet_type_products_page.dart';

class ShopByPets extends StatelessWidget {
  const ShopByPets({super.key});

  IconData _getPetIcon(String type) {
    switch (type.toLowerCase()) {
      case 'dog':
        return FontAwesomeIcons.dog;
      case 'cat':
        return FontAwesomeIcons.cat;
      case 'bird':
        return FontAwesomeIcons.dove;
      case 'fish':
        return FontAwesomeIcons.fish;
      case 'rabbit':
        return Icons.cruelty_free_rounded;
      case 'hamster':
        return Icons.pets_rounded;
      case 'turtle':
        return Icons.eco_rounded;
      default:
        return Icons.pets_rounded;
    }
  }

  Color _getPetColor(int index) {
    final List<Color> colors = [
      const Color(0xFFEEE7FF), // Lavender
      const Color(0xFFFFEAF2), // Soft Pink
      const Color(0xFFE8F9F1), // Mint
      const Color(0xFFE0F2FE), // Sky Blue
      const Color(0xFFFFF4EB), // Peach
      const Color(0xFFFFECEB), // Rose
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetTypeBloc, PetTypeState>(
      builder: (context, state) {
        if (state is PetTypeLoading) {
          return const SizedBox(
            height: 110,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        List<PetTypeEntity> displayTypes = [];
        if (state is PetTypeLoaded) {
          displayTypes = state.petTypes;
        } else {
          displayTypes = samplePetTypes;
        }

        if (displayTypes.isEmpty) return const SizedBox.shrink();

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: List.generate(displayTypes.length, (index) {
              final petType = displayTypes[index];
              
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PetTypeProductsPage(petType: petType),
                      ),
                    );
                  },
                  child: PetCategoryCard(
                    title: '${petType.petTypeName} Items',
                    subtitle: '150+ items',
                    icon: _getPetIcon(petType.petTypeName),
                    color: _getPetColor(index),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

class PetCategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const PetCategoryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24), // Smoother corners
      ),
      child: Stack(
        children: [
          // Background Decorative Icon
          Positioned(
            right: -10,
            bottom: -10,
            child: Opacity(
              opacity: 0.1,
              child: Icon(icon, size: 100, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w900, fontSize: 16, height: 1.1),
                ),
                Text(
                  subtitle,
                  style: AppTextStyles.bodySmall.copyWith(color: Colors.black54, fontSize: 11, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.white, size: 12),
                ),
              ],
            ),
          ),
          // Featured Icon
          Positioned(
            right: 12,
            bottom: 12,
            child: Icon(
              icon,
              size: 56,
              color: AppColors.primary.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
