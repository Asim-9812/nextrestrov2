import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/orders/presentation/providers/manage_orders_provider.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/orders/presentation/pages/portrait/widgets/common/checkout_preview_portrait_dialog.dart';
import 'package:nextrestro/features/orders/data/repositories/order_repository_impl.dart';
import 'package:logger/logger.dart';

class ManageOrdersDetailsPortraitPage extends ConsumerWidget {
  const ManageOrdersDetailsPortraitPage({super.key});

  static final _logger = Logger();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsAsync = ref.watch(selectedOrderDetailsProvider);

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 1,
        title: const Text('Order Details', style: TextStyle(color: AppColors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: detailsAsync.when(
        skipLoadingOnRefresh: true,
        data: (items) {
          if (items == null || items.isEmpty) {
            return const Center(child: Text('No details available', style: TextStyle(color: AppColors.grey)));
          }
          final order = items.first;
          final allServed = items.every((item) => item.itemStatus == 'Served');

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(order, allServed),
                      const SizedBox(height: 24),
                      const Text('Order Items', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.black)),
                      const SizedBox(height: 12),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        separatorBuilder: (context, index) => const Divider(height: 1),
                        itemBuilder: (context, index) => _buildItemRow(context, ref, items[index]),
                      ),
                    ],
                  ),
                ),
              ),
              _buildActionButtons(context, ref, order, items),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
        error: (err, _) => Center(child: Text('Error: $err', style: const TextStyle(color: AppColors.error))),
      ),
    );
  }

  Widget _buildHeader(OrderDetailModel order, bool allServed) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order #${order.orderID}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black)),
                  const SizedBox(height: 4),
                  Text('Table ${order.tableNumber}', style: const TextStyle(color: AppColors.grey, fontSize: 14)),
                ],
              ),
              if (allServed)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.success.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(6)),
                  child: const Text('ALL SERVED', style: TextStyle(color: AppColors.success, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
          if (order.customerName != null) ...[
            const Divider(height: 24),
            Row(
              children: [
                const Icon(Icons.person_outline, size: 16, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(order.customerName!, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildItemRow(BuildContext context, WidgetRef ref, OrderDetailModel item) {
    final status = item.itemStatus ?? 'Pending';
    final isLoading = ref.watch(manageOrdersItemLoadingProvider).contains(item.productId);
    final isServed = status == 'Served';
    final isCancelled = status == 'Cancelled';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Opacity(
        opacity: (isServed || isCancelled) ? 0.6 : 1.0,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.productName ?? 'Unknown', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, decoration: (isServed || isCancelled) ? TextDecoration.lineThrough : null)),
                  const SizedBox(height: 4),
                  Text('x${item.quantity}', style: const TextStyle(fontSize: 12, color: AppColors.grey)),
                  if (item.specialInstructions?.isNotEmpty ?? false)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(item.specialInstructions!, style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: AppColors.warning)),
                    ),
                ],
              ),
            ),
            _buildItemStatusBadge(status),
            const SizedBox(width: 12),
            _buildItemActions(context, ref, item, status, isLoading),
          ],
        ),
      ),
    );
  }

  Widget _buildItemStatusBadge(String status) {
    Color color = AppColors.grey;
    if (status == 'Ready') color = AppColors.success;
    if (status == 'Served') color = AppColors.info;
    if (status == 'Cancelled') color = AppColors.error;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
      child: Text(status.toUpperCase(), style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildItemActions(BuildContext context, WidgetRef ref, OrderDetailModel item, String status, bool isLoading) {
    if (status == 'Served' || status == 'Cancelled') return const SizedBox(width: 32);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: isLoading ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.error)) : const Icon(Icons.cancel_outlined, color: AppColors.error, size: 20),
          onPressed: isLoading ? null : () => _confirmUpdateStatus(context, ref, item, 'Cancelled'),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
        ),
        if (status == 'Pending')
          IconButton(
            icon: isLoading ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.success)) : const Icon(Icons.check_circle_outline, color: AppColors.success, size: 20),
            onPressed: isLoading ? null : () => _confirmUpdateStatus(context, ref, item, 'Ready'),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        if (status == 'Ready')
          IconButton(
            icon: isLoading ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.info)) : const Icon(Icons.delivery_dining, color: AppColors.info, size: 20),
            onPressed: isLoading ? null : () => _confirmUpdateStatus(context, ref, item, 'Served'),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, WidgetRef ref, OrderDetailModel order, List<OrderDetailModel> items) {
    final orderStatus = order.orderStatus ?? 'Confirmed';
    final isCompleted = orderStatus == 'Completed';
    final allServed = items.every((item) => item.itemStatus == 'Served');
    final allReady = items.every((item) => item.itemStatus == 'Ready' || item.itemStatus == 'Served');
    final bulkLoadingAction = ref.watch(manageOrdersBulkLoadingProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: AppColors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))]),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isCompleted && !allServed) ...[
              Row(
                children: [
                  if (!allReady)
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: bulkLoadingAction != null ? null : () => _confirmMarkAllReady(context, ref, order, items),
                        icon: bulkLoadingAction == 'Ready' ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Icon(Icons.restaurant, size: 18),
                        label: const Text('MARK ALL READY', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                  if (!allReady) const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: bulkLoadingAction != null ? null : () => _confirmMarkAllServed(context, ref, order, items),
                      icon: bulkLoadingAction == 'Served' ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Icon(Icons.done_all, size: 18),
                      label: const Text('MARK ALL SERVED', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.info, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
            Row(
              children: [
                if (!isCompleted)
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: bulkLoadingAction != null ? null : () => _confirmUpdateOrderStatus(context, ref, order, 'Cancelled'),
                      icon: const Icon(Icons.close, size: 18),
                      label: const Text('CANCEL ORDER', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      style: OutlinedButton.styleFrom(foregroundColor: AppColors.error, side: const BorderSide(color: AppColors.error), padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                if (!isCompleted && isCompleted) const SizedBox(width: 12), // Placeholder for logic
                if (isCompleted)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _showDiscountDialog(context, ref, order),
                      icon: const Icon(Icons.shopping_cart_checkout, size: 18),
                      label: const Text('GO TO CHECKOUT', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.success, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _confirmUpdateStatus(BuildContext context, WidgetRef ref, OrderDetailModel item, String newStatus) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Update to $newStatus?', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        content: Text('Set ${item.productName} status to $newStatus?', style: const TextStyle(fontSize: 14)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('CANCEL')),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              final productId = item.productId ?? 0;
              ref.read(manageOrdersItemLoadingProvider.notifier).set(productId, true);
              try {
                await ref.read(orderDashboardProvider.notifier).updateOrderItemStatus(productId, item.orderID ?? 0, newStatus);
                
                await ref.read(orderDashboardProvider.notifier).refresh();
                
                // Wait for the next state from the future to ensure the list is updated
                await ref.read(orderDashboardProvider.future);

                if (context.mounted) Toaster.success(context: context, message: 'Item updated to $newStatus', isLandscape: false);
              } finally {
                ref.read(manageOrdersItemLoadingProvider.notifier).set(productId, false);
              }
            },
            child: const Text('CONFIRM'),
          ),
        ],
      ),
    );
  }

  void _confirmMarkAllServed(BuildContext context, WidgetRef ref, OrderDetailModel order, List<OrderDetailModel> items) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Mark all as served?'),
        content: Text('Set all items in Order #${order.orderID} to "Served"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('CANCEL')),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              ref.read(manageOrdersBulkLoadingProvider.notifier).set('Served');
              try {
                await ref.read(orderDashboardProvider.notifier).markAllItemsAsServed(order.orderID ?? 0, items);
                await ref.read(orderDashboardProvider.notifier).refresh();
                await ref.read(orderDashboardProvider.future);
                if (context.mounted) Toaster.success(context: context, message: 'All items marked as served', isLandscape: false);
              } finally {
                ref.read(manageOrdersBulkLoadingProvider.notifier).set(null);
              }
            },
            child: const Text('CONFIRM'),
          ),
        ],
      ),
    );
  }

  void _confirmMarkAllReady(BuildContext context, WidgetRef ref, OrderDetailModel order, List<OrderDetailModel> items) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Mark all as ready?'),
        content: Text('Set all items in Order #${order.orderID} to "Ready"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('CANCEL')),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              ref.read(manageOrdersBulkLoadingProvider.notifier).set('Ready');
              try {
                await ref.read(orderDashboardProvider.notifier).markAllItemsAsReady(order.orderID ?? 0, items);
                await ref.read(orderDashboardProvider.notifier).refresh();
                await ref.read(orderDashboardProvider.future);
                if (context.mounted) Toaster.success(context: context, message: 'All items marked as ready', isLandscape: false);
              } finally {
                ref.read(manageOrdersBulkLoadingProvider.notifier).set(null);
              }
            },
            child: const Text('CONFIRM'),
          ),
        ],
      ),
    );
  }

  void _confirmUpdateOrderStatus(BuildContext context, WidgetRef ref, OrderDetailModel order, String newStatus) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Update Order to $newStatus?'),
        content: Text('Set Order #${order.orderID} status to $newStatus?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('CANCEL')),
          ElevatedButton(
            onPressed: () {
              ref.read(orderDashboardProvider.notifier).updateOrderStatus(order.orderID ?? 0, newStatus);
              Navigator.pop(context);
              Toaster.success(context: context, message: 'Order updated to $newStatus', isLandscape: false);
            },
            child: const Text('CONFIRM'),
          ),
        ],
      ),
    );
  }

  void _showDiscountDialog(BuildContext context, WidgetRef ref, OrderDetailModel order) {
     showDialog(
      context: context,
      builder: (context) => DiscountDialog(orderId: order.orderID ?? 0, totalAmount: 0.0), 
    );
  }
}

class DiscountDialog extends StatefulWidget {
  final int orderId;
  final double totalAmount;
  const DiscountDialog({super.key, required this.orderId, required this.totalAmount});

  @override
  State<DiscountDialog> createState() => _DiscountDialogState();
}

class _DiscountDialogState extends State<DiscountDialog> {
  String _discountText = '0.00';
  bool _isPercentage = false;
  bool _isLoading = false;

  void _onNumpadPressed(String val) {
    setState(() {
      if (val == 'C') {
        _discountText = '0.00';
      } else if (val == '.') {
        if (!_discountText.contains('.')) _discountText += '.';
      } else {
        if (_discountText == '0.00') {
          _discountText = val;
        } else {
          _discountText += val;
        }
      }
    });
  }

  double get _discountValue {
    double val = double.tryParse(_discountText) ?? 0.0;
    if (_isPercentage) {
      return (val / 100) * widget.totalAmount;
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('ORDER DISCOUNT', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.ashGrey),
                borderRadius: BorderRadius.circular(12),
                color: AppColors.ashGrey.withValues(alpha: 0.1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_discountText, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.black)),
                  Text(_isPercentage ? '%' : 'Rs.', style: const TextStyle(fontSize: 18, color: AppColors.primary, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildNumpad(),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('CANCEL', style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      return ElevatedButton(
                        onPressed: _isLoading
                            ? null
                            : () async {
                                setState(() => _isLoading = true);
                                final repository = ref.read(orderRepositoryProvider);
                                final result = await repository.getOrderPreview(widget.orderId, _discountValue);
                                if (!mounted) return;
                                result.fold(
                                  (failure) {
                                    setState(() => _isLoading = false);
                                    Toaster.error(context: context, message: failure.message, isLandscape: false);
                                  },
                                  (preview) {
                                    Navigator.pop(context);
                                    showDialog(
                                      context: context,
                                      builder: (context) => CheckoutPreviewPortraitDialog(preview: preview, discount: _discountValue),
                                    );
                                  },
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('CHECKOUT', style: TextStyle(fontWeight: FontWeight.bold)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumpad() {
    return Column(
      children: [
        Row(
          children: [
            _numpadButton('1'), _numpadButton('2'), _numpadButton('3'),
          ],
        ),
        Row(
          children: [
            _numpadButton('4'), _numpadButton('5'), _numpadButton('6'),
          ],
        ),
        Row(
          children: [
            _numpadButton('7'), _numpadButton('8'), _numpadButton('9'),
          ],
        ),
        Row(
          children: [
            _numpadButton('.'), _numpadButton('0'), _numpadButton('C', color: AppColors.error),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _numpadButton(String text, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: OutlinedButton(
          onPressed: () => _onNumpadPressed(text),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            foregroundColor: color ?? AppColors.blackGrey,
            side: const BorderSide(color: AppColors.ashGrey),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
