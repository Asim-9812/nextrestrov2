import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/orders/presentation/providers/manage_orders_provider.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/orders/presentation/pages/landscape/widgets/common/checkout_preview_landscape_dialog.dart';
import 'package:nextrestro/features/orders/data/repositories/order_repository_impl.dart';
import 'package:logger/logger.dart';

class ManageOrdersDetailsPanel extends ConsumerWidget {
  const ManageOrdersDetailsPanel({super.key});

  static final _logger = Logger();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsAsync = ref.watch(selectedOrderDetailsProvider);

    return detailsAsync.when(
      data: (items) {
        if (items == null || items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.touch_app_outlined, size: 48, color: AppColors.ashGrey.withValues(alpha: 0.5)),
                const SizedBox(height: 16),
                const Text('Select an order to view details', style: TextStyle(color: AppColors.grey)),
              ],
            ),
          );
        }
        final order = items.first;
        final allServed = items.every((item) => item.itemStatus == 'Served');

        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(order),
              const Divider(height: 48, color: AppColors.ashGrey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.list_alt, size: 18, color: AppColors.primary),
                      const SizedBox(width: 8),
                      const Text('Order Items', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.black)),
                    ],
                  ),
                  if (allServed)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.done_all, size: 14, color: AppColors.success),
                          SizedBox(width: 6),
                          Text('ALL SERVED', style: TextStyle(color: AppColors.success, fontSize: 10, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(child: _buildItemsList(context, ref, items)),
              const Divider(height: 48, color: AppColors.ashGrey),
              _buildActionButtons(context, ref, order, items),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
      error: (err, _) => Center(child: Text('Error: $err', style: const TextStyle(color: AppColors.error))),
    );
  }

  Widget _buildHeader(OrderDetailModel order) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.confirmation_number, size: 18, color: AppColors.primary),
                const SizedBox(width: 8),
                Text('Order #${order.orderID}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 14, color: AppColors.grey),
                const SizedBox(width: 4),
                Text('${order.tableNumber}', style: const TextStyle(color: AppColors.grey, fontSize: 13)),
              ],
            ),
          ],
        ),
        if (order.customerName != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.person_outline, size: 16, color: AppColors.primary),
                const SizedBox(width: 6),
                Text(order.customerName!, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 12)),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildItemsList(BuildContext context, WidgetRef ref, List<OrderDetailModel> items) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) => const Divider(height: 24, color: AppColors.ashGrey),
      itemBuilder: (context, index) {
        final item = items[index];
        final isServed = item.itemStatus == 'Served';
        final isCancelled = item.itemStatus == 'Cancelled';

        return Opacity(
          opacity: (isServed || isCancelled) ? 0.6 : 1.0,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (isServed ? AppColors.grey : AppColors.primary).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getProductIcon(item.productName ?? ''),
                  size: 18,
                  color: isServed ? AppColors.grey : AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.productName ?? 'Unknown',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.black,
                        decoration: (isServed || isCancelled) ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    if (item.specialInstructions != null && item.specialInstructions!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: [
                            const Icon(Icons.note_alt_outlined, size: 12, color: AppColors.warning),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                item.specialInstructions!,
                                style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: AppColors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.ashGrey.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text('x${item.quantity}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.blackGrey)),
              ),
              const SizedBox(width: 16),
              _buildItemStatusBadge(item.itemStatus ?? 'Pending'),
              const SizedBox(width: 16),
              _buildItemActions(context, ref, item),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItemStatusBadge(String status) {
    Color color = AppColors.grey;
    if (status == 'Ready') color = AppColors.success;
    if (status == 'Served') color = AppColors.info;
    if (status == 'Cancelled') color = AppColors.error;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 0.5),
      ),
    );
  }

  Widget _buildItemActions(BuildContext context, WidgetRef ref, OrderDetailModel item) {
    final status = item.itemStatus ?? 'Pending';
    final isLoading = ref.watch(manageOrdersItemLoadingProvider).contains(item.productId);

    if (status == 'Served') {
      return const SizedBox(
        width: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 16, color: AppColors.success),
            SizedBox(width: 4),
            Text('SERVED', style: TextStyle(color: AppColors.success, fontSize: 9, fontWeight: FontWeight.bold)),
          ],
        ),
      );
    }
    if (status == 'Cancelled') {
      return const SizedBox(
        width: 80,
        child: Center(
          child: Text('CANCELLED', style: TextStyle(color: AppColors.error, fontSize: 9, fontWeight: FontWeight.bold)),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: isLoading 
              ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.error))
              : const Icon(Icons.cancel_outlined, color: AppColors.error, size: 20),
          onPressed: isLoading ? null : () => _confirmUpdateStatus(context, ref, item, 'Cancelled'),
          tooltip: 'Cancel Item',
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
        ),
        if (status == 'Pending')
          IconButton(
            icon: isLoading 
                ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.success))
                : const Icon(Icons.check_circle_outline, color: AppColors.success, size: 20),
            onPressed: isLoading ? null : () => _confirmUpdateStatus(context, ref, item, 'Ready'),
            tooltip: 'Mark as Ready',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        if (status == 'Ready')
          SizedBox(
            height: 32,
            child: ElevatedButton.icon(
              onPressed: isLoading ? null : () => _confirmUpdateStatus(context, ref, item, 'Served'),
              icon: isLoading 
                  ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Icon(Icons.delivery_dining, size: 14),
              label: const Text('SERVE', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.info,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ),
      ],
    );
  }

  void _confirmUpdateStatus(BuildContext context, WidgetRef ref, OrderDetailModel item, String newStatus) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Update to $newStatus?', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        content: Text('Set ${item.productName} status to $newStatus?', style: const TextStyle(fontSize: 14)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL', style: TextStyle(color: AppColors.grey)),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              
              final productId = item.productId ?? 0;
              ref.read(manageOrdersItemLoadingProvider.notifier).set(productId, true);
              
              try {
                _logger.i('Updating item $productId status to $newStatus');
                await ref.read(orderDashboardProvider.notifier).updateOrderItemStatus(productId, item.orderID ?? 0, newStatus);
                
                // Force refresh
                await ref.read(orderDashboardProvider.notifier).refresh();
                
                // Wait for the next data event from the stream to ensure the list is updated
                // Use .future to wait for the first non-loading emission
                await ref.read(orderDashboardProvider.future);
                
                if (context.mounted) {
                  Toaster.success(context: context, message: 'Item updated to $newStatus', isLandscape: true);
                }
              } finally {
                ref.read(manageOrdersItemLoadingProvider.notifier).set(productId, false);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: newStatus == 'Cancelled' ? AppColors.error : AppColors.primary,
              foregroundColor: Colors.white,
            ),
            child: const Text('CONFIRM'),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, WidgetRef ref, OrderDetailModel order, List<OrderDetailModel> items) {
    final orderStatus = order.orderStatus ?? 'Confirmed';
    final isCompleted = orderStatus == 'Completed';
    final allServed = items.every((item) => item.itemStatus == 'Served');
    final allReady = items.every((item) => item.itemStatus == 'Ready' || item.itemStatus == 'Served');
    final bulkLoadingAction = ref.watch(manageOrdersBulkLoadingProvider);

    return Column(
      children: [
        if (!isCompleted && !allServed)
          Row(
            children: [
              if (!allReady)
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: bulkLoadingAction != null ? null : () => _confirmMarkAllReady(context, ref, order, items),
                    icon: bulkLoadingAction == 'Ready' 
                        ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                        : const Icon(Icons.restaurant, size: 18),
                    label: const Text('MARK ALL READY', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              if (!allReady) const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: bulkLoadingAction != null ? null : () => _confirmMarkAllServed(context, ref, order, items),
                  icon: bulkLoadingAction == 'Served'
                      ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                      : const Icon(Icons.done_all, size: 18),
                  label: const Text('MARK ALL SERVED', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.info,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ],
          ),
        if (!isCompleted && !allServed) const SizedBox(height: 12),
        if (!isCompleted)
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _confirmUpdateOrderStatus(context, ref, order, 'Cancelled'),
                  icon: const Icon(Icons.close, size: 18),
                  label: const Text('CANCEL ORDER', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.error,
                    side: const BorderSide(color: AppColors.error),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ],
          ),
        if (isCompleted)
        Row(
          children: [



              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _showDiscountDialog(context, ref, order),
                  icon: const Icon(Icons.shopping_cart_checkout, size: 18),
                  label: const Text('GO TO CHECKOUT', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  void _confirmMarkAllServed(BuildContext context, WidgetRef ref, OrderDetailModel order, List<OrderDetailModel> items) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Mark all as served?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        content: Text('This will set all items in Order #${order.orderID} to "Served".',
            style: const TextStyle(fontSize: 14)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL', style: TextStyle(color: AppColors.grey)),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              ref.read(manageOrdersBulkLoadingProvider.notifier).set('Served');
              try {
                await ref.read(orderDashboardProvider.notifier).markAllItemsAsServed(order.orderID ?? 0, items);
                
                // Force refresh and wait for the new state from the future
                await ref.read(orderDashboardProvider.notifier).refresh();
                await ref.read(orderDashboardProvider.future);
                
                if (context.mounted) {
                  Toaster.success(context: context, message: 'All items marked as served', isLandscape: true);
                }
              } finally {
                ref.read(manageOrdersBulkLoadingProvider.notifier).set(null);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.success,
              foregroundColor: Colors.white,
            ),
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
        title: const Text('Mark all as ready?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        content: Text('This will set all items in Order #${order.orderID} to "Ready".',
            style: const TextStyle(fontSize: 14)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL', style: TextStyle(color: AppColors.grey)),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              ref.read(manageOrdersBulkLoadingProvider.notifier).set('Ready');
              try {
                await ref.read(orderDashboardProvider.notifier).markAllItemsAsReady(order.orderID ?? 0, items);
                
                // Force refresh and wait for the new state from the future
                await ref.read(orderDashboardProvider.notifier).refresh();
                await ref.read(orderDashboardProvider.future);

                if (context.mounted) {
                  Toaster.success(context: context, message: 'All items marked as ready', isLandscape: true);
                }
              } finally {
                ref.read(manageOrdersBulkLoadingProvider.notifier).set(null);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            ),
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
        title: Text('Update Order to $newStatus?', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        content: Text('Set Order #${order.orderID} status to $newStatus?', style: const TextStyle(fontSize: 14)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL', style: TextStyle(color: AppColors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              _logger.i('Updating order #${order.orderID} status to $newStatus');
              ref.read(orderDashboardProvider.notifier).updateOrderStatus(order.orderID ?? 0, newStatus);
              Navigator.pop(context);
              Toaster.success(context: context, message: 'Order updated to $newStatus', isLandscape: true);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: newStatus == 'Cancelled' ? AppColors.error : AppColors.primary,
              foregroundColor: Colors.white,
            ),
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
                                    Toaster.error(context: context, message: failure.message, isLandscape: true);
                                  },
                                  (preview) {
                                    Navigator.pop(context);
                                    showDialog(
                                      context: context,
                                      builder: (context) => CheckoutPreviewLandscapeDialog(preview: preview, discount: _discountValue),
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
