import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/tables/data/models/table_model.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import 'package:nextrestro/features/tables/presentation/landscape/widgets/table_edit_section.dart';

class TableEditPotraitPage extends ConsumerStatefulWidget {
  const TableEditPotraitPage({super.key});

  @override
  ConsumerState<TableEditPotraitPage> createState() => _TableEditPotraitPageState();
}

class _TableEditPotraitPageState extends ConsumerState<TableEditPotraitPage> {
  final _formKey = GlobalKey<FormState>();
  final _tableNumberController = TextEditingController();
  final _capacityController = TextEditingController();
  Map<String, dynamic>? _selectedFloor;
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final table = ref.read(selectedTableForEditProvider);
      final floors = ref.read(floorsProvider);
      _resetForm(table, floors);
    });
  }

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
      setState(() {});
    }
  }

  void _save() async {
    final selectedTable = ref.read(selectedTableForEditProvider);
    if (selectedTable == null) return;

    if (_formKey.currentState!.validate()) {
      if (_selectedFloor == null) {
        Toaster.warning(context: context, message: 'Please select a floor', isLandscape: false);
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
            Toaster.error(context: context, message: 'Update failed: ${state.error}', isLandscape: false);
          } else {
            Toaster.success(context: context, message: 'Table updated successfully!', isLandscape: false);
            Navigator.pop(context);
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
          Toaster.error(context: context, message: 'Delete failed: ${state.error}', isLandscape: false);
        } else {
          Toaster.success(context: context, message: 'Table deleted successfully!', isLandscape: false);
          ref.read(selectedTableForEditProvider.notifier).select(null);
          Navigator.pop(context);
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
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
        content: Text(content, style: const TextStyle(fontSize: 13)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false), 
            child: const Text('Cancel', style: TextStyle(color: Colors.grey, fontSize: 13)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 13)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedTable = ref.watch(selectedTableForEditProvider);
    final floors = ref.watch(floorsProvider);

    if (selectedTable == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Edit Table', style: TextStyle(fontSize: 16))),
        body: const Center(child: Text('No table selected', style: TextStyle(fontSize: 13))),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: Text('Table ${selectedTable.tableNumber}', style: const TextStyle(fontSize: 16)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        toolbarHeight: 48,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status & Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatusPill(status: selectedTable.status),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.people_outline, size: 16, color: Colors.grey),
                          const SizedBox(width: 6),
                          Text(
                            '${selectedTable.capacity} Seats',
                            style: const TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
                    ),
                    child: Column(
                      children: [
                        const Text('FLOOR', style: TextStyle(fontSize: 9, color: Colors.grey, fontWeight: FontWeight.bold)),
                        Text(
                          selectedTable.floorName,
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(),
              ),

              const Text('Edit Information', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              
              _buildFormField(
                label: 'Table Name/Number',
                child: SizedBox(
                  height: 48,
                  child: TextFormField(
                    controller: _tableNumberController,
                    style: const TextStyle(fontSize: 13),
                    decoration: _inputDecoration(prefixIcon: Icons.tag_outlined),
                    validator: (val) => val!.isEmpty ? 'Required' : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildFormField(
                label: 'Capacity',
                child: SizedBox(
                  height: 48,
                  child: TextFormField(
                    controller: _capacityController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 13),
                    decoration: _inputDecoration(prefixIcon: Icons.people_outline),
                    validator: (val) => val!.isEmpty ? 'Required' : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildFormField(
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
                  popupProps: const PopupProps.menu(
                    fit: FlexFit.loose,
                    menuProps: MenuProps(backgroundColor: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildFormField(
                label: 'Active Status',
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
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
                          fontSize: 13,
                        ),
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          value: _isActive,
                          onChanged: (val) => setState(() => _isActive = val),
                          activeTrackColor: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: _save,
                  icon: const Icon(Icons.save_outlined, size: 18),
                  label: const Text('Save Changes', style: TextStyle(fontSize: 13)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: _delete,
                  icon: const Icon(Icons.delete_outline, size: 18),
                  label: const Text('Delete Table', style: TextStyle(fontSize: 13)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
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
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.blackGrey),
        ),
        const SizedBox(height: 6),
        child,
      ],
    );
  }

  InputDecoration _inputDecoration({required IconData prefixIcon}) {
    return InputDecoration(
      prefixIcon: Icon(prefixIcon, color: AppColors.primary, size: 18),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    );
  }
}
