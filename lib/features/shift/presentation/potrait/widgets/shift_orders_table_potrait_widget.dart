import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/core/utils/time_formatter.dart';

import '../../../../../core/constants/app_colors.dart';

class ShiftOrdersTablePortrait extends StatefulWidget {
  final List<GroupedOrder> orders;
  final VoidCallback? onRefresh;
  const ShiftOrdersTablePortrait({super.key, required this.orders, this.onRefresh});

  @override
  State<ShiftOrdersTablePortrait> createState() => _ShiftOrdersTablePortraitState();
}

class _ShiftOrdersTablePortraitState extends State<ShiftOrdersTablePortrait> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
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
                  fontSize: 12,
                ),
              ),
              Row(
                children: [
                  if (widget.onRefresh != null) ...[
                    IconButton(
                      onPressed: widget.onRefresh,
                      icon: const Icon(Icons.refresh_rounded, size: 16),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                        foregroundColor: AppColors.primary,
                        padding: const EdgeInsets.all(2),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  IconButton(
                    onPressed: () => setState(() => _isExpanded = !_isExpanded),
                    icon: Icon(_isExpanded ? Icons.close_fullscreen_rounded : Icons.open_in_full_rounded, size: 16),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                      foregroundColor: AppColors.primary,
                      padding: const EdgeInsets.all(2),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (widget.orders.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(
                child: Text('No orders found for this shift', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
            )
          else if (_isExpanded)
            _buildExpandedTable()
          else
            _buildCollapsedTable(),
          if (!_isExpanded && widget.orders.length > 5)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Center(
                child: TextButton(
                  onPressed: () => setState(() => _isExpanded = true),
                  child: Text('View All ${widget.orders.length} Orders'),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCollapsedTable() {
    return Column(
      children: [
        _buildCollapsedHeader(),
        const Divider(height: 1),
        ...widget.orders.take(5).map((order) => _buildCollapsedOrderRow(
              '#${order.orderId}',
              '${order.tableNumber} • ${order.items.first.floorName ?? 'N/A'}',
              DateFormat('dd MMM yyyy').format(order.date),
            )),
      ],
    );
  }

  Widget _buildExpandedTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width - 56), // Adjusting for padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExpandedHeader(),
            const Divider(height: 1),
            ...widget.orders.map((order) => _buildExpandedOrderRow(order)),
          ],
        ),
      ),
    );
  }

  Widget _buildCollapsedHeader() {
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
                fontSize: 10,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Table / Floor',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsedOrderRow(
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
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  tableFloor,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  date,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                  ),
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

  Widget _buildExpandedHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: const Row(
        children: [
          SizedBox(width: 80, child: _HeaderText('Order ID')),
          SizedBox(width: 120, child: _HeaderText('Table / Floor')),
          SizedBox(width: 60, child: _HeaderText('Items')),
          SizedBox(width: 160, child: _HeaderText('Date & Time')),
          SizedBox(width: 100, child: _HeaderText('Served By')),
          SizedBox(width: 100, child: _HeaderText('Settled By')),
          SizedBox(width: 50, child: _HeaderText('Action')),
        ],
      ),
    );
  }

  Widget _buildExpandedOrderRow(GroupedOrder order) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            children: [
              SizedBox(
                width: 80,
                child: Text(
                  '#${order.orderId}',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                ),
              ),
              SizedBox(
                width: 120,
                child: Text(
                  '${order.tableNumber} • ${order.items.first.floorName ?? 'N/A'}',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                ),
              ),
              SizedBox(
                width: 60,
                child: Text(
                  '${order.items.length}',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(
                width: 160,
                child: Text(
                  TimeFormatter.formatFullDate(order.date.toIso8601String()),
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                ),
              ),
              const SizedBox(
                width: 100,
                child: Text('John Doe', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
              ),
              const SizedBox(
                width: 100,
                child: Text('Sarah Smith', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
              ),
              SizedBox(
                width: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_outlined, size: 18),
                  color: AppColors.primary,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
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

class _HeaderText extends StatelessWidget {
  final String text;
  const _HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 11,
        color: Colors.grey,
      ),
    );
  }
}
