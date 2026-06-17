import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'pending_order_details_landscape_panel.dart';

class PendingOrdersLandscapePage extends ConsumerWidget {
  const PendingOrdersLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(orderDashboardProvider);

    return dashboardAsync.when(
      data: (state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pending Orders',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Review and confirm incoming orders',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          const Divider(
            height: 0,
          ),
          Expanded(
            child: Row(
              children: [
                // Left Section: List
                Expanded(
                  flex: 2,
                  child: _buildOrderListSection(context, ref, state.pendingOrders),
                ),
                const VerticalDivider(width: 1, thickness: 1, color: AppColors.ashGrey),
                // Right Section: Order Details
                const Expanded(
                  flex: 3,
                  child: PendingOrderDetailsLandscapePanel(),
                ),
              ],
            ),
          ),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
      error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(color: AppColors.error))),
    );
  }

  Widget _buildOrderListSection(BuildContext context, WidgetRef ref, List<OrderDetailModel> orders) {
    final searchQuery = ref.watch(orderSearchQueryProvider).toLowerCase();
    final selectedOrderId = ref.watch(selectedPendingOrderIdProvider);

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

    // Auto-clear selection if the selected order is no longer in the filtered list
    if (selectedOrderId != null) {
      final stillExists = filtered.any((o) => o.orderID == selectedOrderId);
      if (!stillExists) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(selectedPendingOrderIdProvider.notifier).select(null);
        });
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    onChanged: (val) => ref.read(orderSearchQueryProvider.notifier).set(val),
                    style: const TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      hintText: 'Search order, customer, table...',
                      hintStyle: const TextStyle(color: AppColors.lightGrey, fontSize: 13),
                      prefixIcon: const Icon(Icons.search, size: 20, color: AppColors.grey),
                      isDense: true,
                      filled: true,
                      fillColor: AppColors.ashGrey.withValues(alpha: 0.1),
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.ashGrey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.ashGrey),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.ashGrey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.sort, size: 20, color: AppColors.grey),
                  onPressed: () => _showSortDialog(context, ref),
                  constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: filtered.isEmpty
              ? _buildEmptyState()
              : ListView.separated(
                  itemCount: filtered.length,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  separatorBuilder: (context, index) => const Divider(height: 1, indent: 16, endIndent: 16, color: AppColors.ashGrey),
                  itemBuilder: (context, index) {
                    final order = filtered[index];
                    final isSelected = selectedOrderId == order.orderID;
                    return Material(
                      color: isSelected ? AppColors.primary2 : Colors.transparent,
                      child: ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: (isSelected ? AppColors.primary : AppColors.ashGrey).withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.pending_actions,
                            size: 16,
                            color: isSelected ? AppColors.primary : AppColors.grey,
                          ),
                        ),
                        title: Text(
                          'Order #${order.orderID}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                            color: isSelected ? AppColors.primary : AppColors.black,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            children: [
                              const Icon(Icons.table_restaurant_outlined, size: 12, color: AppColors.grey),
                              const SizedBox(width: 4),
                              Text(order.tableNumber ?? 'N/A', style: const TextStyle(fontSize: 11, color: AppColors.grey)),
                              const SizedBox(width: 8),
                              const Icon(Icons.person_outline, size: 12, color: AppColors.grey),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  order.customerName ?? 'Unknown',
                                  style: const TextStyle(fontSize: 11, color: AppColors.grey),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Icon(Icons.access_time, size: 12, color: AppColors.grey),
                              const SizedBox(width: 4),
                              Text(
                                timeago.format(DateTime.tryParse(order.orderDate ?? '') ?? DateTime.now(), locale: 'en_short'),
                                style: const TextStyle(fontSize: 11, color: AppColors.grey),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          ref.read(selectedPendingOrderIdProvider.notifier).select(order.orderID);
                        },
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long_outlined, size: 48, color: AppColors.ashGrey.withValues(alpha: 0.5)),
          const SizedBox(height: 16),
          const Text(
            'No pending orders found',
            style: TextStyle(color: AppColors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }

  void _showSortDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sort By', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _sortOption(Icons.new_releases_outlined, 'Time (Newest First)', () {}),
            _sortOption(Icons.history_outlined, 'Time (Oldest First)', () {}),
            _sortOption(Icons.tag, 'Order ID', () {}),
            _sortOption(Icons.table_bar_outlined, 'Table Name', () {}),
          ],
        ),
      ),
    );
  }

  Widget _sortOption(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, size: 20, color: AppColors.grey),
      title: Text(title, style: const TextStyle(fontSize: 14)),
      onTap: onTap,
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }
}
