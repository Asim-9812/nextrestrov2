import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import 'package:nextrestro/features/orders/data/models/order_checkout_request.dart';
import 'package:nextrestro/features/orders/data/repositories/order_repository_impl.dart';
import 'package:nextrestro/core/utils/toaster.dart';

class SplitPaymentPortraitDialog extends ConsumerStatefulWidget {
  final int orderId;
  final double totalAmount;
  final double discount;

  const SplitPaymentPortraitDialog({
    super.key, 
    required this.orderId, 
    required this.totalAmount,
    required this.discount,
  });

  @override
  ConsumerState<SplitPaymentPortraitDialog> createState() => _SplitPaymentPortraitDialogState();
}

class _SplitPaymentPortraitDialogState extends ConsumerState<SplitPaymentPortraitDialog> {
  final List<Map<String, dynamic>> _splits = [
    {'method': 1, 'amount': 0.0}
  ];

  @override
  void initState() {
    super.initState();
    _splits[0]['amount'] = widget.totalAmount;
  }

  void _addSplit() {
    setState(() {
      _splits.add({'method': 1, 'amount': 0.0});
    });
  }

  void _removeSplit(int index) {
    if (_splits.length > 1) {
      setState(() {
        _splits.removeAt(index);
      });
    }
  }

  double get _currentTotal => _splits.fold(0.0, (sum, split) => sum + split['amount']);
  bool get _isTotalMatching => (_currentTotal - widget.totalAmount).abs() < 0.01;

  void _confirmSplitPayment() async {
    if (!_isTotalMatching) {
      Toaster.warning(context: context, message: 'Totals do not match');
      return;
    }

    final request = OrderCheckoutRequest(
      orderId: widget.orderId,
      paymentMethod: 3, // Split
      discount: widget.discount,
      splitPayments: _splits.map((s) => SplitPayment(
        paymentMethod: s['method'],
        amount: s['amount'],
      )).toList(),
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
          Navigator.of(context).pop();
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
          children: [
            const Text('SPLIT PAYMENT', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order #${widget.orderId}', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Rs. ${widget.totalAmount.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _addSplit,
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Add Split'),
                    style: OutlinedButton.styleFrom(foregroundColor: AppColors.primary, side: const BorderSide(color: AppColors.primary)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () => setState(() => _splits..clear()..add({'method': 1, 'amount': widget.totalAmount})),
                    icon: const Icon(Icons.refresh, size: 18),
                    label: const Text('Reset'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _isTotalMatching ? Colors.green.withValues(alpha: 0.1) : Colors.red.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_isTotalMatching ? 'MATCHED' : 'MISMATCH', style: TextStyle(color: _isTotalMatching ? Colors.green : Colors.red, fontWeight: FontWeight.bold, fontSize: 12)),
                  Text('Diff: Rs. ${(widget.totalAmount - _currentTotal).toStringAsFixed(0)}', style: TextStyle(color: _isTotalMatching ? Colors.green : Colors.red, fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _splits.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            initialValue: _splits[index]['amount'].toString(),
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: const InputDecoration(labelText: 'Amount', border: OutlineInputBorder(), isDense: true),
                            onChanged: (val) => setState(() => _splits[index]['amount'] = double.tryParse(val) ?? 0.0),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 3,
                          child: DropdownButtonFormField<int>(
                            value: _splits[index]['method'],
                            decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12)),
                            isExpanded: true,
                            items: const [
                              DropdownMenuItem(value: 1, child: Text('Cash', style: TextStyle(fontSize: 12))),
                              DropdownMenuItem(value: 2, child: Text('Online', style: TextStyle(fontSize: 12))),
                            ],
                            onChanged: (val) => setState(() => _splits[index]['method'] = val),
                          ),
                        ),
                        IconButton(
                          onPressed: () => _removeSplit(index),
                          icon: const Icon(Icons.remove_circle_outline, color: Colors.red, size: 20),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _confirmSplitPayment,
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: const Text('CONFIRM SPLIT PAYMENT', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
