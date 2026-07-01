import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import 'package:nextrestro/features/orders/data/models/order_checkout_request.dart';
import 'package:nextrestro/features/orders/data/repositories/order_repository_impl.dart';
import 'package:nextrestro/core/utils/toaster.dart';

class SplitPaymentLandscapeDialog extends ConsumerStatefulWidget {
  final int orderId;
  final double totalAmount;
  final double discount;

  const SplitPaymentLandscapeDialog({
    super.key, 
    required this.orderId, 
    required this.totalAmount,
    required this.discount,
  });

  @override
  ConsumerState<SplitPaymentLandscapeDialog> createState() => _SplitPaymentLandscapeDialogState();
}

class _SplitPaymentLandscapeDialogState extends ConsumerState<SplitPaymentLandscapeDialog> {
  final List<Map<String, dynamic>> _splits = [
    {'method': 1, 'amount': 0.0}
  ];
  bool _isLoading = false;

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
      Toaster.warning(context: context, message: 'Split totals do not match the total amount', isLandscape: true);
      return;
    }

    setState(() => _isLoading = true);
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

    if (!mounted) return;

    result.fold(
      (failure) {
        setState(() => _isLoading = false);
        Toaster.error(context: context, message: failure.message, isLandscape: true);
      },
      (_) async {
        await repository.updateOrderStatus(widget.orderId, 'Completed');
        
        // Refresh providers
        ref.invalidate(orderDashboardProvider);
        ref.invalidate(tablesStreamProvider);

        if (mounted) {
          Toaster.success(context: context, message: 'Split payment confirmed and order completed', isLandscape: true);
          Navigator.of(context).pop(); // Close the split payment dialog
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
        height: 600,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('SPLIT PAYMENT', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order ID: #${widget.orderId}', style: const TextStyle(fontWeight: FontWeight.bold)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('TOTAL AMOUNT', style: TextStyle(color: Colors.grey, fontSize: 11)),
                    Text('Rs. ${widget.totalAmount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            const Divider(height: 32),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: _addSplit,
                                icon: const Icon(Icons.add),
                                label: const Text('Add Split'),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade50, foregroundColor: Colors.orange),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () => setState(() => _splits..clear()..add({'method': 1, 'amount': widget.totalAmount})),
                                icon: const Icon(Icons.refresh),
                                label: const Text('Reset'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: _isTotalMatching ? Colors.green.shade50 : Colors.red.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_isTotalMatching ? 'TOTAL SPLIT MATCHES' : 'TOTAL SPLIT MISMATCH', 
                                   style: TextStyle(color: _isTotalMatching ? Colors.green : Colors.red, fontWeight: FontWeight.bold)),
                              Text('remaining Rs. ${(widget.totalAmount - _currentTotal).toStringAsFixed(2)}',
                                   style: TextStyle(color: _isTotalMatching ? Colors.green : Colors.red, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _splits.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: TextFormField(
                                        initialValue: _splits[index]['amount'].toString(),
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(labelText: 'Amount', border: OutlineInputBorder()),
                                        onChanged: (val) {
                                          setState(() {
                                            _splits[index]['amount'] = double.tryParse(val) ?? 0.0;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      flex: 2,
                                      child: DropdownButtonFormField<int>(
                                        value: _splits[index]['method'],
                                        decoration: const InputDecoration(labelText: 'Method', border: OutlineInputBorder()),
                                        items: const [
                                          DropdownMenuItem(value: 1, child: Text('Cash')),
                                          DropdownMenuItem(value: 2, child: Text('Online')),
                                        ],
                                        onChanged: (val) {
                                          setState(() {
                                            _splits[index]['method'] = val;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    IconButton(
                                      onPressed: () => _removeSplit(index),
                                      icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
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
                        const Text('SCAN QR CODE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
                        const SizedBox(height: 16),
                        Image.asset('assets/images/sample_qr.jpg', width: 200, height: 200),
                        const SizedBox(height: 16),
                        const Text('Collect Online Split Payments', style: TextStyle(fontSize: 12, color: Colors.grey)),
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
                  onPressed: _isLoading ? null : _confirmSplitPayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, 
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                      : const Text('Confirm Split Payment'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
