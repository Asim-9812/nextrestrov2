import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/features/shift/presentation/landscape/widgets/expanded_shift_orders_dialog.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spacing.dart';

class ShiftOrdersTable extends StatelessWidget {
  final List<GroupedOrder> orders;
  final VoidCallback? onRefresh;
  const ShiftOrdersTable({super.key, required this.orders, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: isLight ? Colors.white : AppColors.blackGrey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Shift Orders',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  if (onRefresh != null) ...[
                    IconButton(
                      onPressed: onRefresh,
                      icon: const Icon(Icons.refresh_rounded, size: 20),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                        foregroundColor: AppColors.primary,
                        padding: const EdgeInsets.all(8),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  IconButton(
                    onPressed: () => _showExpandedTable(context),
                    icon: const Icon(Icons.open_in_full_rounded, size: 20),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                      foregroundColor: AppColors.primary,
                      padding: const EdgeInsets.all(8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildHeader(),
          const Divider(height: 1),
          if (orders.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(
                child: Text('No orders found for this shift', style: TextStyle(color: Colors.grey)),
              ),
            )
          else
            ...orders.take(5).map((order) => _buildOrderRow(
                  '#${order.orderId}',
                  '${order.tableNumber} • ${order.items.first.floorName ?? 'N/A'}',
                  DateFormat('dd MMM yyyy').format(order.date),
                )),
          if (orders.length > 5)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Center(
                child: TextButton(
                  onPressed: () => _showExpandedTable(context),
                  child: Text('View All ${orders.length} Orders'),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showExpandedTable(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Shift Orders',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return ExpandedShiftOrdersDialog(orders: orders);
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 8,
      ),
      child: const Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Order ID',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Table / Floor',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderRow(
    String orderId,
    String tableFloor,
    String date,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  orderId,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(tableFloor),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  date,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey.withValues(alpha: 0.1),
        ),
      ],
    );
  }
}
