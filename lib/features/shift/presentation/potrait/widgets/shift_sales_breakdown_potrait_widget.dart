import 'package:flutter/material.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spacing.dart';

class ShiftSalesBreakdownPortrait extends StatelessWidget {
  final ShiftModel shift;
  const ShiftSalesBreakdownPortrait({super.key, required this.shift});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    final totalSales = shift.totalSales;
    final cashSales = shift.cashSales;
    final cardSales = shift.cardSales;
    final qrSales = shift.qrSales;
    final creditSales = shift.creditSales;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isLight ? Colors.white : AppColors.blackGrey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shift Sales Breakdown',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(height: 16),

          _buildSalesRow(
            'Cash Sales',
            'Received in cash',
            cashSales,
            Icons.money_rounded,
            Colors.green,
            totalSales > 0 ? cashSales / totalSales : 0,
          ),
          _buildDivider(),

          _buildSalesRow(
            'Card Sales',
            'Received via card',
            cardSales,
            Icons.credit_card_rounded,
            Colors.blue,
            totalSales > 0 ? cardSales / totalSales : 0,
          ),
          _buildDivider(),

          _buildSalesRow(
            'QR Payments',
            'UPI / QR code payments',
            qrSales,
            Icons.qr_code_rounded,
            Colors.purple,
            totalSales > 0 ? qrSales / totalSales : 0,
          ),
          _buildDivider(),

          _buildSalesRow(
            'Credit Sales',
            'Credit and due payments',
            creditSales,
            Icons.history_rounded,
            Colors.orange,
            totalSales > 0 ? creditSales / totalSales : 0,
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Sales',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'For this shift',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Rs. ${totalSales.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSalesRow(String label, String desc, double amount, IconData icon, Color color, double percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: color, size: 16),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                Text(desc, style: TextStyle(fontSize: 10, color: Colors.grey.shade500)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Rs. ${amount.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Text('${(percentage * 100).toStringAsFixed(0)}%', style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 24, color: Colors.grey.withValues(alpha: 0.1));
  }
}
