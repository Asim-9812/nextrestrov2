import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';

import '../../../../../core/utils/time_formatter.dart';


class ExpandedShiftOrdersDialog extends StatelessWidget {
  final List<GroupedOrder> orders;

  const ExpandedShiftOrdersDialog({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    final size = MediaQuery.of(context).size;

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: size.width * 0.85,
          height: size.height * 0.85,
          decoration: BoxDecoration(
            color: isLight ? Colors.white : AppColors.blackGrey,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      _buildTableHeader(),
                      const Divider(height: 1),
                      if (orders.isEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 64),
                          child: Center(
                            child: Text(
                              'No orders found for this shift',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        )
                      else
                        ...orders.map((order) => _buildOrderRow(order)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detailed Shift Orders',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                'Comprehensive view of all shift transactions',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close_rounded),
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey.withValues(alpha: 0.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      color: Colors.grey.withValues(alpha: 0.05),
      child: const Row(
        children: [
          Expanded(flex: 2, child: _HeaderText('Order ID')),
          Expanded(flex: 3, child: _HeaderText('Table / Floor')),
          Expanded(flex: 1, child: _HeaderText('Items')),
          Expanded(flex: 3, child: _HeaderText('Date & Time')),
          Expanded(flex: 2, child: _HeaderText('Served By')),
          Expanded(flex: 2, child: _HeaderText('Settled By')),
          SizedBox(width: 50, child: _HeaderText('Action')),
        ],
      ),
    );
  }

  Widget _buildOrderRow(GroupedOrder order) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withValues(alpha: 0.1)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '#${order.orderId}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text('${order.tableNumber} • ${order.items.first.floorName ?? 'N/A'}'),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '${order.items.length}',
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(TimeFormatter.formatFullDate(order.date.toIso8601String())),
          ),
          const Expanded(
            flex: 2,
            child: Text('John Doe'), // Static as requested
          ),
          const Expanded(
            flex: 2,
            child: Text('Sarah Smith'), // Static as requested
          ),
          SizedBox(
            width: 50,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.visibility_outlined, size: 20),
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  final String text;
  const _HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 13,
        color: Colors.grey,
      ),
    );
  }
}
