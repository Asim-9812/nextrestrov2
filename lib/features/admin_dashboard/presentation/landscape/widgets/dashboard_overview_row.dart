import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/providers/dashboard_provider.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'dashboard_summary_card.dart';

class DashboardOverviewRow extends ConsumerWidget {
  final ShiftModel shift;

  const DashboardOverviewRow({
    super.key,
    required this.shift,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsState = ref.watch(orderStatsProvider);

    return Row(
      children: [
        Expanded(
          child: statsState.when(
            skipLoadingOnRefresh: false,
            data: (stats) {
              final diff = stats.currentShiftOrders - stats.lastShiftOrders;
              final sign = diff >= 0 ? '+' : '';
              return DashboardSummaryCard(
                title: 'Orders',
                value: '${stats.currentShiftOrders}',
                icon: Icons.shopping_bag,
                color: AppColors.primary,
                comparison: '$sign$diff vs last shift',
              );
            },
            loading: () => const DashboardSummaryCard(
              title: 'Orders',
              value: '...',
              icon: Icons.shopping_bag,
              color: AppColors.primary,
            ),
            error: (_, __) => const DashboardSummaryCard(
              title: 'Orders',
              value: 'Error',
              icon: Icons.shopping_bag,
              color: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: DashboardSummaryCard(
            title: 'Revenue',
            value: '\$${shift.totalSales}',
            icon: Icons.attach_money,
            color: Colors.green,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: const DashboardSummaryCard(
            title: 'Tables',
            value: '12',
            icon: Icons.table_bar,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: const DashboardSummaryCard(
            title: 'Customers',
            value: '145',
            icon: Icons.people,
            color: Colors.purple,
          ),
        ),
      ],
    );
  }
}
