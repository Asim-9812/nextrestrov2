import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/landscape/widgets/dashboard_summary_card.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/providers/dashboard_provider.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';

import 'dashboard_summary_card_portrait.dart';

class PortraitOverviewRow extends ConsumerWidget {
  final ShiftModel shift;

  const PortraitOverviewRow({
    super.key,
    required this.shift,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsState = ref.watch(orderStatsProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          SizedBox(
            width: 180,
            child: statsState.when(
              skipLoadingOnRefresh: false,
              data: (stats) {
                final diff = stats.currentShiftOrders - stats.lastShiftOrders;
                final sign = diff >= 0 ? '+' : '';
                return DashboardSummaryCardPortrait(
                  title: 'Orders',
                  value: '${stats.currentShiftOrders}',
                  icon: Icons.shopping_bag,
                  color: AppColors.primary,
                  comparison: '$sign$diff vs last shift',
                );
              },
              loading: () => const DashboardSummaryCardPortrait(
                title: 'Orders',
                value: '...',
                icon: Icons.shopping_bag,
                color: AppColors.primary,
              ),
              error: (_, __) => const DashboardSummaryCardPortrait(
                title: 'Orders',
                value: 'Error',
                icon: Icons.shopping_bag,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 180,
            child: DashboardSummaryCardPortrait(
              title: 'Revenue',
              value: '\$${shift.totalSales}',
              icon: Icons.attach_money,
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 12),
          const SizedBox(
            width: 180,
            child: DashboardSummaryCardPortrait(
              title: 'Tables',
              value: '12',
              icon: Icons.table_bar,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 12),
          const SizedBox(
            width: 180,
            child: DashboardSummaryCardPortrait(
              title: 'Customers',
              value: '145',
              icon: Icons.people,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
