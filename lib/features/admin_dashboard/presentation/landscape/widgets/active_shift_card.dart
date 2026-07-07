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
    return Container(
      height: 140,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
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
                  Text(
                    shift.shiftName ?? 'Active Shift',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    'Opened ${TimeFormatter.formatFullDate(shift.openingTime)}',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
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
          const Spacer(),
          const Divider(height: 1),
          const Spacer(),
          Row(
            children: [
              _buildShiftDetailItem(
                'Opened By',
                openerName ?? 'User #${shift.openedByUserID}',
                Icons.person_outline,
              ),
              const Spacer(),
              _buildShiftDetailItem(
                'Opening',
                'Rs. ${shift.openingAmount?.toStringAsFixed(2)}',
                Icons.account_balance_wallet_outlined,
              ),
              const Spacer(),
              _buildShiftDetailItem(
                'Sales',
                'Rs. ${shift.totalSales.toStringAsFixed(2)}',
                Icons.payments_outlined,
              ),
              const Spacer(),
              _buildShiftDetailItem(
                'Status',
                'Running',
                Icons.trending_up,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShiftDetailItem(String label, String value, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.bg,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, size: 16, color: AppColors.grey),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.grey,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 12,
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
