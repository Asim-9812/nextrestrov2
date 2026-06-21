import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/time_formatter.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';

class WaiterHeader extends ConsumerWidget {
  final String title;

  const WaiterHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 60,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: _buildShiftHeaderInfo(context, ref),
          ),
          const Chip(
            avatar: CircleAvatar(
              backgroundColor: AppColors.primary,
              child: Text(
                'W',
                style: TextStyle(color: AppColors.white),
              ),
            ),
            label: Text('Waiter'),
          ),
        ],
      ),
    );
  }

  Widget _buildShiftHeaderInfo(BuildContext context, WidgetRef ref) {
    final shiftState = ref.watch(shiftManagementControllerProvider);

    return shiftState.maybeWhen(
      data: (state) {
        final shift = state.shifts.isNotEmpty && state.shifts.first.shiftStatus == 1 ? state.shifts.first : null;
        if (shift == null) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'No shift open',
                style: TextStyle(color: AppColors.grey),
              ),
              SizedBox(width: 16),
            ],
          );
        }

        return Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.schedule, size: 16, color: AppColors.primary),
                  const SizedBox(width: 8),
                  Text(
                    '${shift.shiftName} • ${TimeFormatter.formatTimeAgo(shift.openingTime)}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}
