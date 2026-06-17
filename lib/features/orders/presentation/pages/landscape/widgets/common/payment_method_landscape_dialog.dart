import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import 'package:nextrestro/features/orders/data/models/order_checkout_request.dart';
import 'package:nextrestro/features/orders/data/repositories/order_repository_impl.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'split_payment_landscape_dialog.dart';

class PaymentMethodLandscapeDialog extends ConsumerStatefulWidget {
  final int orderId;
  final String tableName;
  final double totalAmount;
  final double discount;

  const PaymentMethodLandscapeDialog({
    super.key, 
    required this.orderId, 
    required this.tableName, 
    required this.totalAmount,
    required this.discount,
  });

  @override
  ConsumerState<PaymentMethodLandscapeDialog> createState() => _PaymentMethodLandscapeDialogState();
}

class _PaymentMethodLandscapeDialogState extends ConsumerState<PaymentMethodLandscapeDialog> {
  int _selectedMethod = 1; // 1: Cash, 2: Online, 3: Split

  void _confirmPayment() async {
    if (_selectedMethod == 3) {
      final orderId = widget.orderId;
      final totalAmount = widget.totalAmount;
      final discount = widget.discount;
      
      Navigator.pop(context); // Close Payment Method Dialog
      
      // Delay slightly to allow the previous dialog to finish popping
      Future.microtask(() {
        if (!mounted) return;
        showDialog(
          context: context,
          builder: (context) => SplitPaymentLandscapeDialog(
            orderId: orderId,
            totalAmount: totalAmount,
            discount: discount,
          ),
        );
      });
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
      (failure) => Toaster.error(context: context, message: failure.message, isLandscape: true),
      (_) async {
        await repository.updateOrderStatus(widget.orderId, 'Completed');

        // Refresh providers to update sidebar and table list
        ref.invalidate(orderDashboardProvider);
        ref.invalidate(tablesStreamProvider);

        if (mounted) {
          Toaster.success(context: context, message: 'Payment confirmed and order completed', isLandscape: true);
          Navigator.pop(context); // Close Payment Dialog
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 800,
        height: 450,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('PAYMENT METHOD', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange)),
            const SizedBox(height: 24),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Order: #${widget.orderId}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text('Table: ${widget.tableName}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text('TOTAL AMOUNT', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text('Rs. ${widget.totalAmount.toStringAsFixed(2)}', 
                             style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 32),
                        const Text('Select Payment Method', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            _buildMethodCard(1, Icons.money, 'Cash'),
                            const SizedBox(width: 12),
                            _buildMethodCard(2, Icons.qr_code_scanner, 'Online'),
                            const SizedBox(width: 12),
                            _buildMethodCard(3, Icons.call_split, 'Split'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const VerticalDivider(width: 48),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('SCAN QR CODE', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange.shade200),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset('assets/images/sample_qr.jpg', fit: BoxFit.cover),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Back')),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _confirmPayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, 
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text('Confirm Payment'),
                ),
              ],
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
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: isSelected ? Colors.orange : Colors.grey.shade300, width: 2),
            borderRadius: BorderRadius.circular(12),
            color: isSelected ? Colors.orange.withValues(alpha: 0.05) : Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isSelected ? Colors.orange : Colors.grey, size: 32),
              const SizedBox(height: 8),
              Text(label, style: TextStyle(color: isSelected ? Colors.orange : Colors.grey, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
