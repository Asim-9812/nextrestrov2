import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class PetRemindersList extends StatelessWidget {
  const PetRemindersList({super.key});

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
                  Text('Reminders & Upcoming', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(width: 8),
                  Icon(Icons.notifications_none_rounded, color: AppColors.primary, size: 20),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: const [
                    Text('View All', style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold)),
                    Icon(Icons.chevron_right, color: AppColors.primary, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _buildReminderTile(Icons.medical_services_outlined, 'Rabies Vaccination', 'Due on Mar 15, 2025', 'In 20 days'),
              _buildReminderTile(Icons.calendar_today_outlined, 'Vet Check-up', 'Due on Apr 05, 2025', 'In 41 days'),
              _buildReminderTile(Icons.medication_outlined, 'Deworming', 'Due on Apr 20, 2025', 'In 56 days'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReminderTile(IconData icon, String title, String date, String countdown) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 18),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text(date, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE5D9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              countdown,
              style: const TextStyle(color: Color(0xFFFF782C), fontWeight: FontWeight.bold, fontSize: 9),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
        ],
      ),
    );
  }
}
