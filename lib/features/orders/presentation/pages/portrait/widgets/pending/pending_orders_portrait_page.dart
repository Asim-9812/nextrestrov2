import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'pending_order_details_portrait_page.dart';

class PendingOrdersPortraitPage extends ConsumerWidget {
  const PendingOrdersPortraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(orderDashboardProvider);

    return dashboardAsync.when(
      data: (state) => _buildOrderListSection(context, ref, state.pendingOrders),
      loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
      error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(color: AppColors.error))),
    );
  }

  Widget _buildOrderListSection(BuildContext context, WidgetRef ref, List<OrderDetailModel> orders) {
    final searchQuery = ref.watch(orderSearchQueryProvider).toLowerCase();

    // Group by OrderID to avoid repetition in the list
    final Map<int, OrderDetailModel> uniqueOrdersMap = {};
    for (var order in orders) {
      if (order.orderID != null && !uniqueOrdersMap.containsKey(order.orderID)) {
        uniqueOrdersMap[order.orderID!] = order;
      }
    }
    final uniqueOrders = uniqueOrdersMap.values.toList();

    // Filter by search
    final filtered = uniqueOrders.where((o) {
      return o.orderID.toString().contains(searchQuery) ||
          (o.customerName?.toLowerCase().contains(searchQuery) ?? false) ||
          (o.tableNumber?.toLowerCase().contains(searchQuery) ?? false);
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: SizedBox(
            height: 44,
            child: TextField(
              onChanged: (val) => ref.read(orderSearchQueryProvider.notifier).set(val),
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Search order, customer, table...',
                hintStyle: const TextStyle(color: AppColors.lightGrey, fontSize: 14),
                prefixIcon: const Icon(Icons.search, size: 20, color: AppColors.grey),
                isDense: true,
                filled: true,
                fillColor: AppColors.ashGrey.withValues(alpha: 0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.ashGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.ashGrey),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: filtered.isEmpty
              ? _buildEmptyState()
              : ListView.separated(
                  itemCount: filtered.length,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  separatorBuilder: (context, index) => const Divider(height: 1, color: AppColors.ashGrey),
                  itemBuilder: (context, index) {
                    final order = filtered[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.ashGrey.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.pending_actions, size: 20, color: AppColors.grey),
                      ),
                      title: Text(
                        'Order #${order.orderID}',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.black),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.table_restaurant_outlined, size: 14, color: AppColors.grey),
                              const SizedBox(width: 4),
                              Text(order.tableNumber ?? 'N/A', style: const TextStyle(fontSize: 12, color: AppColors.grey)),
                              const SizedBox(width: 12),
                              const Icon(Icons.person_outline, size: 14, color: AppColors.grey),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  order.customerName ?? 'Unknown',
                                  style: const TextStyle(fontSize: 12, color: AppColors.grey),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const Icon(Icons.access_time, size: 14, color: AppColors.grey),
                              const SizedBox(width: 4),
                              Text(
                                timeago.format(DateTime.tryParse(order.orderDate ?? '') ?? DateTime.now(), locale: 'en_short'),
                                style: const TextStyle(fontSize: 12, color: AppColors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.chevron_right, color: AppColors.lightGrey),
                      onTap: () {
                        ref.read(selectedPendingOrderIdProvider.notifier).select(order.orderID);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PendingOrderDetailsPortraitPage(),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long_outlined, size: 64, color: AppColors.lightGrey),
          const SizedBox(height: 16),
          const Text(
            'No pending orders found',
            style: TextStyle(color: AppColors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
