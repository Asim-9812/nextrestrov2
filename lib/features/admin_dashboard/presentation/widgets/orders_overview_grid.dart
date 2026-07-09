import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';

class OrdersOverviewGrid extends StatelessWidget {
  final List<GroupedOrder> orders;

  const OrdersOverviewGrid({
    super.key,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    final completedCount = orders.where((o) => o.status.toLowerCase() == 'completed').length;
    final pendingCount = orders.where((o) => o.status.toLowerCase() == 'pending').length;
    final cancelledCount = orders.where((o) => o.status.toLowerCase() == 'cancelled').length;

    return Container(
      height: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Orders Overview',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          // const SizedBox(height: 24),
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 2.5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildOrderStatCard(
                icon: Icons.check_circle_outline,
                iconColor: Colors.green,
                label: 'Completed',
                value: completedCount.toString(),
                percentage: '+ 14.3%',
                isPositive: true,
              ),
              _buildOrderStatCard(
                icon: Icons.access_time,
                iconColor: Colors.orange,
                label: 'Pending',
                value: pendingCount.toString(),
                percentage: '33.3%',
                isPositive: false,
              ),
              _buildOrderStatCard(
                icon: Icons.cancel_outlined,
                iconColor: Colors.red,
                label: 'Cancelled',
                value: cancelledCount.toString(),
                percentage: '+ 100%',
                isPositive: true,
              ),
              _buildOrderStatCard(
                icon: Icons.timer_outlined,
                iconColor: Colors.blue,
                label: 'Avg. Prep Time',
                value: '18 min',
                percentage: '5 min',
                isPositive: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderStatCard({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required String percentage,
    required bool isPositive,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 18),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Row(
                  children: [
                    Icon(
                      isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 10,
                      color: isPositive ? Colors.green : Colors.red,
                    ),
                    Text(
                      percentage,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: isPositive ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
