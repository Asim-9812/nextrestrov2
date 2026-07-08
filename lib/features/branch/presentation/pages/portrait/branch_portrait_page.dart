import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/error/error_handler.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/branch/data/models/branch_model.dart';
import 'package:nextrestro/features/branch/presentation/providers/branch_provider.dart';

class BranchPortraitPage extends ConsumerStatefulWidget {
  const BranchPortraitPage({super.key});

  @override
  ConsumerState<BranchPortraitPage> createState() => _BranchPortraitPageState();
}

class _BranchPortraitPageState extends ConsumerState<BranchPortraitPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredBranches = ref.watch(filteredBranchesProvider);
    final selectedBranch = ref.watch(selectedBranchForEditProvider);
    final isAdding = ref.watch(isAddingBranchProvider);

    // Sync controllers for edit
    ref.listen<BranchModel?>(selectedBranchForEditProvider, (prev, next) {
      if (next != null) {
        _nameController.text = next.branchName;
        _addressController.text = next.address;
        _phoneController.text = next.phoneNumber;
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
                  _buildTabItem(0, 'Branch List', Icons.store_outlined, !isAdding),
                  _buildTabItem(1, 'Add New', Icons.add_business_outlined, isAdding),
                ],
              ),
            ),
          ),

          // Search (Only in list mode)
          if (!isAdding && selectedBranch == null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: TextField(
                onChanged: (val) => ref.read(branchSearchQueryProvider.notifier).set(val),
                decoration: InputDecoration(
                  hintText: 'Search branches...',
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
              : (selectedBranch != null ? _buildFormSection(selectedBranch) : _buildList(filteredBranches)),
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
            ref.read(isAddingBranchProvider.notifier).set(false);
            ref.read(selectedBranchForEditProvider.notifier).select(null);
          } else {
            ref.read(isAddingBranchProvider.notifier).set(true);
            ref.read(selectedBranchForEditProvider.notifier).select(null);
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

  Widget _buildList(List<BranchModel> list) {
    if (list.isEmpty) return const Center(child: Text('No branches found', style: TextStyle(color: AppColors.grey)));
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final b = list[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: AppColors.ashGrey, width: 0.5)),
          child: ListTile(
            onTap: () => ref.read(selectedBranchForEditProvider.notifier).select(b),
            leading: CircleAvatar(
              backgroundColor: AppColors.primary.withValues(alpha: 0.1),
              child: const Icon(Icons.store, color: AppColors.primary, size: 20),
            ),
            title: Text(b.branchName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            subtitle: Text(b.address, style: const TextStyle(fontSize: 12, color: AppColors.grey)),
            trailing: const Icon(Icons.chevron_right, size: 20, color: AppColors.ashGrey),
          ),
        );
      },
    );
  }

  Widget _buildFormSection(BranchModel? selected) {
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
                onTap: () => ref.read(selectedBranchForEditProvider.notifier).select(null),
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back_ios, size: 14, color: AppColors.primary),
                    Text('Back to list', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
            _buildField('Branch Name', _nameController),
            const SizedBox(height: 20),
            _buildField('Address', _addressController),
            const SizedBox(height: 20),
            _buildField('Phone Number', _phoneController),
            
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
                child: Text(isEdit ? 'Save Changes' : 'Create Branch', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            if (isEdit) ...[
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => _handleDelete(selected),
                  icon: const Icon(Icons.delete_outline, size: 18),
                  label: const Text('Delete Branch'),
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
    _addressController.clear();
    _phoneController.clear();
  }

  Future<void> _handleUpdate(BranchModel old) async {
    if (!_formKey.currentState!.validate()) return;
    try {
      final updated = old.copyWith(
        branchName: _nameController.text,
        address: _addressController.text,
        phoneNumber: _phoneController.text,
      );
      await ref.read(updateBranchStateProvider.notifier).updateBranch(updated);
      if (mounted) Toaster.success(context: context, message: 'Updated');
    } catch (e) {
      final failure = ErrorHandler.handleException(e);
      if (mounted) Toaster.error(context: context, message: failure.message);
    }
  }

  Future<void> _handleCreate() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      final sessionService = ref.read(sessionServiceProvider);
      final user = sessionService.getUser();
      final companyId = user?['companyId'] ?? 1;

      final b = BranchModel(
        branchID: 0,
        companyID: companyId,
        branchName: _nameController.text,
        address: _addressController.text,
        phoneNumber: _phoneController.text,
      );
      await ref.read(addBranchStateProvider.notifier).createBranch(b);
      if (mounted) {
        Toaster.success(context: context, message: 'Created');
        ref.read(isAddingBranchProvider.notifier).set(false);
      }
    } catch (e) {
      final failure = ErrorHandler.handleException(e);
      if (mounted) Toaster.error(context: context, message: failure.message);
    }
  }

  Future<void> _handleDelete(BranchModel b) async {
     final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Branch'),
        content: Text('Delete "${b.branchName}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, true), style: TextButton.styleFrom(foregroundColor: AppColors.error), child: const Text('Delete')),
        ],
      ),
    );

    if (confirm == true && mounted) {
      try {
        await ref.read(deleteBranchStateProvider.notifier).deleteBranch(b.branchID!);
        if (mounted) {
          ref.read(selectedBranchForEditProvider.notifier).select(null);
          Toaster.success(context: context, message: 'Deleted');
        }
      } catch (e) {
        final failure = ErrorHandler.handleException(e);
        if (mounted) Toaster.error(context: context, message: failure.message);
      }
    }
  }
}
