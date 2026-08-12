import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../pages/pet_edit_page.dart';

class PetOverviewHeader extends StatelessWidget {
  final Map<String, dynamic> pet;

  const PetOverviewHeader({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  pet['name'],
                  style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PetEditPage(
                          petName: pet['name'],
                          petType: pet['breed'].toString().contains('Cat') ? 'Cat' : 'Dog',
                          petAge: '2 years 3 months', // In real app, this would come from a model
                          petImage: pet['image'],
                        ),
                      ),
                    );
                  },
                  child: const Icon(Icons.edit_outlined, color: AppColors.primary, size: 18),
                ),
              ],
            ),
            const SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildTag(pet['gender'], Icons.male, const Color(0xFFEDE7FF), AppColors.primary),
            const SizedBox(width: 8),
            _buildTag(pet['breed'], null, const Color(0xFFF2EEFF), AppColors.primary),
            const SizedBox(width: 8),
            _buildTag('2Y 4M', null, const Color(0xFFF7F3FF), AppColors.primary),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  _buildInfoRow(Icons.scale_outlined, 'Weight', '28.5 kg'),
                  _buildInfoRow(Icons.calendar_today_outlined, 'Birthday', 'Mar 15, 2022'),
                  _buildInfoRow(Icons.tag, 'Microchip ID', '987 654 321 001'),
                  _buildInfoRow(Icons.assignment_outlined, 'Registration ID', 'DPET-000123'),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _buildVaccinationCard(),
          ],
        ),
      ],
    );
  }

  Widget _buildTag(String label, IconData? icon, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: textColor),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey.shade400),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500)),
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVaccinationCard() {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F9F1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle_outline, color: Color(0xFF27AE60), size: 14),
              ),
              const SizedBox(width: 6),
              const Text('Vaccination', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 10),
          const Text('Up to date', style: TextStyle(color: Color(0xFF27AE60), fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 4),
          const Text('All vaccinations are current', style: TextStyle(color: Colors.grey, fontSize: 8)),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 8),
          const Text('Next Due', style: TextStyle(color: Colors.grey, fontSize: 8)),
          const Text('Mar 15, 2025', style: TextStyle(color: Color(0xFF27AE60), fontWeight: FontWeight.bold, fontSize: 10)),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF7F3FF),
              foregroundColor: AppColors.primary,
              elevation: 0,
              minimumSize: const Size(double.infinity, 30),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.zero,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.calendar_today_outlined, size: 10),
                SizedBox(width: 4),
                Text('Schedule', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
