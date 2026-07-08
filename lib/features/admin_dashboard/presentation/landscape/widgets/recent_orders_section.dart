import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_provider.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';
import '../../../../orders/data/models/order_detail_model.dart';
import '../../../../shift/data/models/shift_model.dart';
import 'recent_orders_table.dart';

class RecentOrdersSection extends ConsumerWidget {
  const RecentOrdersSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentOrdersState = ref.watch(orderControllerProvider);
    final shiftState = ref.watch(shiftManagementControllerProvider);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  ref.read(orderControllerProvider.notifier).refresh();
                  ref.read(shiftManagementControllerProvider.notifier).refresh();
                },
                icon: const Icon(Icons.refresh, size: 16),
                label: const Text('Refresh', style: TextStyle(fontSize: 12)),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          recentOrdersState.when(
            skipLoadingOnRefresh: false,
            data: (orders) {
              // Filter orders based on active shift opening time
              final activeShift = shiftState.asData?.value.shifts.firstWhere(
                (s) => s.shiftStatus == 1,
                orElse: () => const ShiftModel(),
              );

              final startTime = DateTime.tryParse(activeShift?.openingTime ?? '');
              final filteredOrders = startTime == null
                  ? <GroupedOrder>[]
                  : orders.where((order) => order.date.isAfter(startTime)).toList();

              if (filteredOrders.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Text('No orders found for the active shift.', style: TextStyle(color: AppColors.grey)),
                  ),
                );
              }

              return RecentOrdersTable(orders: filteredOrders.take(5).toList());
            },
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, _) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(child: Text('Error loading orders: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
