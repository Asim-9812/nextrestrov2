import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/time_formatter.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_state.dart';
import 'package:nextrestro/features/shift/presentation/widgets/shift_history_dialog.dart';
import 'package:nextrestro/features/shift/presentation/potrait/widgets/shift_orders_table_potrait_widget.dart';
import 'package:nextrestro/features/shift/presentation/potrait/widgets/shift_sales_breakdown_potrait_widget.dart';
import 'package:nextrestro/features/shift/presentation/potrait/widgets/shift_staffs_potrait_widget.dart';
import 'package:nextrestro/features/shift/presentation/potrait/widgets/shift_summary_potrait_widget.dart';

class ShiftPotraitPage extends ConsumerWidget {
  const ShiftPotraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shiftState = ref.watch(shiftManagementControllerProvider);

    return shiftState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
      data: (state) {
        final currentShift = state.shifts.isNotEmpty && state.shifts.first.shiftStatus == 1 ? state.shifts.first : null;
        final isHistorySelected = state.selectedShift != null && state.selectedShift?.shiftID != currentShift?.shiftID;

        return Scaffold(
          backgroundColor: AppColors.bg,
          body: RefreshIndicator(
            onRefresh: () => ref.read(shiftManagementControllerProvider.notifier).refresh(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSelectionHeader(context, ref, state, currentShift, isHistorySelected),
                  const SizedBox(height: 16),
                  if (state.selectedShift == null)
                    _buildEmptyState(context, ref, state.shifts)
                  else ...[
                    _buildShiftHeader(context, ref, state),
                    const SizedBox(height: 16),
                    if (state.isLoading)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(40),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    else ...[
                      ShiftSalesBreakdownPortrait(shift: state.selectedShift!),
                      const SizedBox(height: 16),
                      ShiftSummaryStatsPortrait(shift: state.selectedShift!, orders: state.shiftOrders),
                      const SizedBox(height: 16),
                      const ShiftStaffsSectionPortrait(),
                      const SizedBox(height: 16),
                      if (state.isOrdersLoading)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(40),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      else
                        ShiftOrdersTablePortrait(
                          orders: state.shiftOrders,
                          onRefresh: state.selectedShift?.shiftStatus == 1
                              ? () => ref.read(shiftManagementControllerProvider.notifier).refreshOrders()
                              : null,
                        ),

                    ],
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSelectionHeader(
    BuildContext context,
    WidgetRef ref,
    ShiftManagementState state,
    ShiftModel? currentShift,
    bool isHistorySelected,
  ) {
    String displayText = 'Current Shift';
    if (isHistorySelected) {
      displayText = state.selectedShift?.shiftName ?? 'Past Shift';
    } else if (currentShift == null && state.selectedShift == null) {
      displayText = 'Select a Shift';
    }

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.grey.withValues(alpha: 0.3)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  isHistorySelected ? Icons.history : Icons.schedule,
                  color: AppColors.primary,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    displayText,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                if (isHistorySelected && currentShift != null)
                  IconButton(
                    icon: const Icon(Icons.close, size: 18, color: Colors.grey),
                    onPressed: () {
                      ref.read(shiftManagementControllerProvider.notifier).selectShift(currentShift);
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        IconButton.filled(
          onPressed: () => _showHistoryDialog(context, state),
          icon: const Icon(Icons.history_rounded),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context, WidgetRef ref, List<ShiftModel> allShifts) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 64),
          const Icon(Icons.schedule, size: 64, color: AppColors.lightGrey),
          const SizedBox(height: 16),
          const Text(
            'No shift open',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _showOpenShiftDialog(context, ref, allShifts),
            icon: const Icon(Icons.add),
            label: const Text('Open Shift'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShiftHeader(BuildContext context, WidgetRef ref, ShiftManagementState state) {
    final shift = state.selectedShift!;
    final isActive = shift.shiftStatus == 1;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: (isActive ? Colors.green : Colors.blue).withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: (isActive ? Colors.green : Colors.blue).withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: isActive ? Colors.green : Colors.blue, shape: BoxShape.circle),
                child: Icon(isActive ? Icons.check : Icons.history, color: Colors.white, size: 16),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shift.shiftName ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: isActive ? Colors.green : Colors.blue),
                    ),
                    Text(
                      isActive ? 'Active Shift' : 'Closed Shift',
                      style: TextStyle(
                        color: (isActive ? Colors.green : Colors.blue).withValues(alpha: 0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              if (isActive)
                TextButton(
                  onPressed: () => _showEndShiftDialog(context, ref, shift),
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                  child: const Text('End Shift',style: TextStyle(fontSize: 12),),
                ),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Opened By', style: TextStyle(fontSize: 8, color: Colors.grey)),
                  Text(state.selectedShiftOpenerName ?? 'Loading...', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Opening Time', style: TextStyle(fontSize: 8, color: Colors.grey)),
                  Text(TimeFormatter.formatFullDate(shift.openingTime), style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 10)),
                ],
              ),
            ],
          ),
          if (!isActive) ...[
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Closed By', style: TextStyle(fontSize: 11, color: Colors.grey)),
                    Text(state.selectedShiftCloserName ?? 'System', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Closing Time', style: TextStyle(fontSize: 11, color: Colors.grey)),
                    Text(TimeFormatter.formatFullDate(shift.closingTime), style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  void _showHistoryDialog(BuildContext context, ShiftManagementState state) {
    showDialog(
      context: context,
      builder: (context) => ShiftHistoryDialog(
        shifts: state.shifts,
        userNames: state.userNames,
        selectedShift: state.selectedShift,
      ),
    );
  }

  void _showOpenShiftDialog(BuildContext context, WidgetRef ref, List<ShiftModel> allShifts) {
    // Copying logic from landscape to maintain consistency
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
