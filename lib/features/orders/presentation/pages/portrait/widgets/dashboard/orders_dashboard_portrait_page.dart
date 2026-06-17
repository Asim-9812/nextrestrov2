import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/time_formatter.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_state.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';

class OrdersDashboardPortraitPage extends ConsumerWidget {
  const OrdersDashboardPortraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(orderDashboardProvider);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: dashboardAsync.when(
        data: (state) => RefreshIndicator(
          onRefresh: () => ref.read(orderDashboardProvider.notifier).refresh(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatsGrid(state),
                const SizedBox(height: 24),
                _buildSectionTitle('Ready to Serve', 'Prepared items'),
                const SizedBox(height: 12),
                _buildReadyToServeSection(ref, state),
                const SizedBox(height: 24),
                _buildSectionTitle('Confirmed Tables', 'Active orders status'),
                const SizedBox(height: 12),
                _buildConfirmedTablesSection(ref, state),
              ],
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.black),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: AppColors.grey),
        ),
      ],
    );
  }

  Widget _buildStatsGrid(OrderDashboardState dashboardState) {
    final int completedCount = _getUniqueOrderCount(dashboardState.completedOrders);
    final int pendingCount = _getUniqueOrderCount(dashboardState.pendingOrders);
    final int confirmedCount = _getUniqueOrderCount(dashboardState.confirmedOrders);
    final int cancelledCount = _getUniqueOrderCount(dashboardState.cancelledOrders);

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard('Completed', completedCount.toString(), Icons.check_circle_rounded, Colors.green),
        _buildStatCard('Pending', pendingCount.toString(), Icons.pending_actions_rounded, Colors.orange, isBlinking: pendingCount > 0),
        _buildStatCard('Confirmed', confirmedCount.toString(), Icons.verified_rounded, Colors.blue),
        _buildStatCard('Cancelled', cancelledCount.toString(), Icons.cancel_rounded, Colors.red),
      ],
    );
  }

  int _getUniqueOrderCount(List<OrderDetailModel> items) {
    final Set<int> orderIds = {};
    for (var item in items) {
      if (item.orderID != null) {
        orderIds.add(item.orderID!);
      }
    }
    return orderIds.length;
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color, {bool isBlinking = false}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const Spacer(),
              Text(title, style: const TextStyle(fontSize: 12, color: AppColors.grey, fontWeight: FontWeight.w500)),
              Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black)),
            ],
          ),
          if (isBlinking)
            Positioned(
              top: 0,
              right: 0,
              child: _BlinkingDot(color: color),
            ),
        ],
      ),
    );
  }

  Widget _buildReadyToServeSection(WidgetRef ref, OrderDashboardState dashboardState) {
    final List<OrderDetailModel> readyItems = dashboardState.confirmedOrders
        .where((item) => item.itemStatus == 'Ready')
        .toList();

    if (readyItems.isEmpty) return _buildEmptyState('No items ready to serve');

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: readyItems.length,
        separatorBuilder: (context, index) => const Divider(height: 1, color: AppColors.ashGrey),
        itemBuilder: (context, index) {
          final item = readyItems[index];
          return ListTile(
            dense: true,
            title: Text(item.productName ?? 'N/A', style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Order #${item.orderID} • Table ${item.tableNumber}', style: const TextStyle(fontSize: 12)),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text('READY', style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildConfirmedTablesSection(WidgetRef ref, OrderDashboardState dashboardState) {
    final List<GroupedOrder> groupedOrders = _groupOrders(dashboardState.confirmedOrders);

    if (groupedOrders.isEmpty) return _buildEmptyState('No confirmed orders');

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: groupedOrders.length,
        separatorBuilder: (context, index) => const Divider(height: 1, color: AppColors.ashGrey),
        itemBuilder: (context, index) {
          final order = groupedOrders[index];
          final isCompleted = order.items.every((i) => i.itemStatus == 'Served');
          
          return ListTile(
            dense: true,
            title: Text('Order #${order.orderId}', style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Table ${order.tableNumber} • ${order.items.length} items • ${TimeFormatter.formatTimeAgo(order.items.first.orderDate)}', style: const TextStyle(fontSize: 11)),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: (isCompleted ? Colors.green : Colors.orange).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                isCompleted ? 'COMPLETED' : 'PENDING',
                style: TextStyle(color: isCompleted ? Colors.green : Colors.orange, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          const Icon(Icons.inbox_rounded, size: 40, color: AppColors.lightGrey),
          const SizedBox(height: 8),
          Text(message, style: const TextStyle(color: AppColors.grey, fontSize: 14)),
        ],
      ),
    );
  }

  List<GroupedOrder> _groupOrders(List<OrderDetailModel> items) {
    final Map<int, List<OrderDetailModel>> groupedMap = {};
    for (final item in items) {
      if (item.orderID != null) {
        groupedMap.putIfAbsent(item.orderID!, () => []).add(item);
      }
    }

    return groupedMap.entries.map((entry) {
      final firstItem = entry.value.first;
      return GroupedOrder(
        orderId: entry.key,
        tableNumber: firstItem.tableNumber ?? 'N/A',
        customerName: firstItem.customerName ?? 'Unknown',
        status: firstItem.orderStatus ?? 'Unknown',
        date: DateTime.tryParse(firstItem.orderDate ?? '') ?? DateTime(0),
        itemCount: entry.value.length,
        items: entry.value,
      );
    }).toList()..sort((a, b) => b.date.compareTo(a.date));
  }
}

class _BlinkingDot extends StatefulWidget {
  final Color color;
  const _BlinkingDot({required this.color});

  @override
  State<_BlinkingDot> createState() => _BlinkingDotState();
}

class _BlinkingDotState extends State<_BlinkingDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
