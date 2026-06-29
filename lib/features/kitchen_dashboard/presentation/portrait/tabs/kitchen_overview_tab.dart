import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_state.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/potrait/widgets/portrait_shift_header.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_provider.dart';
import 'package:nextrestro/features/waiter_dashboard/presentation/widgets/waiter_shift_details_card.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/landscape/widgets/active_shift_card.dart';

class KitchenOverviewTab extends ConsumerWidget {
  const KitchenOverviewTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(orderDashboardProvider);
    final shiftState = ref.watch(shiftControllerProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isLandscape = constraints.maxWidth > 600;

        return shiftState.when(
          data: (data) {
            final shift = data.$1;
            final openerName = data.$2;

            if (shift == null) {
              return const Center(child: Text('No active shift', style: TextStyle(color: AppColors.grey)));
            }

            return RefreshIndicator(
              onRefresh: () => ref.read(orderDashboardProvider.notifier).refresh(),
              color: AppColors.primary,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (isLandscape) ...[
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ActiveShiftCard(
                              shift: shift,
                              openerName: openerName,
                            ),
                            const SizedBox(height: 32),
                            const Text(
                              'Overview',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildSummaryGrid(true, dashboardAsync),
                            const SizedBox(height: 32),
                            const Text(
                              'Recent Orders',
                              style: TextStyle(
                                fontSize: 18, 
                                fontWeight: FontWeight.bold, 
                                color: AppColors.black,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildRecentOrdersList(true, dashboardAsync),
                          ],
                        ),
                      ),
                    ] else ...[
                      const SizedBox(height: 12),
                      PortraitShiftHeader(shift: shift),
                      const SizedBox(height: 12),
                      WaiterShiftDetailsCard(
                        shift: shift,
                        openerName: openerName,
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: _buildSummaryGrid(false, dashboardAsync),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Live Preparation Feed',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.black),
                            ),
                            const SizedBox(height: 12),
                            _buildRecentOrdersList(false, dashboardAsync),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ],
                ),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        );
      },
    );
  }

  Widget _buildSummaryGrid(bool isLandscape, AsyncValue<OrderDashboardState> dashboardAsync) {
    return dashboardAsync.when(
      data: (state) {
        final cards = [
          _buildProfessionalCard('TO PREPARE', state.confirmedOrders.length.toString(), Icons.pending_actions, AppColors.warning),
          _buildProfessionalCard('IN PROGRESS', state.pendingOrders.length.toString(), Icons.restaurant, AppColors.info),
          _buildProfessionalCard('READY', state.readyOrders.length.toString(), Icons.check_circle, AppColors.success),
          _buildProfessionalCard('COMPLETED', state.completedOrders.length.toString(), Icons.task_alt, AppColors.grey),
        ];

        if (isLandscape) {
          // Matching Admin style: stretching cards in a Row for Landscape
          return Row(
            children: cards.map((card) => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: card,
              ),
            )).toList(),
          );
        }

        // Keep horizontal scroll for Portrait to prevent text wrapping/overflow
        return SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: cards.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) => SizedBox(
              width: 150,
              child: cards[index],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err', style: const TextStyle(color: AppColors.error))),
    );
  }

  Widget _buildProfessionalCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero, // Remove default card margin to save space
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [color.withValues(alpha: 0.1), color.withValues(alpha: 0.05)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: color.withValues(alpha: 0.1)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Reduced horizontal padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(6), // Reduced icon padding
                child: Icon(icon, color: color, size: 20), // Reduced icon size
              ),
              const SizedBox(width: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16, // Slightly smaller value font
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10, // Slightly smaller title font
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentOrdersList(bool isLandscape, AsyncValue<OrderDashboardState> dashboardAsync) {
    return dashboardAsync.when(
      data: (state) {
        final allOrders = [...state.confirmedOrders, ...state.pendingOrders, ...state.readyOrders];
        if (allOrders.isEmpty) {
          return const Center(child: Text('No active preparation queue', style: TextStyle(color: AppColors.grey, fontSize: 13)));
        }

        allOrders.sort((a, b) => (b.orderID ?? 0).compareTo(a.orderID ?? 0));
        final displayOrders = allOrders.take(10).toList();

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isLandscape ? 2 : 1,
            mainAxisExtent: 80,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemCount: displayOrders.length,
          itemBuilder: (context, index) => _buildOrderTile(displayOrders[index]),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildOrderTile(dynamic order) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.ashGrey.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: AppColors.bg, borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.receipt_long, size: 20, color: AppColors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Order #${order.orderID}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text('Table ${order.tableNumber} • ${order.productName}', style: const TextStyle(color: AppColors.grey, fontSize: 12)),
              ],
            ),
          ),
          _buildStatusTag(order.itemStatus ?? 'Pending'),
        ],
      ),
    );
  }

  Widget _buildStatusTag(String status) {
    Color color = AppColors.grey;
    if (status == 'Pending') color = AppColors.warning;
    if (status == 'Ready') color = AppColors.success;
    if (status == 'Confirmed') color = AppColors.info;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.bold),
      ),
    );
  }
}
