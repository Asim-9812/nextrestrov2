import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/orders/data/repositories/order_repository_impl.dart';
import 'package:nextrestro/features/orders/presentation/pages/portrait/widgets/common/checkout_preview_portrait_dialog.dart';

class ConfirmedOrderDetailsPortraitPage extends ConsumerWidget {
  const ConfirmedOrderDetailsPortraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsAsync = ref.watch(selectedOrderDetailsProvider);

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('Order Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: detailsAsync.when(
        data: (items) {
          if (items == null || items.isEmpty) {
            return const Center(child: Text('No details found for this order.'));
          }
          final order = items.first;
          final allServed = items.every((item) => item.itemStatus == 'Served');

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(order, allServed),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          const Icon(Icons.list_alt, size: 18, color: AppColors.primary),
                          const SizedBox(width: 8),
                          const Text('Order Items', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.black)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildItemsList(context, ref, items),
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
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
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
                  Text('Order #${order.orderID}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black)),
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
              if (allServed)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('ALL SERVED', style: TextStyle(color: AppColors.success, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
          if (order.customerName != null) ...[
            const SizedBox(height: 12),
            const Divider(height: 1),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.person_outline, size: 16, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(order.customerName!, style: const TextStyle(color: AppColors.black, fontWeight: FontWeight.w600, fontSize: 14)),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildItemsList(BuildContext context, WidgetRef ref, List<OrderDetailModel> items) {
    return Column(
      children: items.map((item) {
        final isServed = item.itemStatus == 'Served';
        return Opacity(
          opacity: isServed ? 0.6 : 1.0,
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (isServed ? AppColors.grey : AppColors.primary).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(_getProductIcon(item.productName ?? ''), size: 18, color: isServed ? AppColors.grey : AppColors.primary),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.productName ?? 'Unknown',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              decoration: isServed ? TextDecoration.lineThrough : null,
                            ),
                          ),
                          if (item.specialInstructions != null && item.specialInstructions!.isNotEmpty)
                            Text(item.specialInstructions!, style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: AppColors.grey)),
                        ],
                      ),
                    ),
                    Text('x${item.quantity}', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.blackGrey)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildItemStatusBadge(item.itemStatus ?? 'Pending'),
                    _buildItemActions(context, ref, item),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildItemStatusBadge(String status) {
    Color color = AppColors.grey;
    if (status == 'Ready') color = AppColors.success;
    if (status == 'Served') color = AppColors.info;

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
    if (status == 'Served') return const Icon(Icons.check_circle, size: 20, color: AppColors.success);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (status == 'Pending')
          IconButton(
            icon: const Icon(Icons.cancel_outlined, color: AppColors.error, size: 22),
            onPressed: () => _confirmUpdateStatus(context, ref, item, 'Cancelled'),
          ),
        if (status == 'Pending')
          IconButton(
            icon: const Icon(Icons.check_circle_outline, color: AppColors.success, size: 22),
            onPressed: () => _confirmUpdateStatus(context, ref, item, 'Ready'),
          ),
        if (status == 'Ready')
          ElevatedButton(
            onPressed: () => _confirmUpdateStatus(context, ref, item, 'Served'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.info,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('SERVE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
      ],
    );
  }

  void _confirmUpdateStatus(BuildContext context, WidgetRef ref, OrderDetailModel item, String newStatus) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Update status?', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        content: Text('Set ${item.productName} to $newStatus?', style: const TextStyle(fontSize: 14)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('CANCEL')),
          TextButton(
            onPressed: () {
              ref.read(orderDashboardProvider.notifier).updateOrderItemStatus(item.productId ?? 0, item.orderID ?? 0, newStatus);
              Navigator.pop(context);
            },
            child: const Text('CONFIRM'),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, WidgetRef ref, OrderDetailModel order, List<OrderDetailModel> items) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -4)),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _confirmMarkAllServed(context, ref, order, items),
                icon: const Icon(Icons.done_all),
                label: const Text('MARK ALL SERVED', style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.info,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      side: const BorderSide(color: AppColors.error),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('CANCEL', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _showDiscountDialog(context, ref, order),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('COMPLETE', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
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
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await ref.read(orderDashboardProvider.notifier).markAllItemsAsServed(order.orderID ?? 0, items);
              if (context.mounted) Toaster.success(context: context, message: 'All items marked as served');
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
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('ORDER DISCOUNT', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary)),
            const SizedBox(height: 16),
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
            const SizedBox(height: 20),
            _buildNumpad(),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('CANCEL', style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      return ElevatedButton(
                        onPressed: () async {
                          final result = await ref.read(orderRepositoryProvider).getOrderPreview(widget.orderId, _discountValue);
                          result.fold(
                            (failure) => Toaster.error(context: context, message: failure.message),
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
                        child: const Text('CHECKOUT', style: TextStyle(fontWeight: FontWeight.bold)),
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
        Row(children: [_numpadButton('1'), _numpadButton('2'), _numpadButton('3')]),
        Row(children: [_numpadButton('4'), _numpadButton('5'), _numpadButton('6')]),
        Row(children: [_numpadButton('7'), _numpadButton('8'), _numpadButton('9')]),
        Row(children: [_numpadButton('.'), _numpadButton('0'), _numpadButton('C', color: AppColors.error)]),
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
            padding: const EdgeInsets.all(12),
            foregroundColor: color ?? AppColors.blackGrey,
            side: const BorderSide(color: AppColors.ashGrey),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
