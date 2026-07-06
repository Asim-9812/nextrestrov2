import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/error/error_handler.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import '../../../data/models/sub_category_model.dart';
import '../../providers/menu_provider.dart';

class ManageSubCategoryPortraitPage extends ConsumerStatefulWidget {
  const ManageSubCategoryPortraitPage({super.key});

  @override
  ConsumerState<ManageSubCategoryPortraitPage> createState() => _ManageSubCategoryPortraitPageState();
}

class _ManageSubCategoryPortraitPageState extends ConsumerState<ManageSubCategoryPortraitPage> {
  late TextEditingController _nameController;
  int? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    final selected = ref.read(selectedSubCategoryForEditProvider);
    _nameController = TextEditingController(text: selected?.subCategoryName ?? '');
    _selectedCategoryId = selected?.categoryId;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredSubCategories = ref.watch(filteredManageSubCategoriesProvider);
    final selectedSubCategory = ref.watch(selectedSubCategoryForEditProvider);
    final isAdding = ref.watch(isAddingSubCategoryProvider);
    final updateState = ref.watch(updateSubCategoryStateProvider);
    final deleteState = ref.watch(deleteSubCategoryStateProvider);
    final createState = ref.watch(createSubCategoryStateProvider);
    
    final isAnyLoading = updateState.isLoading || deleteState.isLoading || createState.isLoading;

    // Sync controllers if selected sub category changes
    ref.listen<SubCategoryModel?>(selectedSubCategoryForEditProvider, (prev, next) {
      if (next != null) {
        _nameController.text = next.subCategoryName;
        setState(() {
          _selectedCategoryId = next.categoryId;
        });
      }
    });

    return Column(
      children: [
        // Selection Tab Bar (List vs Add)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.ashGrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                _buildTabItem(0, 'Sub Categories', Icons.category_outlined, !isAdding && !isAnyLoading),
                _buildTabItem(1, 'Add New', Icons.add_circle_outline, isAdding && !isAnyLoading),
              ],
            ),
          ),
        ),

        // Search Bar under tabs (only in list mode)
        if (!isAdding && selectedSubCategory == null)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: SizedBox(
              height: 38,
              child: TextField(
                onChanged: (val) => ref.read(manageSubCategorySearchQueryProvider.notifier).set(val),
                style: const TextStyle(fontSize: 13),
                decoration: InputDecoration(
                  hintText: 'Search Sub Categories...',
                  hintStyle: const TextStyle(fontSize: 12, color: AppColors.grey),
                  prefixIcon: const Icon(Icons.search, size: 18),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.ashGrey, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.ashGrey, width: 0.5),
                  ),
                ),
              ),
            ),
          ),

        Expanded(
          child: isAdding 
            ? _buildAddForm(createState) 
            : (selectedSubCategory != null ? _buildEditView(selectedSubCategory, updateState, deleteState) : _buildList(filteredSubCategories)),
        ),
      ],
    );
  }

  Widget _buildTabItem(int index, String label, IconData icon, bool isSelected) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (index == 0) {
            ref.read(isAddingSubCategoryProvider.notifier).set(false);
          } else {
            ref.read(isAddingSubCategoryProvider.notifier).set(true);
            ref.read(selectedSubCategoryForEditProvider.notifier).select(null);
            _nameController.clear();
            setState(() => _selectedCategoryId = null);
          }
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isSelected ? [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))
            ] : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: isSelected ? AppColors.primary : AppColors.grey),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
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

  Widget _buildList(List<SubCategoryModel> subCategories) {
    if (subCategories.isEmpty) return const Center(child: Text('No sub categories found', style: TextStyle(fontSize: 12)));
    
    final categoryMap = ref.watch(categoryNameMapProvider);

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: subCategories.length,
      itemBuilder: (context, index) {
        final sub = subCategories[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () => ref.read(selectedSubCategoryForEditProvider.notifier).select(sub),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.ashGrey, width: 0.5),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 4))
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.ashGrey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.category, color: AppColors.primary),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sub.subCategoryName,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'Manrope'),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Category: ${sub.categoryName ?? categoryMap[sub.categoryId] ?? sub.categoryId}',
                          style: const TextStyle(color: AppColors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.grey),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEditView(SubCategoryModel subCategory, AsyncValue updateState, AsyncValue deleteState) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final categoryMap = ref.watch(categoryNameMapProvider);
    final isLoading = updateState.isLoading || deleteState.isLoading;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: isLoading ? null : () => ref.read(selectedSubCategoryForEditProvider.notifier).select(null),
            child: const Row(
              children: [
                Icon(Icons.arrow_back_ios, size: 14, color: AppColors.primary),
                SizedBox(width: 4),
                Text('Back to list', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.ashGrey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.category, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subCategory.subCategoryName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(
                      'Category: ${subCategory.categoryName ?? categoryMap[subCategory.categoryId] ?? subCategory.categoryId}',
                      style: const TextStyle(color: AppColors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildField('Sub Category Name', _nameController, icon: Icons.label_outline, enabled: !isLoading),
          const SizedBox(height: 16),
          const Text('Parent Category', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          categoriesAsync.when(
            data: (categories) => DropdownButtonFormField<int>(
              value: _selectedCategoryId,
              items: categories.map((cat) => DropdownMenuItem(value: cat.categoryId, child: Text(cat.categoryName))).toList(),
              onChanged: isLoading ? null : (val) => setState(() => _selectedCategoryId = val),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
              ),
            ),
            loading: () => const CircularProgressIndicator(),
            error: (_, __) => const Text('Error loading categories'),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLoading ? null : () => _handleUpdate(subCategory.subCategoryId),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: updateState.isLoading
                ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                : const Text('Save Changes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: isLoading ? null : () => _handleDelete(subCategory),
              icon: deleteState.isLoading 
                ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(color: AppColors.error, strokeWidth: 2))
                : const Icon(Icons.delete_outline, size: 16),
              label: const Text('Delete Sub Category', style: TextStyle(fontSize: 13)),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.error,
                side: const BorderSide(color: AppColors.error),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddForm(AsyncValue createState) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('New Sub Category', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          _buildField('Sub Category Name', _nameController, hint: 'e.g. Appetizers', icon: Icons.label_outline, enabled: !createState.isLoading),
          const SizedBox(height: 16),
          const Text('Parent Category', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          categoriesAsync.when(
            data: (categories) => DropdownButtonFormField<int>(
              value: _selectedCategoryId,
              hint: const Text('Select Parent Category'),
              items: categories.map((cat) => DropdownMenuItem(value: cat.categoryId, child: Text(cat.categoryName))).toList(),
              onChanged: createState.isLoading ? null : (val) => setState(() => _selectedCategoryId = val),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
              ),
            ),
            loading: () => const CircularProgressIndicator(),
            error: (_, __) => const Text('Error loading categories'),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: createState.isLoading ? null : _handleCreate,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: createState.isLoading
                ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                : const Text('Create Sub Category', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, {String? hint, IconData? icon, bool enabled = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          enabled: enabled,
          style: const TextStyle(fontSize: 13),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 12, color: AppColors.grey),
            prefixIcon: icon != null ? Icon(icon, size: 18, color: AppColors.grey) : null,
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
          ),
        ),
      ],
    );
  }

  Future<void> _handleUpdate(int id) async {
    if (_selectedCategoryId == null) {
      Toaster.error(context: context, message: 'Please select a parent category');
      return;
    }
    try {
      await ref.read(updateSubCategoryStateProvider.notifier).updateSubCategory(id, _selectedCategoryId!, _nameController.text);
      if (mounted) Toaster.success(context: context, message: 'Updated successfully');
    } catch (e) {
      if (mounted) Toaster.error(context: context, message: ErrorHandler.handleException(e).message);
    }
  }

  Future<void> _handleCreate() async {
    if (_nameController.text.isEmpty) {
      Toaster.error(context: context, message: 'Name is required');
      return;
    }
    if (_selectedCategoryId == null) {
      Toaster.error(context: context, message: 'Parent category is required');
      return;
    }
    try {
      await ref.read(createSubCategoryStateProvider.notifier).createSubCategory(_selectedCategoryId!, _nameController.text);
      if (mounted) {
        Toaster.success(context: context, message: 'Created successfully');
        ref.read(isAddingSubCategoryProvider.notifier).set(false);
      }
    } catch (e) {
      if (mounted) Toaster.error(context: context, message: ErrorHandler.handleException(e).message);
    }
  }

  Future<void> _handleDelete(SubCategoryModel sub) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete?', style: TextStyle(fontSize: 16)),
        content: Text('Delete ${sub.subCategoryName}?', style: const TextStyle(fontSize: 14)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('No', style: TextStyle(fontSize: 13))),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Yes', style: TextStyle(color: AppColors.error, fontSize: 13))),
        ],
      ),
    );
    if (confirm == true) {
       try {
         await ref.read(deleteSubCategoryStateProvider.notifier).deleteSubCategory(sub.subCategoryId);
         ref.read(selectedSubCategoryForEditProvider.notifier).select(null);
         if (mounted) Toaster.success(context: context, message: 'Deleted');
       } catch (e) {
         if (mounted) Toaster.error(context: context, message: ErrorHandler.handleException(e).message);
       }
    }
  }
}
