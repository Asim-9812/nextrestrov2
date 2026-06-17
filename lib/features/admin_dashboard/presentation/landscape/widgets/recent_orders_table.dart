import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/time_formatter.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';

class RecentOrdersTable extends StatelessWidget {
  final List<GroupedOrder> orders;

  const RecentOrdersTable({
    super.key,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.border),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: _buildTableHeader('Order ID'),
                ),
                Expanded(
                  flex: 1,
                  child: _buildTableHeader('Table'),
                ),
                Expanded(
                  flex: 2,
                  child: _buildTableHeader('Items'),
                ),
                Expanded(
                  flex: 1,
                  child: _buildTableHeader('Date'),
                ),
                Expanded(
                  flex: 1,
                  child: _buildTableHeader('Status'),
                ),

              ],
            ),
          ),
          if (orders.isEmpty)
            const Padding(
              padding: EdgeInsets.all(32),
              child: Text('No orders found'),
            )
          else
            ...orders.map(
              (order) => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.border),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('#${order.orderId}'),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(order.tableNumber),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('${order.itemCount} items'),
                    ),

                    Expanded(
                      flex: 1,
                      child: Text(
                        TimeFormatter.formatTimeAgo(order.date.toIso8601String()),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(order.status).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          order.status,
                          style: TextStyle(
                            fontSize: 11,
                            color: _getStatusColor(order.status),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'confirmed':
        return Colors.blue;
      case 'pending':
        return AppColors.primary;
      default:
        return AppColors.grey;
    }
  }

  Widget _buildTableHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
    );
  }
}
