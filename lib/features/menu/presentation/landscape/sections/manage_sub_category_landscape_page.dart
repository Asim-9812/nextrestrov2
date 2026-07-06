import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/error/error_handler.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import '../../../data/models/sub_category_model.dart';
import '../../providers/menu_provider.dart';

class ManageSubCategoryLandscapePage extends ConsumerWidget {
  const ManageSubCategoryLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredSubCategories = ref.watch(filteredManageSubCategoriesProvider);
    final subCategoriesAsync = ref.watch(subCategoryEntitiesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Manage Sub Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    Text(
                      'View and edit your menu sub-categories',
                      style: TextStyle(color: AppColors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  onChanged: (val) => ref.read(manageSubCategorySearchQueryProvider.notifier).set(val),
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search Sub Category...',
                    hintStyle: const TextStyle(fontSize: 14),
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: AppColors.ashGrey),
        
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Section - Sub Category List
              Expanded(
                flex: 1,
                child: Container(
                  color: AppColors.bg,
                  child: subCategoriesAsync.when(
                    data: (_) {
                      if (filteredSubCategories.isEmpty) {
                        return const Center(child: Text('No sub-categories found'));
                      }
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                ref.read(isAddingSubCategoryProvider.notifier).set(true);
                                ref.read(selectedSubCategoryForEditProvider.notifier).select(null);
                              },
                              icon: const Icon(Icons.add, size: 18),
                              label: const Text('Add New Sub Category'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 48),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: filteredSubCategories.length,
                              itemBuilder: (context, index) {
                                return SubCategoryListCard(subCategory: filteredSubCategories[index]);
                              },
                            ),
                          ),
                        ],
                      );
                    },
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (err, stack) => Center(child: Text('Error: $err')),
                  ),
                ),
              ),
              const VerticalDivider(width: 1, color: AppColors.ashGrey),
              // Right Section - Details & Edit
              const Expanded(
                flex: 2,
                child: SubCategoryDetailSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SubCategoryListCard extends ConsumerWidget {
  final SubCategoryModel subCategory;

  const SubCategoryListCard({super.key, required this.subCategory});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSubCategory = ref.watch(selectedSubCategoryForEditProvider);
    final isAdding = ref.watch(isAddingSubCategoryProvider);
    final categoryMap = ref.watch(categoryNameMapProvider);
    final isSelected = selectedSubCategory?.subCategoryId == subCategory.subCategoryId;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          ref.read(selectedSubCategoryForEditProvider.notifier).select(subCategory);
          ref.read(isAddingSubCategoryProvider.notifier).set(false);
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: (isSelected && !isAdding) ? AppColors.primary : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.ashGrey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.category, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subCategory.subCategoryName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Category: ${subCategory.categoryName ?? categoryMap[subCategory.categoryId] ?? subCategory.categoryId}',
                      style: const TextStyle(color: AppColors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class SubCategoryDetailSection extends ConsumerWidget {
  const SubCategoryDetailSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdding = ref.watch(isAddingSubCategoryProvider);

    if (isAdding) {
      return const AddSubCategorySection();
    }

    return const SubCategoryEditSection();
  }
}

class SubCategoryEditSection extends ConsumerStatefulWidget {
  const SubCategoryEditSection({super.key});

  @override
  ConsumerState<SubCategoryEditSection> createState() => _SubCategoryEditSectionState();
}

class _SubCategoryEditSectionState extends ConsumerState<SubCategoryEditSection> {
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

  Future<void> _handleUpdate(BuildContext context) async {
    final selectedSubCategory = ref.read(selectedSubCategoryForEditProvider);
    if (selectedSubCategory == null || _selectedCategoryId == null) return;

    try {
      await ref.read(updateSubCategoryStateProvider.notifier).updateSubCategory(
        selectedSubCategory.subCategoryId,
        _selectedCategoryId!,
        _nameController.text,
      );
      if (context.mounted) {
        Toaster.success(context: context, message: 'Sub Category updated successfully', isLandscape: true);
      }
    } catch (e) {
       final failure = ErrorHandler.handleException(e);
       if (context.mounted) {
         Toaster.error(context: context, message: failure.message, isLandscape: true);
       }
    }
  }

  Future<void> _handleDelete(BuildContext context) async {
    final selectedSubCategory = ref.read(selectedSubCategoryForEditProvider);
    if (selectedSubCategory == null) return;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Sub Category'),
        content: Text('Are you sure you want to delete "${selectedSubCategory.subCategoryName}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true && context.mounted) {
      try {
        await ref.read(deleteSubCategoryStateProvider.notifier).deleteSubCategory(selectedSubCategory.subCategoryId);
        if (context.mounted) {
          ref.read(selectedSubCategoryForEditProvider.notifier).select(null);
          Toaster.success(context: context, message: 'Sub Category deleted successfully', isLandscape: true);
        }
      } catch (e) {
        final failure = ErrorHandler.handleException(e);
        if (context.mounted) {
          Toaster.error(context: context, message: failure.message, isLandscape: true);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedSubCategory = ref.watch(selectedSubCategoryForEditProvider);
    final categoriesAsync = ref.watch(categoriesProvider);
    final categoryMap = ref.watch(categoryNameMapProvider);
    final updateState = ref.watch(updateSubCategoryStateProvider);
    final deleteState = ref.watch(deleteSubCategoryStateProvider);
    final isLoading = updateState.isLoading || deleteState.isLoading;

    // Update controllers when selected sub category changes
    ref.listen<SubCategoryModel?>(selectedSubCategoryForEditProvider, (previous, next) {
      if (next != null) {
        _nameController.text = next.subCategoryName;
        setState(() {
          _selectedCategoryId = next.categoryId;
        });
      }
    });

    if (selectedSubCategory == null) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category_outlined, size: 64, color: AppColors.ashGrey),
            SizedBox(height: 16),
            Text(
              'Select a sub category to view details',
              style: TextStyle(color: AppColors.grey, fontSize: 16),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.ashGrey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.category, size: 40, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedSubCategory.subCategoryName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Category: ${selectedSubCategory.categoryName ?? categoryMap[selectedSubCategory.categoryId] ?? selectedSubCategory.categoryId}',
                      style: const TextStyle(color: AppColors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Edit Information',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
          ),
          const SizedBox(height: 12),
          _buildTextField('Sub Category Name', _nameController, enabled: !isLoading),
          const SizedBox(height: 16),
          const Text('Parent Category', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
          const SizedBox(height: 8),
          categoriesAsync.when(
            data: (categories) => DropdownButtonFormField<int>(
              value: _selectedCategoryId,
              items: categories.map((cat) => DropdownMenuItem(value: cat.categoryId, child: Text(cat.categoryName))).toList(),
              onChanged: isLoading ? null : (val) => setState(() => _selectedCategoryId = val),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.ashGrey),
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
            loading: () => const CircularProgressIndicator(),
            error: (_, __) => const Text('Error loading categories'),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: isLoading ? null : () => _handleUpdate(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: updateState.isLoading 
                    ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : const Text('Save Changes', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: isLoading ? null : () => _handleDelete(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.error,
                  side: const BorderSide(color: AppColors.error),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: deleteState.isLoading
                  ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: AppColors.error, strokeWidth: 2))
                  : const Icon(Icons.delete_outline),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool enabled = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          enabled: enabled,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.ashGrey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.ashGrey),
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final bool isOutline;

  const ActionButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 36,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color.withValues(alpha: 0.5)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: isOutline ? Colors.transparent : (color == Colors.blue ? Colors.blue : Colors.white),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: (color == Colors.blue && !isOutline) ? Colors.white : color,
            fontWeight: FontWeight.bold,
            fontSize: 13,
            fontFamily: 'Manrope',
          ),
        ),
      ),
    );
  }
}

class AddSubCategorySection extends ConsumerStatefulWidget {
  const AddSubCategorySection({super.key});

  @override
  ConsumerState<AddSubCategorySection> createState() => _AddSubCategorySectionState();
}

class _AddSubCategorySectionState extends ConsumerState<AddSubCategorySection> {
  final _nameController = TextEditingController();
  int? _selectedCategoryId;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final createState = ref.watch(createSubCategoryStateProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: createState.isLoading ? null : () => ref.read(isAddingSubCategoryProvider.notifier).set(false),
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 8),
              const Text(
                'Add New Sub Category',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Manrope',
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          _buildTextField(
            'Sub Category Name',
            _nameController,
            hint: 'e.g. Pasta',
            icon: Icons.label_outline,
            enabled: !createState.isLoading,
          ),
          const SizedBox(height: 16),
          const Text('Parent Category', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          const SizedBox(height: 8),
          categoriesAsync.when(
            data: (categories) => DropdownButtonFormField<int>(
              value: _selectedCategoryId,
              hint: const Text('Select Parent Category'),
              items: categories.map((cat) => DropdownMenuItem(value: cat.categoryId, child: Text(cat.categoryName))).toList(),
              onChanged: createState.isLoading ? null : (val) => setState(() => _selectedCategoryId = val),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.ashGrey),
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
            loading: () => const CircularProgressIndicator(),
            error: (_, __) => const Text('Error loading categories'),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: createState.isLoading ? null : () => _handleCreate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: createState.isLoading
                ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                : const Text('Create Sub Category', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {String? hint, IconData? icon, bool enabled = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          enabled: enabled,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: icon != null ? Icon(icon, color: AppColors.grey, size: 20) : null,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.ashGrey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.ashGrey),
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }

  Future<void> _handleCreate(BuildContext context) async {
    if (_nameController.text.isEmpty) {
      Toaster.error(context: context, message: 'Please enter a sub category name', isLandscape: true);
      return;
    }
    if (_selectedCategoryId == null) {
      Toaster.error(context: context, message: 'Please select a parent category', isLandscape: true);
      return;
    }

    try {
      await ref.read(createSubCategoryStateProvider.notifier).createSubCategory(
        _selectedCategoryId!,
        _nameController.text,
      );
      if (context.mounted) {
        Toaster.success(context: context, message: 'Sub Category created successfully', isLandscape: true);
        ref.read(isAddingSubCategoryProvider.notifier).set(false);
      }
    } catch (e) {
      final failure = ErrorHandler.handleException(e);
      if (context.mounted) {
        Toaster.error(context: context, message: failure.message, isLandscape: true);
      }
    }
  }
}
