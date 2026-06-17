import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:logger/logger.dart';

class PendingOrderDetailsLandscapePanel extends ConsumerWidget {
  const PendingOrderDetailsLandscapePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsAsync = ref.watch(selectedPendingOrderDetailsProvider);
    final logger = Logger();

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

        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(order),
              const Divider(height: 48, color: AppColors.ashGrey),
              Row(
                children: [
                  const Icon(Icons.list_alt, size: 18, color: AppColors.primary),
                  const SizedBox(width: 8),
                  const Text('Order Items', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.black)),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(child: _buildItemsList(context, ref, items)),
              const Divider(height: 48, color: AppColors.ashGrey),
              _buildActionButtons(context, ref, order, logger),
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

        return Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getProductIcon(item.productName ?? ''),
                size: 18,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productName ?? 'Unknown',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.black,
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
          ],
        );
      },
    );
  }

  Widget _buildActionButtons(BuildContext context, WidgetRef ref, OrderDetailModel order, Logger logger) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _confirmUpdateOrderStatus(context, ref, order, 'Cancelled', logger),
            icon: const Icon(Icons.close, size: 18),
            label: const Text('CANCEL ORDER', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.error,
              side: const BorderSide(color: AppColors.error),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _confirmUpdateOrderStatus(context, ref, order, 'Confirmed', logger),
            icon: const Icon(Icons.check_circle_outline, size: 18),
            label: const Text('CONFIRM ORDER', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.success,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }

  void _confirmUpdateOrderStatus(BuildContext context, WidgetRef ref, OrderDetailModel order, String newStatus, Logger logger) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(newStatus == 'Cancelled' ? 'Cancel Order?' : 'Confirm Order?', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        content: Text('Are you sure you want to set Order #${order.orderID} to $newStatus?', style: const TextStyle(fontSize: 14)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('NO', style: TextStyle(color: AppColors.grey)),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              try {
                logger.i('Updating order #${order.orderID} status to $newStatus');
                await ref.read(orderDashboardProvider.notifier).updateOrderStatus(order.orderID ?? 0, newStatus);
                if (context.mounted) {
                  Toaster.success(
                    context: context,
                    message: 'Order #${order.orderID} has been $newStatus successfully',
                    isLandscape: true,
                  );
                }
              } catch (e) {
                logger.e('Error updating order status', error: e);
                if (context.mounted) {
                  Toaster.error(
                    context: context,
                    message: 'Failed to update order: ${e.toString()}',
                    isLandscape: true,
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: newStatus == 'Cancelled' ? AppColors.error : AppColors.success,
              foregroundColor: Colors.white,
            ),
            child: const Text('YES, PROCEED'),
          ),
        ],
      ),
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
