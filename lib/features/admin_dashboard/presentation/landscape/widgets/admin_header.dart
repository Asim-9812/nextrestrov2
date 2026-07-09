import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/time_formatter.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';

class AdminHeader extends ConsumerWidget {
  final String title;

  const AdminHeader({
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
          // const SizedBox(width: 24),
          // Expanded(
          //   child: _buildShiftHeaderInfo(context, ref),
          // ),
          Spacer(),
          Row(
            children: [
              CircleAvatar(
                foregroundImage: AssetImage('assets/images/man.png'),
                radius: 18,
              ),
              const SizedBox(width: 12,),
              Text('Admin',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          )
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
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'No shift open',
                style: TextStyle(color: AppColors.grey),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: () => _showOpenShiftDialog(context, ref, state.shifts),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  minimumSize: const Size(0, 36),
                ),
                child: const Text('Open Shift'),
              ),
              const SizedBox(width: 16),
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
            TextButton(
              onPressed: () => _showEndShiftDialog(context, ref, shift),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('End Shift'),
            ),
            const SizedBox(width: 16),
          ],
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }

  void _showOpenShiftDialog(BuildContext context, WidgetRef ref, List<ShiftModel> allShifts) {
    final lastClosedShift = allShifts.firstWhere((s) => s.shiftStatus == 2, orElse: () => const ShiftModel());
    final List<String> existingNames = allShifts.map((s) => s.shiftName ?? '').where((name) => name.isNotEmpty).toSet().toList();

    final TextEditingController amountController = TextEditingController(text: lastClosedShift.closingAmount?.toStringAsFixed(2) ?? '0.00');
    final TextEditingController nameController = TextEditingController();
    String? selectedName = existingNames.isNotEmpty ? existingNames.first : null;
    bool isAddingNewName = existingNames.isEmpty;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Open New Shift'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Shift Name', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: isAddingNewName
                          ? TextField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter shift name',
                              ),
                            )
                          : DropdownButtonFormField<String>(
                              initialValue: selectedName,
                              decoration: const InputDecoration(border: OutlineInputBorder()),
                              items: existingNames.map((name) => DropdownMenuItem(value: name, child: Text(name))).toList(),
                              onChanged: (val) => setState(() => selectedName = val),
                            ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: Icon(isAddingNewName ? Icons.list_rounded : Icons.add_rounded),
                      onPressed: () => setState(() => isAddingNewName = !isAddingNewName),
                      tooltip: isAddingNewName ? 'Choose from list' : 'Add new shift name',
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                        foregroundColor: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Opening Amount', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: 'Rs. ',
                    border: OutlineInputBorder(),
                    hintText: 'Enter opening amount',
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'This is pre-filled from the last shift\'s closing amount.',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
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
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
              onPressed: () {
                final name = isAddingNewName ? nameController.text : selectedName;
                if (name == null || name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter or select a shift name')));
                  return;
                }
                final amount = double.tryParse(amountController.text) ?? 0.0;
                ref.read(shiftManagementControllerProvider.notifier).openShift(name, amount);
                Navigator.pop(context);
              },
              child: const Text('Open Shift'),
            ),
          ],
        ),
      ),
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
