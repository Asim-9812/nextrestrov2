import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/features/orders/data/models/order_preview_response.dart';
import 'package:nextrestro/features/orders/presentation/pages/landscape/widgets/common/payment_method_landscape_dialog.dart';

class CheckoutPreviewLandscapeDialog extends ConsumerWidget {
  final OrderPreviewResponse preview;
  final double discount;

  const CheckoutPreviewLandscapeDialog({super.key, required this.preview, required this.discount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 800,
        height: 600,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('PREVIEW', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange)),
                IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
              ],
            ),
            const Divider(),
            Expanded(
              child: Row(
                children: [
                  // Left Section: Order Details & Items
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Order Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        _buildDetailRow('Order ID', '#${preview.summary.orderID}'),
                        _buildDetailRow('Table', preview.summary.tableNumber),
                        const SizedBox(height: 24),
                        const Text('Items List', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListView.builder(
                            itemCount: preview.items.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final item = preview.items[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${item.itemName} x${item.quantity}'),
                                    Text('Rs. ${item.subtotal.toStringAsFixed(2)}'),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalDivider(width: 32),
                  // Right Section: Payment Summary
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Payment Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        _buildSummaryRow('Subtotal', 'Rs. ${preview.summary.subTotal.toStringAsFixed(2)}'),
                        _buildSummaryRow('Tax (13%)', 'Rs. ${preview.summary.tax.toStringAsFixed(2)}'),
                        _buildSummaryRow('Discount', '- Rs. ${preview.summary.discount.toStringAsFixed(2)}', color: Colors.green),
                        const Divider(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total Amount', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Text('Rs. ${preview.summary.totalAmount.toStringAsFixed(2)}', 
                                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange)),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              final orderID = preview.summary.orderID;
                              final tableNumber = preview.summary.tableNumber;
                              final totalAmount = preview.summary.totalAmount;
                              
                              Navigator.pop(context);
                              
                              Future.microtask(() {
                                showDialog(
                                  context: context,
                                  builder: (context) => PaymentMethodLandscapeDialog(
                                    orderId: orderID,
                                    tableName: tableNumber,
                                    totalAmount: totalAmount,
                                    discount: discount,
                                  ),
                                );
                              });
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                            child: const Text('Finalize Checkout'),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Back'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
