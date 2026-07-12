import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/providers/admin_navigation_provider.dart';
import 'package:nextrestro/features/customer/presentation/providers/customer_provider.dart';

class QuickActionsRow extends ConsumerWidget {
  const QuickActionsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            children: [
              _actionItem(
                icon: Icons.add_shopping_cart_rounded,
                label: 'Place\nOrder',
                color: Colors.blue,
                onTap: () {
                  ref.read(adminDashboardTabControllerProvider.notifier).set(1);
                  ref.read(ordersTabControllerProvider.notifier).set(1);
                },
              ),
              const SizedBox(width: 16),
              _actionItem(
                icon: Icons.event_available_rounded,
                label: 'Set\nReservation',
                color: Colors.orange,
                onTap: () {
                  ref.read(adminDashboardTabControllerProvider.notifier).set(2);
                },
              ),
              const SizedBox(width: 16),
              _actionItem(
                icon: Icons.person_add_alt_1_rounded,
                label: 'Add\nCustomer',
                color: Colors.green,
                onTap: () {
                  ref.read(adminDashboardTabControllerProvider.notifier).set(6);
                  ref.read(isAddingCustomerProvider.notifier).set(true);
                },
              ),
              const SizedBox(width: 16),
              _actionItem(
                icon: Icons.info_outline_rounded,
                label: 'Shift\nDetails',
                color: Colors.purple,
                onTap: () {
                  ref.read(adminDashboardTabControllerProvider.notifier).set(4);
                },
              ),
              // Add more actions here in the future
            ],
          ),
        ),
      ],
    );
  }

  Widget _actionItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 150, // Slightly reduced width
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12, // Reduced font size
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                    height: 1.2, // Tighter line height for 2 lines
                  ),
                  maxLines: 2, // Allow up to 2 lines
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
