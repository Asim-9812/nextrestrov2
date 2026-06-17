import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/tables/data/models/table_model.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';

class AddTablePotraitForm extends ConsumerStatefulWidget {
  const AddTablePotraitForm({super.key});

  @override
  ConsumerState<AddTablePotraitForm> createState() => _AddTablePotraitFormState();
}

class _AddTablePotraitFormState extends ConsumerState<AddTablePotraitForm> {
  final _formKey = GlobalKey<FormState>();
  final _tableNumberController = TextEditingController();
  final _capacityController = TextEditingController();
  Map<String, dynamic>? _selectedFloor;

  @override
  void dispose() {
    _tableNumberController.dispose();
    _capacityController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedFloor == null) {
        Toaster.warning(context: context, message: 'Please select a floor', isLandscape: false);
        return;
      }

      final newTable = TableModel(
        tableID: 0,
        tableNumber: _tableNumberController.text,
        capacity: int.parse(_capacityController.text),
        floorID: _selectedFloor!['floorID'] as int,
        floorName: _selectedFloor!['floorName'] as String,
        status: 'Available',
        isActive: true,
      );

      await ref.read(createTableStateProvider.notifier).createTable(newTable);

      if (mounted) {
        final state = ref.read(createTableStateProvider);
        if (state.hasError) {
          Toaster.error(context: context, message: 'Failed to add table: ${state.error}', isLandscape: false);
        } else {
          Toaster.success(context: context, message: 'Table added successfully!', isLandscape: false);
          _tableNumberController.clear();
          _capacityController.clear();
          setState(() => _selectedFloor = null);
          
          // Switch back to "All Tables" view to see the new table
          ref.read(selectedTableMenuProvider.notifier).set(0);
          // Refresh the list
          ref.invalidate(tablesStreamProvider);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final floors = ref.watch(floorsProvider);
    final createTableState = ref.watch(createTableStateProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add New Table',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Manrope',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create a new dining spot in your restaurant',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 32),
            
            TextFormField(
              controller: _tableNumberController,
              decoration: const InputDecoration(
                labelText: 'Table Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.tag),
                hintText: 'e.g., T-10 or 15',
              ),
              validator: (val) => val == null || val.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 20),
            
            TextFormField(
              controller: _capacityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Capacity (Seats)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.people_outline),
                hintText: 'Number of guests',
              ),
              validator: (val) {
                if (val == null || val.isEmpty) return 'Required';
                if (int.tryParse(val) == null) return 'Invalid number';
                return null;
              },
            ),
            const SizedBox(height: 20),
            
            DropdownSearch<Map<String, dynamic>>(
              items: (filter, props) => floors,
              itemAsString: (item) => item['floorName'] as String,
              selectedItem: _selectedFloor,
              onSelected: (val) => setState(() => _selectedFloor = val),
              compareFn: (item1, item2) => item1['floorID'] == item2['floorID'],
              decoratorProps: const DropDownDecoratorProps(
                decoration: InputDecoration(
                  labelText: 'Select Floor',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.layers_outlined),
                ),
              ),
              popupProps: const PopupProps.menu(
                showSearchBox: false,
                fit: FlexFit.loose,
              ),
            ),
            const SizedBox(height: 40),
            
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: createTableState.isLoading ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: createTableState.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Create Table',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Manrope',
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
