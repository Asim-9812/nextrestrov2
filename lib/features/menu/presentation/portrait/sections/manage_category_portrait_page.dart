import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/error/error_handler.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import '../../../data/models/category_model.dart';
import '../../providers/menu_provider.dart';
import '../../landscape/sections/manage_category_landscape_page.dart';

class ManageCategoryPortraitPage extends ConsumerStatefulWidget {
  const ManageCategoryPortraitPage({super.key});

  @override
  ConsumerState<ManageCategoryPortraitPage> createState() => _ManageCategoryPortraitPageState();
}

class _ManageCategoryPortraitPageState extends ConsumerState<ManageCategoryPortraitPage> {
  late TextEditingController _nameController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    final selected = ref.read(selectedCategoryForEditProvider);
    _nameController = TextEditingController(text: selected?.categoryName ?? '');
    _descController = TextEditingController(text: selected?.description ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredCategories = ref.watch(filteredManageCategoriesProvider);
    final selectedCategory = ref.watch(selectedCategoryForEditProvider);
    final isAdding = ref.watch(isAddingCategoryProvider);

    // Sync controllers if selected category changes
    ref.listen<CategoryModel?>(selectedCategoryForEditProvider, (prev, next) {
      if (next != null) {
        _nameController.text = next.categoryName;
        _descController.text = next.description ?? '';
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
                _buildTabItem(0, 'Categories', Icons.category_outlined, !isAdding),
                _buildTabItem(1, 'Add New', Icons.add_circle_outline, isAdding),
              ],
            ),
          ),
        ),

        // Search Bar under tabs (only in list mode)
        if (!isAdding && selectedCategory == null)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: SizedBox(
              height: 38,
              child: TextField(
                onChanged: (val) => ref.read(manageCategorySearchQueryProvider.notifier).set(val),
                style: const TextStyle(fontSize: 13),
                decoration: InputDecoration(
                  hintText: 'Search Categories...',
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
            ? _buildAddForm() 
            : (selectedCategory != null ? _buildEditView(selectedCategory) : _buildList(filteredCategories)),
        ),
      ],
    );
  }

  Widget _buildTabItem(int index, String label, IconData icon, bool isSelected) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (index == 0) {
            ref.read(isAddingCategoryProvider.notifier).set(false);
          } else {
            ref.read(isAddingCategoryProvider.notifier).set(true);
            ref.read(selectedCategoryForEditProvider.notifier).select(null);
            _nameController.clear();
            _descController.clear();
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

  Widget _buildList(List<CategoryModel> categories) {
    final itemsMapAsync = ref.watch(categoryItemsMapProvider);

    if (categories.isEmpty) return const Center(child: Text('No categories found', style: TextStyle(fontSize: 12)));
    
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final cat = categories[index];
        final itemCount = itemsMapAsync.maybeWhen(
          data: (map) => map[cat.categoryId]?.length ?? 0,
          orElse: () => 0,
        );

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () => ref.read(selectedCategoryForEditProvider.notifier).select(cat),
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
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: CollageImage(category: cat),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cat.categoryName,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'Manrope'),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$itemCount Items',
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

  Widget _buildEditView(CategoryModel category) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => ref.read(selectedCategoryForEditProvider.notifier).select(null),
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios, size: 14, color: AppColors.primary),
                const SizedBox(width: 4),
                Text('Back to list', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 60, height: 60, child: CollageImage(category: category)),
              const SizedBox(width: 16),
              Expanded(
                child: Text(category.categoryName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildField('Category Name', _nameController, icon: Icons.label_outline),
          const SizedBox(height: 16),
          _buildField('Description', _descController, isMultiline: true, icon: Icons.description_outlined),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _handleUpdate(category.categoryId),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Save Changes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _handleDelete(category),
              icon: const Icon(Icons.delete_outline, size: 16),
              label: const Text('Delete Category', style: TextStyle(fontSize: 13)),
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

  Widget _buildAddForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('New Category', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          _buildField('Category Name', _nameController, hint: 'e.g. Italian', icon: Icons.label_outline),
          const SizedBox(height: 16),
          _buildField('Description', _descController, hint: 'Optional description...', isMultiline: true, icon: Icons.description_outlined),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _handleCreate,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Create Category', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, {bool isMultiline = false, String? hint, IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: isMultiline ? 3 : 1,
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
    try {
      await ref.read(updateCategoryStateProvider.notifier).updateCategory(id, _nameController.text, _descController.text);
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
    try {
      await ref.read(createCategoryStateProvider.notifier).createCategory(_nameController.text, _descController.text);
      if (mounted) {
        Toaster.success(context: context, message: 'Created successfully');
        ref.read(isAddingCategoryProvider.notifier).set(false);
      }
    } catch (e) {
      if (mounted) Toaster.error(context: context, message: ErrorHandler.handleException(e).message);
    }
  }

  Future<void> _handleDelete(CategoryModel cat) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete?', style: TextStyle(fontSize: 16)),
        content: Text('Delete ${cat.categoryName}?', style: const TextStyle(fontSize: 14)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('No', style: TextStyle(fontSize: 13))),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Yes', style: TextStyle(color: AppColors.error, fontSize: 13))),
        ],
      ),
    );
    if (confirm == true) {
       try {
         await ref.read(deleteCategoryStateProvider.notifier).deleteCategory(cat.categoryId);
         ref.read(selectedCategoryForEditProvider.notifier).select(null);
         if (mounted) Toaster.success(context: context, message: 'Deleted');
       } catch (e) {
         if (mounted) Toaster.error(context: context, message: ErrorHandler.handleException(e).message);
       }
    }
  }
}
