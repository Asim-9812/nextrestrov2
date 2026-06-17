import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import 'package:nextrestro/features/orders/data/models/order_checkout_request.dart';
import 'package:nextrestro/features/orders/data/repositories/order_repository_impl.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'split_payment_portrait_dialog.dart';

class PaymentMethodPortraitDialog extends ConsumerStatefulWidget {
  final int orderId;
  final String tableName;
  final double totalAmount;
  final double discount;

  const PaymentMethodPortraitDialog({
    super.key, 
    required this.orderId, 
    required this.tableName, 
    required this.totalAmount,
    required this.discount,
  });

  @override
  ConsumerState<PaymentMethodPortraitDialog> createState() => _PaymentMethodPortraitDialogState();
}

class _PaymentMethodPortraitDialogState extends ConsumerState<PaymentMethodPortraitDialog> {
  int _selectedMethod = 1; // 1: Cash, 2: Online, 3: Split

  void _confirmPayment() async {
    if (_selectedMethod == 3) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => SplitPaymentPortraitDialog(
          orderId: widget.orderId,
          totalAmount: widget.totalAmount,
          discount: widget.discount,
        ),
      );
      return;
    }

    final request = OrderCheckoutRequest(
      orderId: widget.orderId,
      paymentMethod: _selectedMethod,
      discount: widget.discount,
    );

    final repository = ref.read(orderRepositoryProvider);
    final result = await repository.checkoutOrder(request);

    result.fold(
      (failure) => Toaster.error(context: context, message: failure.message),
      (_) async {
        await repository.updateOrderStatus(widget.orderId, 'Completed');
        ref.invalidate(orderDashboardProvider);
        ref.invalidate(tablesStreamProvider);
        if (mounted) {
          Toaster.success(context: context, message: 'Payment confirmed');
          Navigator.pop(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('PAYMENT METHOD', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order #${widget.orderId}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text('Table ${widget.tableName}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ],
            ),
            const SizedBox(height: 16),
            const Text('TOTAL AMOUNT', style: TextStyle(color: Colors.grey, fontSize: 12)),
            Text('Rs. ${widget.totalAmount.toStringAsFixed(0)}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.black)),
            const SizedBox(height: 24),
            Row(
              children: [
                _buildMethodCard(1, Icons.money, 'Cash'),
                const SizedBox(width: 8),
                _buildMethodCard(2, Icons.qr_code_scanner, 'Online'),
                const SizedBox(width: 8),
                _buildMethodCard(3, Icons.call_split, 'Split'),
              ],
            ),
            const SizedBox(height: 24),
            if (_selectedMethod == 2)
              Center(
                child: Column(
                  children: [
                    const Text('SCAN QR CODE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    const SizedBox(height: 8),
                    Image.asset('assets/images/sample_qr.jpg', width: 140, height: 140),
                  ],
                ),
              ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _confirmPayment,
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: const Text('CONFIRM PAYMENT', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMethodCard(int id, IconData icon, String label) {
    final isSelected = _selectedMethod == id;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _selectedMethod = id),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: isSelected ? AppColors.primary : AppColors.ashGrey, width: 2),
            borderRadius: BorderRadius.circular(12),
            color: isSelected ? AppColors.primary.withValues(alpha: 0.05) : Colors.white,
          ),
          child: Column(
            children: [
              Icon(icon, color: isSelected ? AppColors.primary : AppColors.grey, size: 24),
              const SizedBox(height: 4),
              Text(label, style: TextStyle(color: isSelected ? AppColors.primary : AppColors.grey, fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
