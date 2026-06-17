import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'confirmed_order_details_landscape_panel.dart';

class ConfirmedOrdersLandscapePage extends ConsumerWidget {
  const ConfirmedOrdersLandscapePage({super.key});

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
                  'Confirmed Orders',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'View, update, and manage active orders',
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
                  child: _buildOrderListSection(context, ref, state.confirmedOrders),
                ),
                const VerticalDivider(width: 1, thickness: 1, color: AppColors.ashGrey),
                // Right Section: Order Details
                const Expanded(
                  flex: 3,
                  child: ConfirmedOrderDetailsLandscapePanel(),
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
    final statusTab = ref.watch(orderStatusTabProvider);
    final selectedOrderId = ref.watch(selectedOrderIdProvider);
    final selectedOrderItemId = ref.watch(selectedOrderItemIdProvider);

    // Filter by tab
    final tabFiltered = orders.where((o) => o.itemStatus == statusTab).toList();

    // Filter by search
    final filtered = tabFiltered.where((o) {
      return o.orderID.toString().contains(searchQuery) ||
          (o.productName?.toLowerCase().contains(searchQuery) ?? false) ||
          (o.customerName?.toLowerCase().contains(searchQuery) ?? false) ||
          (o.tableNumber?.toLowerCase().contains(searchQuery) ?? false);
    }).toList();

    // Auto-clear selection if the selected order is no longer in the filtered list
    if (selectedOrderId != null) {
      final stillExists = filtered.any((o) => o.orderID == selectedOrderId && o.productId == selectedOrderItemId);
      if (!stillExists) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(selectedOrderIdProvider.notifier).select(null);
          ref.read(selectedOrderItemIdProvider.notifier).select(null);
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
                      hintText: 'Search order, item, customer...',
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
        _buildStatusTabs(ref, statusTab),
        Expanded(
          child: filtered.isEmpty
              ? _buildEmptyState()
              : ListView.separated(
                  itemCount: filtered.length,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  separatorBuilder: (context, index) => const Divider(height: 1, indent: 16, endIndent: 16, color: AppColors.ashGrey),
                  itemBuilder: (context, index) {
                    final order = filtered[index];
                    final isSelected = selectedOrderId == order.orderID && selectedOrderItemId == order.productId;
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
                            _getProductIcon(order.productName ?? ''),
                            size: 16,
                            color: isSelected ? AppColors.primary : AppColors.grey,
                          ),
                        ),
                        title: Text(
                          order.productName ?? 'Unknown Item',
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
                              const Icon(Icons.confirmation_number_outlined, size: 12, color: AppColors.grey),
                              const SizedBox(width: 4),
                              Text('#${order.orderID}', style: const TextStyle(fontSize: 11, color: AppColors.grey)),
                              const SizedBox(width: 8),
                              const Icon(Icons.table_restaurant_outlined, size: 12, color: AppColors.grey),
                              const SizedBox(width: 4),
                              Text(order.tableNumber ?? 'N/A', style: const TextStyle(fontSize: 11, color: AppColors.grey)),
                              const Spacer(),
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
                          ref.read(selectedOrderIdProvider.notifier).select(order.orderID);
                          ref.read(selectedOrderItemIdProvider.notifier).select(order.productId);
                        },
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildStatusTabs(WidgetRef ref, String currentTab) {
    final tabs = ['Pending', 'Ready', 'Served'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: tabs.map((tab) {
          final isSelected = currentTab == tab;
          return Expanded(
            child: InkWell(
              onTap: () => ref.read(orderStatusTabProvider.notifier).set(tab),
              borderRadius: BorderRadius.circular(4),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected ? AppColors.primary : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  tab.toUpperCase(),
                  style: TextStyle(
                    color: isSelected ? AppColors.primary : AppColors.grey,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    fontSize: 12,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
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
            'No orders found',
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

  IconData _getProductIcon(String name) {
    final n = name.toLowerCase();
    if (n.contains('momo') || n.contains('dumpling')) return Icons.flatware;
    if (n.contains('tea') || n.contains('coffee') || n.contains('coke') || n.contains('water') || n.contains('juice') || n.contains('drink')) {
      return Icons.local_bar;
    }
    if (n.contains('cake') || n.contains('ice cream') || n.contains('dessert') || n.contains('sweet')) return Icons.icecream;
    if (n.contains('pizza') || n.contains('burger') || n.contains('sandwich') || n.contains('fries')) return Icons.fastfood;
    return Icons.restaurant;
  }
}
