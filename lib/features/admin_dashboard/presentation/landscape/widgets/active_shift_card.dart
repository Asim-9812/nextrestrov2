import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/time_formatter.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';

import 'package:nextrestro/features/shift/data/models/shift_model.dart';

class ActiveShiftCard extends ConsumerWidget {
  final ShiftModel shift;
  final String? openerName;

  const ActiveShiftCard({
    super.key,
    required this.shift,
    this.openerName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Shift Icon and Name
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.wb_sunny_outlined, color: AppColors.white, size: 24),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        shift.shiftName ?? 'Active Shift',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: const Text(
                          'OPEN',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${TimeFormatter.formatTimeOnly(shift.openingTime)} • Running for ${TimeFormatter.formatDuration(shift.openingTime)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          // Cash Drawer Info

          _buildInfoSection(
            icon: Icons.account_balance_wallet_outlined,
            label: 'Cash Drawer',
            value: 'Rs. ${((shift.openingAmount ?? 0) + shift.cashSales).toStringAsFixed(2)}',
          ),
          const Spacer(),
          // const SizedBox(width: 32),
          // Sales Today Info
          _buildInfoSection(
            icon: Icons.bar_chart_outlined,
            label: 'Sales Today',
            value: 'Rs. ${shift.totalSales.toStringAsFixed(2)}',
          ),
          const Spacer(),
          // const SizedBox(width: 32),
          // End Shift Button
          SizedBox(
            height: 40,
            child: VerticalDivider(
              color: AppColors.grey,
              width: 0.5,
              thickness: 0.5,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          ElevatedButton(
            onPressed: () => _showEndShiftDialog(context, ref, shift),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.logout, size: 16),
                SizedBox(width: 8),
                Text(
                  'End Shift',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.grey,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showEndShiftDialog(BuildContext context, WidgetRef ref, ShiftModel shift) {
    final TextEditingController amountController = TextEditingController(
      text: (shift.totalSales + (shift.openingAmount ?? 0)).toStringAsFixed(2),
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('End Shift Confirmation'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Are you sure you want to end this shift?', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _buildSummaryItem('Shift Name', shift.shiftName ?? 'N/A'),
              _buildSummaryItem('Opening Amount', 'Rs. ${shift.openingAmount?.toStringAsFixed(2)}'),
              _buildSummaryItem('Total Sales', 'Rs. ${shift.totalSales.toStringAsFixed(2)}'),
              const Divider(),
              _buildSummaryItem('Cash Sales', 'Rs. ${shift.cashSales.toStringAsFixed(2)}'),
              _buildSummaryItem('Card Sales', 'Rs. ${shift.cardSales.toStringAsFixed(2)}'),
              _buildSummaryItem('QR Sales', 'Rs. ${shift.qrSales.toStringAsFixed(2)}'),
              _buildSummaryItem('Credit Sales', 'Rs. ${shift.creditSales.toStringAsFixed(2)}'),
              const Divider(),
              const SizedBox(height: 8),
              const Text('Closing Amount', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixText: 'Rs. ',
                  border: OutlineInputBorder(),
                  hintText: 'Enter final amount in drawer',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () {
              final amount = double.tryParse(amountController.text) ?? 0.0;
              ref.read(shiftManagementControllerProvider.notifier).endShift(shift, amount);
              Navigator.pop(context);
            },
            child: const Text('End Shift'),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
