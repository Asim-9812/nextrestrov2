import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/time_formatter.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_state.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';

class OrdersDashboardLandscapePage extends ConsumerWidget {
  const OrdersDashboardLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(orderDashboardProvider);

    return dashboardAsync.when(
      data: (state) => RefreshIndicator(
        onRefresh: () => ref.read(orderDashboardProvider.notifier).refresh(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Order Dashboard Overview',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Real-time statistics and status of all orders within the current active shift.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 32),
              _buildStatsCards(state),
              const SizedBox(height: 32),
              _buildReadyToServeSection(ref, state),
            ],
          ),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }

  Widget _buildStatsCards(OrderDashboardState dashboardState) {
    final int completedCount = _getUniqueOrderCount(dashboardState.completedOrders);
    final int pendingCount = _getUniqueOrderCount(dashboardState.pendingOrders);
    final int confirmedCount = _getUniqueOrderCount(dashboardState.confirmedOrders);
    final int cancelledCount = _getUniqueOrderCount(dashboardState.cancelledOrders);

    return Row(
      children: [
        _buildStatCard(
          title: 'Completed',
          value: completedCount.toString(),
          icon: Icons.check_circle_rounded,
          color: Colors.green,
        ),
        const SizedBox(width: 16),
        _buildStatCard(
          title: 'Pending',
          value: pendingCount.toString(),
          icon: Icons.pending_actions_rounded,
          color: Colors.orange,
          isBlinking: pendingCount > 0,
        ),
        const SizedBox(width: 16),
        _buildStatCard(
          title: 'Confirmed',
          value: confirmedCount.toString(),
          icon: Icons.verified_rounded,
          color: Colors.blue,
        ),
        const SizedBox(width: 16),
        _buildStatCard(
          title: 'Cancelled',
          value: cancelledCount.toString(),
          icon: Icons.cancel_rounded,
          color: Colors.red,
        ),
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

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    bool isBlinking = false,
  }) {
    Widget card = Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          if (isBlinking) ...[
            const Spacer(),
            _BlinkingDot(color: color),
          ],
        ],
      ),
    );

    return Expanded(child: card);
  }

  Widget _buildReadyToServeSection(WidgetRef ref, OrderDashboardState dashboardState) {
    final List<OrderDetailModel> readyItems = dashboardState.confirmedOrders
        .where((item) => item.itemStatus == 'Ready')
        .toList();

    return _buildSectionContainer(
      title: 'Ready to Serve',
      description: 'Items that are prepared and ready for delivery to tables',
      onRefresh: () => ref.read(orderDashboardProvider.notifier).refresh(),
      child: readyItems.isEmpty
          ? _buildEmptyState('No items ready to serve')
          : _buildReadyToServeTable(readyItems),
    );
  }

  Widget _buildSectionContainer({
    required String title,
    required String description,
    required VoidCallback onRefresh,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: onRefresh,
                icon: const Icon(Icons.refresh, color: AppColors.primary),
                tooltip: 'Refresh section',
              ),
            ],
          ),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }

  Widget _buildReadyToServeTable(List<OrderDetailModel> items) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(50),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(1.5),
        3: FlexColumnWidth(1.5),
        4: FlexColumnWidth(1.5),
      },
      children: [
        _buildTableHeader(['SN', 'Item', 'OrderID', 'Table', 'Status']),
        ...items.asMap().entries.map((entry) {
          final int index = entry.key;
          final OrderDetailModel item = entry.value;
          return _buildTableRow([
            (index + 1).toString(),
            item.productName ?? 'N/A',
            '#${item.orderID}',
            item.tableNumber ?? 'N/A',
            item.itemStatus ?? 'Ready',
          ], isReady: true);
        }),
      ],
    );
  }

  TableRow _buildTableHeader(List<String> labels) {
    return TableRow(
      decoration: const BoxDecoration(
        color: AppColors.bg,
      ),
      children: labels.map((label) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.grey,
            fontSize: 13,
          ),
        ),
      )).toList(),
    );
  }

  TableRow _buildTableRow(List<String> values, {bool isReady = false, bool isStatusColumn = false, bool isSuccess = false}) {
    return TableRow(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.lightGrey)),
      ),
      children: values.asMap().entries.map((entry) {
        final int index = entry.key;
        final String value = entry.value;
        
        Widget cellContent = Text(
          value,
          style: const TextStyle(fontSize: 14, color: AppColors.black),
        );

        // Styling for Status column (Index 6 in Confirmed Table, Index 4 in Ready Table)
        if ((isReady && index == 4) || (isStatusColumn && index == 6)) {
          final bool isPositive = isReady || isSuccess;
          cellContent = Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: (isPositive ? Colors.green : Colors.orange).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isPositive ? Colors.green : Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: cellContent,
        );
      }).toList(),
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            const Icon(Icons.inbox_rounded, size: 48, color: AppColors.lightGrey),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(color: AppColors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
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
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
