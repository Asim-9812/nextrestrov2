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

    return Column(
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
            IconButton(
              onPressed: () {
                ref.read(orderControllerProvider.notifier).refresh();
                ref.read(shiftManagementControllerProvider.notifier).refresh();
              },
              icon: const Icon(Icons.refresh, color: AppColors.primary),
              tooltip: 'Refresh All Data',
            ),
          ],
        ),
        const SizedBox(height: 12),
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
    );
  }
}
