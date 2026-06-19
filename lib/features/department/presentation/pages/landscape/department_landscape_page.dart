import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/error/error_handler.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/department/data/models/department_model.dart';
import 'package:nextrestro/features/department/presentation/providers/department_provider.dart';

class DepartmentLandscapePage extends ConsumerStatefulWidget {
  const DepartmentLandscapePage({super.key});

  @override
  ConsumerState<DepartmentLandscapePage> createState() => _DepartmentLandscapePageState();
}

class _DepartmentLandscapePageState extends ConsumerState<DepartmentLandscapePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  bool _status = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredDepartments = ref.watch(filteredDepartmentsProvider);
    final selectedDepartment = ref.watch(selectedDepartmentForEditProvider);

    // Sync controllers for edit
    ref.listen<DepartmentModel?>(selectedDepartmentForEditProvider, (prev, next) {
      if (next != null) {
        _nameController.text = next.departmentName;
        setState(() {
          _status = next.status;
        });
      } else {
        _resetForm();
      }
    });

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Row(
        children: [
          // List Section
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: AppColors.ashGrey.withValues(alpha: 0.5))),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            ref.read(isAddingDepartmentProvider.notifier).set(true);
                            ref.read(selectedDepartmentForEditProvider.notifier).select(null);
                          },
                          icon: const Icon(Icons.add_business_outlined, size: 18),
                          label: const Text('Add New Department'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            elevation: 0,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          onChanged: (val) => ref.read(departmentSearchQueryProvider.notifier).set(val),
                          decoration: InputDecoration(
                            hintText: 'Search departments...',
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: _buildList(filteredDepartments)),
                ],
              ),
            ),
          ),

          // Form Section
          Expanded(
            flex: 3,
            child: _buildFormSection(selectedDepartment),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<DepartmentModel> list) {
    if (list.isEmpty) return const Center(child: Text('No departments found'));
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final d = list[index];
        final isSelected = ref.watch(selectedDepartmentForEditProvider)?.departmentID == d.departmentID;
        final isAdding = ref.watch(isAddingDepartmentProvider);
        
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          elevation: 0,
          color: (isSelected && !isAdding) ? AppColors.primary.withValues(alpha: 0.05) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: (isSelected && !isAdding) ? AppColors.primary : AppColors.ashGrey, width: (isSelected && !isAdding) ? 1 : 0.5),
          ),
          child: ListTile(
            onTap: () {
              ref.read(selectedDepartmentForEditProvider.notifier).select(d);
              ref.read(isAddingDepartmentProvider.notifier).set(false);
            },
            leading: Icon(Icons.business, color: d.status ? AppColors.primary : AppColors.grey),
            title: Text(d.departmentName, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(d.status ? 'Active' : 'Inactive', style: TextStyle(fontSize: 12, color: d.status ? Colors.green : Colors.red)),
            trailing: const Icon(Icons.chevron_right, size: 20),
          ),
        );
      },
    );
  }

  Widget _buildFormSection(DepartmentModel? selected) {
    final isAdding = ref.watch(isAddingDepartmentProvider);
    final isEdit = selected != null;

    if (!isAdding && !isEdit) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.business_outlined, size: 64, color: AppColors.ashGrey),
            SizedBox(height: 16),
            Text('Select a department to view or edit details', 
              style: TextStyle(color: AppColors.grey)),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(isEdit ? 'Edit Department' : 'Add New Department', 
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 24),
            _buildField('Department Name', _nameController),
            const SizedBox(height: 24),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Status (Active)', style: TextStyle(fontWeight: FontWeight.bold)),
              value: _status,
              onChanged: (v) => setState(() => _status = v),
              activeTrackColor: AppColors.primary,
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => isEdit ? _handleUpdate(selected) : _handleCreate(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(isEdit ? 'Update Department' : 'Create Department', 
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                if (isEdit) ...[
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _handleDelete(selected),
                      icon: const Icon(Icons.delete_outline),
                      label: const Text('Delete'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.error,
                        side: const BorderSide(color: AppColors.error),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.ashGrey)),
          ),
          validator: (val) => val == null || val.isEmpty ? 'Required' : null,
        ),
      ],
    );
  }

  void _resetForm() {
    _nameController.clear();
    setState(() {
      _status = true;
    });
  }

  Future<void> _handleUpdate(DepartmentModel old) async {
    if (!_formKey.currentState!.validate()) return;
    try {
      final updated = old.copyWith(
        departmentName: _nameController.text,
        status: _status,
      );
      await ref.read(updateDepartmentStateProvider.notifier).updateDepartment(updated);
      if (mounted) Toaster.success(context: context, message: 'Updated');
    } catch (e) {
      final failure = ErrorHandler.handleException(e);
      if (mounted) Toaster.error(context: context, message: failure.message);
    }
  }

  Future<void> _handleCreate() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      final d = DepartmentModel(
        departmentID: 0,
        departmentName: _nameController.text,
        status: _status,
      );
      await ref.read(addDepartmentStateProvider.notifier).createDepartment(d);
      if (mounted) {
        Toaster.success(context: context, message: 'Created');
        _resetForm();
      }
    } catch (e) {
      final failure = ErrorHandler.handleException(e);
      if (mounted) Toaster.error(context: context, message: failure.message);
    }
  }

  Future<void> _handleDelete(DepartmentModel d) async {
     final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Department'),
        content: Text('Delete "${d.departmentName}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, true), style: TextButton.styleFrom(foregroundColor: AppColors.error), child: const Text('Delete')),
        ],
      ),
    );

    if (confirm == true && mounted) {
      try {
        await ref.read(deleteDepartmentStateProvider.notifier).deleteDepartment(d.departmentID);
        if (mounted) {
          ref.read(selectedDepartmentForEditProvider.notifier).select(null);
          Toaster.success(context: context, message: 'Deleted');
        }
      } catch (e) {
        final failure = ErrorHandler.handleException(e);
        if (mounted) Toaster.error(context: context, message: failure.message);
      }
    }
  }
}
