import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/orders/presentation/providers/manage_orders_provider.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_state.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_state.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'manage_orders_details_panel.dart';

class ManageOrdersLandscapePage extends ConsumerWidget {
  const ManageOrdersLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(orderDashboardProvider);
    final mainTab = ref.watch(manageOrdersMainTabProvider);
    final shiftAsync = ref.watch(shiftControllerProvider);

    return dashboardAsync.when(
      data: (OrderDashboardState state) {
        // Filter orders by active shift opening time
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
            if (orderDate == null) return true; // Keep if date is unparseable for safety
            return orderDate.isAfter(openingTime!) || orderDate.isAtSameMomentAs(openingTime!);
          }).toList();
        }

        final filteredState = state.copyWith(
          confirmedOrders: filterByShift(state.confirmedOrders),
          readyOrders: filterByShift(state.readyOrders),
          completedOrders: filterByShift(state.completedOrders),
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(ref, filteredState),
            const Divider(height: 0),
            Expanded(
              child: Row(
                children: [
                  // Left Section: List
                  Expanded(
                    flex: 2,
                    child: _buildOrderListSection(context, ref, filteredState, mainTab),
                  ),
                  const VerticalDivider(width: 1, thickness: 1, color: AppColors.ashGrey),
                  // Right Section: Order Details
                  const Expanded(
                    flex: 3,
                    child: ManageOrdersDetailsPanel(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
      error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(color: AppColors.error))),
    );
  }

  Widget _buildTopBar(WidgetRef ref, OrderDashboardState state) {
    final mainTab = ref.watch(manageOrdersMainTabProvider);
    
    // Calculate unique order counts for grouped tabs
    int getUniqueOrderCount(List<OrderDetailModel> orders) {
      final Set<int> uniqueIds = {};
      for (var o in orders) {
        if (o.orderID != null) uniqueIds.add(o.orderID!);
      }
      return uniqueIds.length;
    }

    int confirmedCount = state.confirmedOrders.length; // Keep items for confirmed as it's an item list
    int readyCount = getUniqueOrderCount(state.readyOrders);
    int completedCount = getUniqueOrderCount(state.completedOrders);

    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Manage Orders',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildMainTab(ref, 'Confirmed', confirmedCount, mainTab == 'Confirmed'),
              const SizedBox(width: 16),
              _buildMainTab(ref, 'Ready', readyCount, mainTab == 'Ready'),
              const SizedBox(width: 16),
              _buildMainTab(ref, 'Completed', completedCount, mainTab == 'Completed'),
            ],
          ),
          const SizedBox(height: 16),
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
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildOrderListSection(BuildContext context, WidgetRef ref, OrderDashboardState state, String mainTab) {
    final searchQuery = ref.watch(manageOrdersSearchQueryProvider).toLowerCase();
    
    if (mainTab == 'Confirmed') {
      return _buildConfirmedList(context, ref, state.confirmedOrders, searchQuery);
    } else if (mainTab == 'Ready') {
      return _buildGroupedList(context, ref, state.readyOrders, searchQuery);
    } else {
      return _buildGroupedList(context, ref, state.completedOrders, searchQuery);
    }
  }

  Widget _buildConfirmedList(BuildContext context, WidgetRef ref, List<OrderDetailModel> orders, String searchQuery) {
    final statusTab = ref.watch(manageOrdersStatusTabProvider);
    final selectedOrderId = ref.watch(selectedOrderIdProvider);
    final selectedOrderItemId = ref.watch(selectedOrderItemIdProvider);

    // Filter by sub-tab (itemStatus)
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
                    final isSelected = selectedOrderId == order.orderID && selectedOrderItemId == order.productId;
                    return _buildItemTile(ref, order, isSelected);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildGroupedList(BuildContext context, WidgetRef ref, List<OrderDetailModel> orders, String searchQuery) {
    final selectedOrderId = ref.watch(selectedOrderIdProvider);

    // Grouping logic
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

    // Sort by date (latest first)
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
                    final isSelected = selectedOrderId == orderId;
                    
                    return Material(
                      color: isSelected ? AppColors.primary2 : Colors.transparent,
                      child: ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: (isSelected ? AppColors.primary : AppColors.ashGrey).withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.receipt_long,
                            size: 16,
                            color: isSelected ? AppColors.primary : AppColors.grey,
                          ),
                        ),
                        title: Text(
                          'Order #$orderId',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                            color: isSelected ? AppColors.primary : AppColors.black,
                          ),
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
                                  Text('${group['itemCount']} items', style: const TextStyle(fontSize: 11, color: AppColors.grey)),
                                  const SizedBox(width: 12),
                                  const Icon(Icons.table_restaurant_outlined, size: 12, color: AppColors.grey),
                                  const SizedBox(width: 4),
                                  Text(group['tableNumber'] as String, style: const TextStyle(fontSize: 11, color: AppColors.grey)),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.access_time, size: 12, color: AppColors.grey),
                                  const SizedBox(width: 4),
                                  Text(
                                    timeago.format(DateTime.tryParse(group['date'] as String) ?? DateTime.now(), locale: 'en_short'),
                                    style: const TextStyle(fontSize: 11, color: AppColors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          // Clear item ID when selecting a grouped order to avoid showing specific item selection highlights
                          ref.read(selectedOrderItemIdProvider.notifier).select(null);
                          ref.read(selectedOrderIdProvider.notifier).select(orderId);
                        },
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildSearchField(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: SizedBox(
        height: 40,
        child: TextField(
          onChanged: (val) => ref.read(manageOrdersSearchQueryProvider.notifier).set(val),
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

  Widget _buildItemTile(WidgetRef ref, OrderDetailModel order, bool isSelected) {
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
          // Select order then item
          ref.read(selectedOrderIdProvider.notifier).select(order.orderID);
          ref.read(selectedOrderItemIdProvider.notifier).select(order.productId);
        },
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
