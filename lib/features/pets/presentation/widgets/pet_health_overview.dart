import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class PetHealthOverview extends StatelessWidget {
  const PetHealthOverview({super.key});

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
              Row(
                children: const [
                  Text('Pet Health Overview', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(width: 8),
                  Icon(Icons.monitor_heart_outlined, color: AppColors.primary, size: 20),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: const [
                    Text('View Full Record', style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold)),
                    Icon(Icons.chevron_right, color: AppColors.primary, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildHealthCard('28.5 kg', 'Ideal Weight', 'Healthy', const Color(0xFFE8F9F1), const Color(0xFF27AE60), Icons.scale_outlined),
              const SizedBox(width: 12),
              _buildHealthCard('Good', 'Diet & Nutrition', 'On Track', const Color(0xFFF2EEFF), AppColors.primary, Icons.fastfood_outlined),
              const SizedBox(width: 12),
              _buildHealthCard('Active', 'Activity Level', 'Great', const Color(0xFFFFF4EB), const Color(0xFFF2994A), Icons.directions_run_outlined),
              const SizedBox(width: 12),
              _buildHealthCard('Excellent', 'Overall Health', 'Great', const Color(0xFFFFECEB), const Color(0xFFEB5757), Icons.favorite_outline_rounded),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHealthCard(String value, String label, String status, Color bgColor, Color textColor, IconData icon) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: bgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: textColor, size: 14),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.w500)),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: bgColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              status,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 8),
            ),
          ),
        ],
      ),
    );
  }
}
