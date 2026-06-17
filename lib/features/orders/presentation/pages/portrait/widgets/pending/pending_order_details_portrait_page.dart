import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:logger/logger.dart';

class PendingOrderDetailsPortraitPage extends ConsumerWidget {
  const PendingOrderDetailsPortraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsAsync = ref.watch(selectedPendingOrderDetailsProvider);
    final logger = Logger();

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

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(order),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          const Icon(Icons.list_alt, size: 18, color: AppColors.primary),
                          const SizedBox(width: 8),
                          const Text('Order Items', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.black)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildItemsList(items),
                    ],
                  ),
                ),
              ),
              _buildActionButtons(context, ref, order, logger),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
        error: (err, _) => Center(child: Text('Error: $err', style: const TextStyle(color: AppColors.error))),
      ),
    );
  }

  Widget _buildHeader(OrderDetailModel order) {
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
              if (order.customerName != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(order.customerName!, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemsList(List<OrderDetailModel> items) {
    return Column(
      children: items.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(_getProductIcon(item.productName ?? ''), size: 18, color: AppColors.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.productName ?? 'Unknown', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    if (item.specialInstructions != null && item.specialInstructions!.isNotEmpty)
                      Text(item.specialInstructions!, style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: AppColors.grey)),
                  ],
                ),
              ),
              Text('x${item.quantity}', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildActionButtons(BuildContext context, WidgetRef ref, OrderDetailModel order, Logger logger) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -4)),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _confirmUpdateOrderStatus(context, ref, order, 'Cancelled', logger),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.error,
                  side: const BorderSide(color: AppColors.error),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('CANCEL', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () => _confirmUpdateOrderStatus(context, ref, order, 'Confirmed', logger),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('CONFIRM', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmUpdateOrderStatus(BuildContext context, WidgetRef ref, OrderDetailModel order, String newStatus, Logger logger) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(newStatus == 'Cancelled' ? 'Cancel Order?' : 'Confirm Order?', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        content: Text('Set Order #${order.orderID} to $newStatus?', style: const TextStyle(fontSize: 14)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('NO')),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              try {
                await ref.read(orderDashboardProvider.notifier).updateOrderStatus(order.orderID ?? 0, newStatus);
                if (context.mounted) {
                  Navigator.pop(context);
                  Toaster.success(context: context, message: 'Order $newStatus successfully');
                }
              } catch (e) {
                if (context.mounted) Toaster.error(context: context, message: 'Failed: $e');
              }
            },
            child: const Text('YES'),
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
