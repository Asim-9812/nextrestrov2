import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/orders/presentation/providers/manage_orders_provider.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_state.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'manage_orders_details_portrait_page.dart';

class ManageOrdersPortraitPage extends ConsumerWidget {
  const ManageOrdersPortraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(orderDashboardProvider);
    final mainTab = ref.watch(manageOrdersMainTabProvider);
    final shiftAsync = ref.watch(shiftControllerProvider);

    return dashboardAsync.when(
      data: (OrderDashboardState state) {
        final activeShift = shiftAsync.maybeWhen(
          data: (data) => data.$1,
          orElse: () => null,
        );
        
        DateTime? openingTime;
        if (activeShift?.openingTime != null) {
          openingTime = DateTime.tryParse(activeShift!.openingTime!);
        }

        List<OrderDetailModel> filterByShift(List<OrderDetailModel> orders) {
          if (openingTime == null) return orders;
          return orders.where((o) {
            final orderDate = DateTime.tryParse(o.orderDate ?? '');
            if (orderDate == null) return true;
            return orderDate.isAfter(openingTime!) || orderDate.isAtSameMomentAs(openingTime!);
          }).toList();
        }

        final filteredState = state.copyWith(
          confirmedOrders: filterByShift(state.confirmedOrders),
          readyOrders: filterByShift(state.readyOrders),
          completedOrders: filterByShift(state.completedOrders),
          pendingOrders: filterByShift(state.pendingOrders),
        );

        return Scaffold(
          backgroundColor: AppColors.bg,
          // appBar: AppBar(
          //   backgroundColor: AppColors.white,
          //   elevation: 0,
          //   title: const Text(
          //     'Manage Orders',
          //     style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 18),
          //   ),
          //   bottom: PreferredSize(
          //     preferredSize: const Size.fromHeight(60),
          //     child: _buildTopBar(ref, filteredState),
          //   ),
          // ),
          body: Column(
            children: [
              _buildTopBar(ref, filteredState),
              const Divider(height: 1),
              Expanded(
                child: _buildOrderListSection(context, ref, filteredState, mainTab),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
      error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(color: AppColors.error))),
    );
  }

  Widget _buildTopBar(WidgetRef ref, OrderDashboardState state) {
    final mainTab = ref.watch(manageOrdersMainTabProvider);
    
    int getUniqueOrderCount(List<OrderDetailModel> orders) {
      final Set<int> uniqueIds = {};
      for (var o in orders) {
        if (o.orderID != null) uniqueIds.add(o.orderID!);
      }
      return uniqueIds.length;
    }

    int pendingCount = getUniqueOrderCount(state.pendingOrders);
    int confirmedCount = state.confirmedOrders.length;
    int readyCount = getUniqueOrderCount(state.readyOrders);
    int completedCount = getUniqueOrderCount(state.completedOrders);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          _buildMainTab(ref, 'Pending', pendingCount, mainTab == 'Pending'),
          const SizedBox(width: 12),
          _buildMainTab(ref, 'Confirmed', confirmedCount, mainTab == 'Confirmed'),
          const SizedBox(width: 12),
          _buildMainTab(ref, 'Ready', readyCount, mainTab == 'Ready'),
          const SizedBox(width: 12),
          _buildMainTab(ref, 'Completed', completedCount, mainTab == 'Completed'),
        ],
      ),
    );
  }

  Widget _buildMainTab(WidgetRef ref, String label, int count, bool isSelected) {
    return InkWell(
      onTap: () => ref.read(manageOrdersMainTabProvider.notifier).set(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? AppColors.primary : AppColors.ashGrey),
        ),
        child: Text(
          '$label${count > 0 ? ' ($count)' : ''}',
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildOrderListSection(BuildContext context, WidgetRef ref, OrderDashboardState state, String mainTab) {
    final searchQuery = ref.watch(manageOrdersSearchQueryProvider).toLowerCase();
    
    if (mainTab == 'Confirmed') {
      return _buildConfirmedList(context, ref, state.confirmedOrders, searchQuery);
    } else if (mainTab == 'Pending') {
      return _buildGroupedList(context, ref, state.pendingOrders, searchQuery);
    } else if (mainTab == 'Ready') {
      return _buildGroupedList(context, ref, state.readyOrders, searchQuery);
    } else {
      return _buildGroupedList(context, ref, state.completedOrders, searchQuery);
    }
  }

  Widget _buildConfirmedList(BuildContext context, WidgetRef ref, List<OrderDetailModel> orders, String searchQuery) {
    final statusTab = ref.watch(manageOrdersStatusTabProvider);

    final tabFiltered = orders.where((o) => o.itemStatus == statusTab).toList();

    final filtered = tabFiltered.where((o) {
      return o.orderID.toString().contains(searchQuery) ||
          (o.productName?.toLowerCase().contains(searchQuery) ?? false) ||
          (o.customerName?.toLowerCase().contains(searchQuery) ?? false) ||
          (o.tableNumber?.toLowerCase().contains(searchQuery) ?? false);
    }).toList();

    return Column(
      children: [
        _buildSearchField(ref),
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
                    return _buildItemTile(context, ref, order);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildGroupedList(BuildContext context, WidgetRef ref, List<OrderDetailModel> orders, String searchQuery) {
    final Map<int, List<OrderDetailModel>> groupedMap = {};
    for (final order in orders) {
      if (order.orderID != null) {
        groupedMap.putIfAbsent(order.orderID!, () => []).add(order);
      }
    }

    final groupedList = groupedMap.entries.map((e) {
      final items = e.value;
      final first = items.first;
      return {
        'orderId': e.key,
        'itemCount': items.length,
        'tableNumber': first.tableNumber ?? 'N/A',
        'customerName': first.customerName ?? 'Unknown',
        'date': first.orderDate ?? '',
        'items': items,
      };
    }).where((g) {
      return g['orderId'].toString().contains(searchQuery) ||
          (g['customerName'] as String).toLowerCase().contains(searchQuery) ||
          (g['tableNumber'] as String).toLowerCase().contains(searchQuery);
    }).toList();

    groupedList.sort((a, b) {
      final dateA = DateTime.tryParse(a['date'] as String) ?? DateTime(0);
      final dateB = DateTime.tryParse(b['date'] as String) ?? DateTime(0);
      return dateB.compareTo(dateA);
    });

    return Column(
      children: [
        _buildSearchField(ref),
        Expanded(
          child: groupedList.isEmpty
              ? _buildEmptyState()
              : ListView.separated(
                  itemCount: groupedList.length,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  separatorBuilder: (context, index) => const Divider(height: 1, indent: 16, endIndent: 16, color: AppColors.ashGrey),
                  itemBuilder: (context, index) {
                    final group = groupedList[index];
                    final orderId = group['orderId'] as int;
                    
                    return ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.ashGrey.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.receipt_long, size: 20, color: AppColors.grey),
                      ),
                      title: Text(
                        'Order #$orderId',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.black),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.shopping_basket_outlined, size: 12, color: AppColors.grey),
                                const SizedBox(width: 4),
                                Text('${group['itemCount']} items', style: const TextStyle(fontSize: 12, color: AppColors.grey)),
                                const SizedBox(width: 12),
                                const Icon(Icons.table_restaurant_outlined, size: 12, color: AppColors.grey),
                                const SizedBox(width: 4),
                                Text(group['tableNumber'] as String, style: const TextStyle(fontSize: 12, color: AppColors.grey)),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.access_time, size: 12, color: AppColors.grey),
                                const SizedBox(width: 4),
                                Text(
                                  timeago.format(DateTime.tryParse(group['date'] as String) ?? DateTime.now(), locale: 'en_short'),
                                  style: const TextStyle(fontSize: 12, color: AppColors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_right, color: AppColors.lightGrey),
                      onTap: () {
                        ref.read(selectedOrderIdProvider.notifier).select(orderId);
                        ref.read(selectedOrderItemIdProvider.notifier).select(null);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ManageOrdersDetailsPortraitPage()),
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildSearchField(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: SizedBox(
        height: 44,
        child: TextField(
          onChanged: (val) => ref.read(manageOrdersSearchQueryProvider.notifier).set(val),
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: 'Search order, customer...',
            hintStyle: const TextStyle(color: AppColors.lightGrey, fontSize: 14),
            prefixIcon: const Icon(Icons.search, size: 20, color: AppColors.grey),
            isDense: true,
            filled: true,
            fillColor: AppColors.ashGrey.withValues(alpha: 0.1),
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.ashGrey)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.ashGrey)),
          ),
        ),
      ),
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
              onTap: () => ref.read(manageOrdersStatusTabProvider.notifier).set(tab),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: isSelected ? AppColors.primary : Colors.transparent, width: 2)),
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

  Widget _buildItemTile(BuildContext context, WidgetRef ref, OrderDetailModel order) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
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
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.confirmation_number_outlined, size: 12, color: AppColors.grey),
                const SizedBox(width: 4),
                Text('#${order.orderID}', style: const TextStyle(fontSize: 12, color: AppColors.grey)),
                const SizedBox(width: 12),
                const Icon(Icons.table_restaurant_outlined, size: 12, color: AppColors.grey),
                const SizedBox(width: 4),
                Text(order.tableNumber ?? 'N/A', style: const TextStyle(fontSize: 12, color: AppColors.grey)),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Icon(Icons.access_time, size: 12, color: AppColors.grey),
                const SizedBox(width: 4),
                Text(
                  timeago.format(DateTime.tryParse(order.orderDate ?? '') ?? DateTime.now(), locale: 'en_short'),
                  style: const TextStyle(fontSize: 12, color: AppColors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: AppColors.lightGrey),
      onTap: () {
        ref.read(selectedOrderIdProvider.notifier).select(order.orderID);
        ref.read(selectedOrderItemIdProvider.notifier).select(order.productId);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ManageOrdersDetailsPortraitPage()),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long_outlined, size: 64, color: AppColors.ashGrey.withValues(alpha: 0.5)),
          const SizedBox(height: 16),
          const Text('No orders found', style: TextStyle(color: AppColors.grey, fontSize: 16)),
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
