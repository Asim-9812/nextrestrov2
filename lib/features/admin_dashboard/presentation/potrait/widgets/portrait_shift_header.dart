import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/time_formatter.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';

class PortraitShiftHeader extends StatelessWidget {
  final ShiftModel? shift;
  final VoidCallback? onOpenShift;
  final VoidCallback? onEndShift;

  const PortraitShiftHeader({
    super.key,
    this.shift,
    this.onOpenShift,
    this.onEndShift,
  });

  @override
  Widget build(BuildContext context) {
    if (shift == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'No shift open',
              style: TextStyle(color: AppColors.grey),
            ),
            OutlinedButton(
              onPressed: onOpenShift,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                minimumSize: const Size(0, 36),
              ),
              child: const Text('Open Shift'),
            ),
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary2,
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.schedule, size: 16, color: AppColors.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${shift!.shiftName} • ${TimeFormatter.formatTimeAgo(shift!.openingTime)}',
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            onPressed: () => _showShiftOptionsDialog(context),
            icon: const Icon(Icons.more_vert, color: AppColors.primary),
            visualDensity: VisualDensity.compact,
          )
        ],
      ),
    );
  }

  void _showShiftOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('View more'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app, color: Colors.red),
                  title: const Text(
                    'End shift',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _showEndShiftConfirmation(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showEndShiftConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('End Shift'),
          content: const Text('Are you sure you want to end this shift? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (onEndShift != null) onEndShift!();
                Navigator.pop(context);
              },
              child: const Text(
                'End Shift',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
