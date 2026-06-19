import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/error/error_handler.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/department/data/models/department_model.dart';
import 'package:nextrestro/features/department/presentation/providers/department_provider.dart';

class DepartmentPortraitPage extends ConsumerStatefulWidget {
  const DepartmentPortraitPage({super.key});

  @override
  ConsumerState<DepartmentPortraitPage> createState() => _DepartmentPortraitPageState();
}

class _DepartmentPortraitPageState extends ConsumerState<DepartmentPortraitPage> {
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
    final isAdding = ref.watch(isAddingDepartmentProvider);

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
      body: Column(
        children: [
          // Tab Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.ashGrey.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  _buildTabItem(0, 'Department List', Icons.business_outlined, !isAdding),
                  _buildTabItem(1, 'Add New', Icons.add_business_outlined, isAdding),
                ],
              ),
            ),
          ),

          // Search (Only in list mode)
          if (!isAdding && selectedDepartment == null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: TextField(
                onChanged: (val) => ref.read(departmentSearchQueryProvider.notifier).set(val),
                decoration: InputDecoration(
                  hintText: 'Search departments...',
                  prefixIcon: const Icon(Icons.search, size: 20),
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                ),
              ),
            ),

          Expanded(
            child: isAdding 
              ? _buildFormSection(null) 
              : (selectedDepartment != null ? _buildFormSection(selectedDepartment) : _buildList(filteredDepartments)),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String label, IconData icon, bool isSelected) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (index == 0) {
            ref.read(isAddingDepartmentProvider.notifier).set(false);
            ref.read(selectedDepartmentForEditProvider.notifier).select(null);
          } else {
            ref.read(isAddingDepartmentProvider.notifier).set(true);
            ref.read(selectedDepartmentForEditProvider.notifier).select(null);
            _resetForm();
          }
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: isSelected ? AppColors.primary : AppColors.grey),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? AppColors.primary : AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList(List<DepartmentModel> list) {
    if (list.isEmpty) return const Center(child: Text('No departments found', style: TextStyle(color: AppColors.grey)));
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final d = list[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: AppColors.ashGrey, width: 0.5)),
          child: ListTile(
            onTap: () => ref.read(selectedDepartmentForEditProvider.notifier).select(d),
            leading: CircleAvatar(
              backgroundColor: (d.status ? AppColors.primary : AppColors.grey).withOpacity(0.1),
              child: Icon(Icons.business, color: d.status ? AppColors.primary : AppColors.grey, size: 20),
            ),
            title: Text(d.departmentName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            subtitle: Text(d.status ? 'Active' : 'Inactive', style: TextStyle(fontSize: 12, color: d.status ? Colors.green : Colors.red)),
            trailing: const Icon(Icons.chevron_right, size: 20, color: AppColors.ashGrey),
          ),
        );
      },
    );
  }

  Widget _buildFormSection(DepartmentModel? selected) {
    final isEdit = selected != null;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isEdit) ...[
              InkWell(
                onTap: () => ref.read(selectedDepartmentForEditProvider.notifier).select(null),
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios, size: 14, color: AppColors.primary),
                    const Text('Back to list', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
            _buildField('Department Name', _nameController),
            const SizedBox(height: 20),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Status (Active)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              value: _status,
              onChanged: (v) => setState(() => _status = v),
              activeTrackColor: AppColors.primary,
            ),
            
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => isEdit ? _handleUpdate(selected) : _handleCreate(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(isEdit ? 'Save Changes' : 'Create Department', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            if (isEdit) ...[
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => _handleDelete(selected),
                  icon: const Icon(Icons.delete_outline, size: 18),
                  label: const Text('Delete Department'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.error,
                    side: const BorderSide(color: AppColors.error),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          style: const TextStyle(fontSize: 13),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
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
        ref.read(isAddingDepartmentProvider.notifier).set(false);
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
