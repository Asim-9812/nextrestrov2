import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';

class ShiftHistoryDialog extends ConsumerWidget {
  final List<ShiftModel> shifts;
  final Map<int, String> userNames;
  final ShiftModel? selectedShift;

  const ShiftHistoryDialog({
    super.key,
    required this.shifts,
    required this.userNames,
    this.selectedShift,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Shift History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const Divider(),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: shifts.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final shift = shifts[index];
                  final isSelected = selectedShift?.shiftID == shift.shiftID;
                  final isActive = shift.shiftStatus == 1;

                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    title: Row(
                      children: [
                        Text(
                          shift.shiftName ?? 'Unnamed Shift',
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected ? AppColors.primary : null,
                          ),
                        ),
                        if (isActive) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.green.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Active',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Opened by: ${userNames[shift.openedByUserID] ?? 'User #${shift.openedByUserID}'}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          shift.openingTime?.split('T').first ?? '',
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: isSelected
                        ? const Icon(Icons.check_circle, color: AppColors.primary)
                        : const Icon(Icons.arrow_forward_ios, size: 14),
                    onTap: () {
                      ref.read(shiftManagementControllerProvider.notifier).selectShift(shift);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
