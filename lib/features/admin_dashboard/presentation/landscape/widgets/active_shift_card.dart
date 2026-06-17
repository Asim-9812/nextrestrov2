import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/time_formatter.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';

class ActiveShiftCard extends StatelessWidget {
  final ShiftModel shift;
  final String? openerName;

  const ActiveShiftCard({
    super.key,
    required this.shift,
    this.openerName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shift.shiftName ?? 'Active Shift',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Opened ${TimeFormatter.formatFullDate(shift.openingTime)}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.green.shade200),
                  ),
                  child: const Text(
                    'OPEN',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 32),
            Row(
              children: [
                _buildShiftDetailItem(
                  'Opened By',
                  openerName ?? 'User #${shift.openedByUserID}',
                  Icons.person_outline,
                ),
                const SizedBox(width: 48),
                _buildShiftDetailItem(
                  'Opening Amount',
                  '\$${shift.openingAmount}',
                  Icons.account_balance_wallet_outlined,
                ),
                const SizedBox(width: 48),
                _buildShiftDetailItem(
                  'Current Sales',
                  '\$${shift.totalSales}',
                  Icons.payments_outlined,
                ),
                const SizedBox(width: 48),
                _buildShiftDetailItem(
                  'Status',
                  'Running',
                  Icons.trending_up,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShiftDetailItem(String label, String value, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.bg,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: AppColors.grey),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
}
