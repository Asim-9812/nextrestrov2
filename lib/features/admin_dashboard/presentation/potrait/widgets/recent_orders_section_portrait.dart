import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_provider.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';
import '../../../../orders/data/models/order_detail_model.dart';
import '../../../../shift/data/models/shift_model.dart';
import '../../landscape/widgets/recent_orders_table.dart';

class RecentOrdersSectionPortrait extends ConsumerWidget {
  const RecentOrdersSectionPortrait({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentOrdersState = ref.watch(orderControllerProvider);
    final shiftState = ref.watch(shiftManagementControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Fixed Header: Title and Refresh Button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Orders',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                ref.read(orderControllerProvider.notifier).refresh();
                ref.read(shiftManagementControllerProvider.notifier).refresh();
              },
              icon: const Icon(Icons.refresh, color: AppColors.primary, size: 16,),
              tooltip: 'Refresh All Data',
            ),
          ],
        ),
        // const SizedBox(height: 12),
        // Scrollable Table content
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

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 600, // Fixed width for table to prevent compression
                child: RecentOrdersTable(orders: filteredOrders.take(5).toList()),
              ),
            );
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
