
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/tables/data/models/table_model.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';

class TableEditSection extends ConsumerStatefulWidget {
  const TableEditSection({super.key});

  @override
  ConsumerState<TableEditSection> createState() => _TableEditSectionState();
}

class _TableEditSectionState extends ConsumerState<TableEditSection> {
  final _formKey = GlobalKey<FormState>();
  final _tableNumberController = TextEditingController();
  final _capacityController = TextEditingController();
  Map<String, dynamic>? _selectedFloor;
  bool _isActive = true;

  @override
  void dispose() {
    _tableNumberController.dispose();
    _capacityController.dispose();
    super.dispose();
  }

  void _resetForm(TableModel? table, List<Map<String, dynamic>> floors) {
    if (table != null) {
      _tableNumberController.text = table.tableNumber;
      _capacityController.text = table.capacity.toString();
      _isActive = table.isActive;
      try {
        _selectedFloor = floors.firstWhere((f) => f['floorID'] == table.floorID);
      } catch (_) {
        _selectedFloor = null;
      }
    } else {
      _tableNumberController.clear();
      _capacityController.clear();
      _isActive = true;
      _selectedFloor = null;
    }
  }

  void _save() async {
    final selectedTable = ref.read(selectedTableForEditProvider);
    if (selectedTable == null) return;

    if (_formKey.currentState!.validate()) {
      if (_selectedFloor == null) {
        Toaster.warning(context: context, message: 'Please select a floor', isLandscape: true);
        return;
      }

      final updatedTable = selectedTable.copyWith(
        tableNumber: _tableNumberController.text,
        capacity: int.parse(_capacityController.text),
        floorID: _selectedFloor!['floorID'] as int,
        floorName: _selectedFloor!['floorName'] as String,
        isActive: _isActive,
      );

      final confirmed = await _showConfirmDialog(
        'Update Table', 
        'Are you sure you want to save changes to this table?',
        Icons.save_outlined,
        AppColors.primary,
      );
      if (confirmed == true) {
        await ref.read(updateTableStateProvider.notifier).updateTable(updatedTable);
        if (mounted) {
          final state = ref.read(updateTableStateProvider);
          if (state.hasError) {
            Toaster.error(context: context, message: 'Update failed: ${state.error}', isLandscape: true);
          } else {
            Toaster.success(context: context, message: 'Table updated successfully!', isLandscape: true);
          }
        }
      }
    }
  }

  void _delete() async {
    final selectedTable = ref.read(selectedTableForEditProvider);
    if (selectedTable == null) return;

    final confirmed = await _showConfirmDialog(
      'Delete Table', 
      'Are you sure you want to delete Table ${selectedTable.tableNumber}? This action cannot be undone.',
      Icons.delete_outline,
      Colors.red,
    );
    if (confirmed == true) {
      await ref.read(deleteTableStateProvider.notifier).deleteTable(selectedTable.tableID);
      if (mounted) {
        final state = ref.read(deleteTableStateProvider);
        if (state.hasError) {
          Toaster.error(context: context, message: 'Delete failed: ${state.error}', isLandscape: true);
        } else {
          Toaster.success(context: context, message: 'Table deleted successfully!', isLandscape: true);
          ref.read(selectedTableForEditProvider.notifier).select(null);
        }
      }
    }
  }

  Future<bool?> _showConfirmDialog(String title, String content, IconData icon, Color color) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 12),
            Text(title),
          ],
        ),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false), 
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Confirm', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedTable = ref.watch(selectedTableForEditProvider);
    final floors = ref.watch(floorsProvider);

    // Initial form setup
    ref.listen(selectedTableForEditProvider, (previous, next) {
      if (next != null) _resetForm(next, floors);
    });

    if (selectedTable == null) {
      return Container(
        color: AppColors.bg,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.touch_app_outlined, size: 64, color: AppColors.ashGrey),
              SizedBox(height: 16),
              Text(
                'Select a table from the list to edit details',
                style: TextStyle(color: AppColors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      color: AppColors.bg,
      padding: const EdgeInsets.all(40),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatusPill(status: selectedTable.status),
                      const SizedBox(height: 16),
                      Text(
                        'Table ${selectedTable.tableNumber}',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.people_outline, size: 18, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text(
                            '${selectedTable.capacity} Seats',
                            style: const TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
                    ),
                    child: Column(
                      children: [
                        const Text('FLOOR', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1)),
                        const SizedBox(height: 4),
                        Text(
                          selectedTable.floorName,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(height: 1),
              ),

              // Edit Fields
              const Row(
                children: [
                  Icon(Icons.edit_note_outlined, color: AppColors.primary, size: 18),
                  SizedBox(width: 12),
                  Text('Edit Information', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Manrope')),
                ],
              ),
              const SizedBox(height: 32),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildFormField(
                      label: 'Table Name/Number',
                      child: TextFormField(
                        controller: _tableNumberController,
                        decoration: _inputDecoration(prefixIcon: Icons.tag_outlined),
                        validator: (val) => val!.isEmpty ? 'Required' : null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildFormField(
                      label: 'Capacity',
                      child: TextFormField(
                        controller: _capacityController,
                        keyboardType: TextInputType.number,
                        decoration: _inputDecoration(prefixIcon: Icons.people_outline),
                        validator: (val) => val!.isEmpty ? 'Required' : null,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildFormField(
                      label: 'Select Floor',
                      child: DropdownSearch<Map<String, dynamic>>(
                        items: (filter, props) => floors,
                        itemAsString: (item) => item['floorName'] as String,
                        selectedItem: _selectedFloor,
                        onSelected: (val) => setState(() => _selectedFloor = val),
                        compareFn: (item1, item2) => item1['floorID'] == item2['floorID'],
                        decoratorProps: DropDownDecoratorProps(
                          decoration: _inputDecoration(prefixIcon: Icons.layers_outlined),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 1,
                    child: _buildFormField(
                      label: 'Active Status',
                      child: Container(
                        height: 56,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _isActive ? 'Active' : 'Inactive',
                              style: TextStyle(
                                color: _isActive ? AppColors.success : AppColors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Switch(
                              value: _isActive,
                              onChanged: (val) => setState(() => _isActive = val),
                              activeTrackColor: AppColors.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: OutlinedButton.icon(
                        onPressed: _delete,
                        icon: const Icon(Icons.delete_outline),
                        label: const Text('Delete Table'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: const BorderSide(color: Colors.red),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: _save,
                        icon: const Icon(Icons.save_outlined),
                        label: const Text('Save Changes'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({required String label, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.blackGrey,
            fontFamily: 'Manrope',
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }

  InputDecoration _inputDecoration({required IconData prefixIcon}) {
    return InputDecoration(
      prefixIcon: Icon(prefixIcon, color: AppColors.primary, size: 20),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
    );
  }
}

class StatusPill extends StatelessWidget {
  final String status;
  const StatusPill({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status.toLowerCase()) {
      case 'available': color = AppColors.success; break;
      case 'occupied': color = AppColors.primary; break;
      case 'reserved': color = AppColors.info; break;
      default: color = AppColors.ashGrey;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text(
            status.toUpperCase(),
            style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5),
          ),
        ],
      ),
    );
  }
}
