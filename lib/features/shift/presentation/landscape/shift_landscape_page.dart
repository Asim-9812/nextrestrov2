



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/shift/presentation/landscape/widgets/shift_orders_table_landscape_widget.dart';
import 'package:nextrestro/features/shift/presentation/landscape/widgets/shift_sales_breakdown_landscape_widget.dart';
import 'package:nextrestro/features/shift/presentation/landscape/widgets/shift_staffs_landscape_widget.dart';
import 'package:nextrestro/features/shift/presentation/landscape/widgets/shift_summary_landscape_widget.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_state.dart';

import '../../../../core/utils/time_formatter.dart';

class ShiftLandscapePage extends ConsumerWidget {
  const ShiftLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shiftState = ref.watch(shiftManagementControllerProvider);

    // Listen for error messages
    ref.listen(shiftManagementControllerProvider, (previous, next) {
      next.whenData((state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Colors.red,
            ),
          );
        }
      });
    });

    return shiftState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
      data: (state) {
        final currentShift = state.shifts.isNotEmpty && state.shifts.first.shiftStatus == 1 ? state.shifts.first : null;
        final pastShifts = currentShift != null ? state.shifts.skip(1).toList() : state.shifts;

        return Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    if (currentShift != null)
                      GestureDetector(
                        onTap: () => ref.read(shiftManagementControllerProvider.notifier).selectShift(currentShift),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                              color: state.selectedShift?.shiftID == currentShift.shiftID ? AppColors.primary.withValues(alpha: 0.1) : AppColors.bg,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: state.selectedShift?.shiftID == currentShift.shiftID ? AppColors.primary : AppColors.grey)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Current Shift',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                  fontFamily: 'Sora',
                                ),
                              ),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    const SizedBox(height: 12),
                    if (currentShift != null)
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red.withValues(alpha: 0.1),
                            foregroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(color: Colors.red),
                            ),
                          ),
                          onPressed: () => _showEndShiftDialog(context, ref, currentShift),
                          child: const Text('End Current Shift'),
                        ),
                      )
                    else
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () => _showOpenShiftDialog(context, ref, state.shifts),
                          child: const Text('Open Shift'),
                        ),
                      ),
                    const SizedBox(height: 12),
                    const Text(
                      'Recent Shift History',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: pastShifts.map((shift) {
                            final isSelected = state.selectedShift?.shiftID == shift.shiftID;
                            return GestureDetector(
                              onTap: () => ref.read(shiftManagementControllerProvider.notifier).selectShift(shift),
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(bottom: 8),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isSelected ? AppColors.primary.withValues(alpha: 0.05) : AppColors.bg,
                                  border: Border.all(color: isSelected ? AppColors.primary : AppColors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          shift.shiftName ?? 'Unnamed Shift',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: AppColors.black,
                                            fontFamily: 'Sora',
                                          ),
                                        ),
                                        Text(
                                          state.userNames[shift.openedByUserID] ?? 'User #${shift.openedByUserID}',
                                          style: const TextStyle(
                                            fontSize: 8,
                                            color: AppColors.black,
                                            fontFamily: 'Sora',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      shift.openingTime?.split('T').first ?? '',
                                      style: const TextStyle(
                                        fontSize: 8,
                                        color: AppColors.black,
                                        fontFamily: 'Sora',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const VerticalDivider(),
            Expanded(
              flex: 4,
              child: state.selectedShift == null
                  ? const Center(
                      child: Text(
                        'Please select a shift to view details',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : Container(
                      height: double.infinity,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            const Text('Shift Details', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            Text('Track your shift sales and activity', style: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
                            const Divider(),
                            _buildShiftHeader(state),
                            const SizedBox(height: 24),
                            if (state.isLoading)
                              const Center(child: Padding(padding: EdgeInsets.all(40), child: CircularProgressIndicator()))
                            else
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Column(
                                        children: [
                                          ShiftSalesBreakdown(shift: state.selectedShift!),
                                          const SizedBox(height: 24),
                                          if (state.isOrdersLoading)
                                            const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(40),
                                                child: CircularProgressIndicator(),
                                              ),
                                            )
                                          else
                                            ShiftOrdersTable(
                                              orders: state.shiftOrders,
                                              onRefresh: state.selectedShift?.shiftStatus == 1
                                                  ? () => ref.read(shiftManagementControllerProvider.notifier).refreshOrders()
                                                  : null,
                                            )
                                        ],
                                      )),
                                  const SizedBox(width: 24),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          ShiftSummaryStats(shift: state.selectedShift!, orders: state.shiftOrders),
                                          const SizedBox(height: 24),
                                          const ShiftStaffsSection()
                                        ],
                                      )),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildShiftHeader(ShiftManagementState state) {
    final shift = state.selectedShift!;
    final isActive = shift.shiftStatus == 1;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: (isActive ? Colors.green : Colors.blue).withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: (isActive ? Colors.green : Colors.blue).withValues(alpha: 0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: isActive ? Colors.green : Colors.blue, shape: BoxShape.circle),
            child: Icon(isActive ? Icons.check : Icons.history, color: Colors.white, size: isActive ? 16 : 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(shift.shiftName ?? '', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: isActive ? Colors.green : Colors.blue)),
                    const SizedBox(width: 8),
                    Text(isActive ? '• Active' : '• Closed',
                        style: TextStyle(color: (isActive ? Colors.green : Colors.blue).withValues(alpha: 0.7), fontWeight: FontWeight.w600, fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 4),
                Text('Opened by ${state.selectedShiftOpenerName ?? 'Loading...'} • ${TimeFormatter.formatFullDate(shift.openingTime)}',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                if (!isActive) ...[
                  const SizedBox(height: 2),
                  Text(
                    'Closed by ${state.selectedShiftCloserName ?? (shift.closedByUserID == 0 || shift.closedByUserID == null ? 'System' : 'Loading...')} • ${TimeFormatter.formatFullDate(shift.closingTime)}',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ],
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isActive && shift.closingAmount != null) ...[
                const Text('Closing Balance', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
                Text('Rs. ${shift.closingAmount?.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.blue)),
                const SizedBox(height: 8),
                const Text('Opening Balance', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w500)),
                Text('Rs. ${shift.openingAmount?.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.blue.withValues(alpha: 0.6))),
              ] else ...[
                const Text('Opening Balance', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
                Text('Rs. ${shift.openingAmount?.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: isActive ? Colors.green : Colors.blue)),
              ],
            ],
          ),
        ],
      ),
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
