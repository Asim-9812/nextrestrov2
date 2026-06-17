import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'confirmed_order_details_portrait_page.dart';

class ConfirmedOrdersPortraitPage extends ConsumerWidget {
  const ConfirmedOrdersPortraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(orderDashboardProvider);

    return dashboardAsync.when(
      data: (state) => _buildOrderListSection(context, ref, state.confirmedOrders),
      loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
      error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(color: AppColors.error))),
    );
  }

  Widget _buildOrderListSection(BuildContext context, WidgetRef ref, List<OrderDetailModel> orders) {
    final searchQuery = ref.watch(orderSearchQueryProvider).toLowerCase();
    final statusTab = ref.watch(orderStatusTabProvider);

    // Filter by tab
    final tabFiltered = orders.where((o) => o.itemStatus == statusTab).toList();

    // Filter by search
    final filtered = tabFiltered.where((o) {
      return o.orderID.toString().contains(searchQuery) ||
          (o.productName?.toLowerCase().contains(searchQuery) ?? false) ||
          (o.customerName?.toLowerCase().contains(searchQuery) ?? false) ||
          (o.tableNumber?.toLowerCase().contains(searchQuery) ?? false);
    }).toList();

    return Column(
      children: [
        _buildStatusTabs(ref, statusTab),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: SizedBox(
            height: 44,
            child: TextField(
              onChanged: (val) => ref.read(orderSearchQueryProvider.notifier).set(val),
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Search order, item, customer...',
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
                        child: Icon(_getProductIcon(order.productName ?? ''), size: 20, color: AppColors.grey),
                      ),
                      title: Text(
                        order.productName ?? 'Unknown Item',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.black),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.confirmation_number_outlined, size: 14, color: AppColors.grey),
                              const SizedBox(width: 4),
                              Text('#${order.orderID}', style: const TextStyle(fontSize: 12, color: AppColors.grey)),
                              const SizedBox(width: 12),
                              const Icon(Icons.table_restaurant_outlined, size: 14, color: AppColors.grey),
                              const SizedBox(width: 4),
                              Text(order.tableNumber ?? 'N/A', style: const TextStyle(fontSize: 12, color: AppColors.grey)),
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
                        ref.read(selectedOrderIdProvider.notifier).select(order.orderID);
                        ref.read(selectedOrderItemIdProvider.notifier).select(order.productId);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ConfirmedOrderDetailsPortraitPage(),
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

  Widget _buildStatusTabs(WidgetRef ref, String currentTab) {
    final tabs = ['Pending', 'Ready', 'Served'];
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: tabs.map((tab) {
          final isSelected = currentTab == tab;
          return Expanded(
            child: InkWell(
              onTap: () => ref.read(orderStatusTabProvider.notifier).set(tab),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
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
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long_outlined, size: 64, color: AppColors.lightGrey),
          const SizedBox(height: 16),
          const Text(
            'No orders found',
            style: TextStyle(color: AppColors.grey, fontSize: 16),
          ),
        ],
      ),
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
