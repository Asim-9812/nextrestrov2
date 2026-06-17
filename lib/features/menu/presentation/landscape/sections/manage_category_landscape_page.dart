import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/error/error_handler.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import '../../../data/models/category_model.dart';
import '../../providers/menu_provider.dart';

class ManageCategoryLandscapePage extends ConsumerWidget {
  const ManageCategoryLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredCategories = ref.watch(filteredManageCategoriesProvider);
    final categoriesAsync = ref.watch(categoriesProvider);

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
                      'Manage Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    Text(
                      'View and edit your menu categories',
                      style: TextStyle(color: AppColors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  onChanged: (val) => ref.read(manageCategorySearchQueryProvider.notifier).set(val),
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search Category...',
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
              // Left Section - Category List
              Expanded(
                flex: 1,
                child: Container(
                  color: AppColors.bg,
                  child: categoriesAsync.when(
                    data: (_) {
                      if (filteredCategories.isEmpty) {
                        return const Center(child: Text('No categories found'));
                      }
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                ref.read(isAddingCategoryProvider.notifier).set(true);
                                ref.read(selectedCategoryForEditProvider.notifier).select(null);
                              },
                              icon: const Icon(Icons.add, size: 18),
                              label: const Text('Add New Category'),
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
                              itemCount: filteredCategories.length,
                              itemBuilder: (context, index) {
                                return CategoryListCard(category: filteredCategories[index]);
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
                child: CategoryDetailSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryListCard extends ConsumerWidget {
  final CategoryModel category;

  const CategoryListCard({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryForEditProvider);
    final isAdding = ref.watch(isAddingCategoryProvider);
    final itemsMapAsync = ref.watch(categoryItemsMapProvider);
    final isSelected = selectedCategory?.categoryId == category.categoryId;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          ref.read(selectedCategoryForEditProvider.notifier).select(category);
          ref.read(isAddingCategoryProvider.notifier).set(false);
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
              // Collage Image
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CollageImage(category: category),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.categoryName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    const SizedBox(height: 4),
                    itemsMapAsync.when(
                      data: (map) {
                        final itemCount = map[category.categoryId]?.length ?? 0;
                        return Text(
                          '$itemCount Items',
                          style: const TextStyle(color: AppColors.grey, fontSize: 13),
                        );
                      },
                      loading: () => const SizedBox(
                        height: 10,
                        width: 10,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      error: (_, __) => const Text('0 Items'),
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

class CollageImage extends StatelessWidget {
  final CategoryModel category;
  const CollageImage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/images/momo.jpg';
    if (category.categoryName.toLowerCase().contains('drink') || 
        category.categoryName.toLowerCase().contains('beverage')) {
      imagePath = 'assets/images/drinks.jpg';
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.maxWidth / 2;
          return Wrap(
            children: List.generate(4, (index) => SizedBox(
              width: size,
              height: size,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            )),
          );
        },
      ),
    );
  }
}

class CategoryDetailSection extends ConsumerWidget {
  const CategoryDetailSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdding = ref.watch(isAddingCategoryProvider);

    if (isAdding) {
      return const AddCategorySection();
    }

    return const CategoryEditSection();
  }
}

class CategoryEditSection extends ConsumerStatefulWidget {
  const CategoryEditSection({super.key});

  @override
  ConsumerState<CategoryEditSection> createState() => _CategoryEditSectionState();
}

class _CategoryEditSectionState extends ConsumerState<CategoryEditSection> {
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
    final selectedCategory = ref.watch(selectedCategoryForEditProvider);
    final itemsMapAsync = ref.watch(categoryItemsMapProvider);

    // Update controllers when selected category changes
    ref.listen<CategoryModel?>(selectedCategoryForEditProvider, (previous, next) {
      if (next != null) {
        _nameController.text = next.categoryName;
        _descController.text = next.description ?? '';
      }
    });

    if (selectedCategory == null) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category_outlined, size: 64, color: AppColors.ashGrey),
            SizedBox(height: 16),
            Text(
              'Select a category to view details',
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
              SizedBox(
                width: 80,
                height: 80,
                child: CollageImage(category: selectedCategory),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedCategory.categoryName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      selectedCategory.description ?? 'No description provided',
                      style: const TextStyle(color: AppColors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    itemsMapAsync.when(
                      data: (map) {
                        final items = map[selectedCategory.categoryId] ?? [];
                        final subCount = items.map((e) => e.subCategoryName).toSet().length;
                        return Row(
                          children: [
                            _InfoChip(label: '$subCount Sub Categories', icon: Icons.layers_outlined),
                            const SizedBox(width: 12),
                            _InfoChip(label: '${items.length} Items', icon: Icons.restaurant_menu_outlined),
                          ],
                        );
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (_, __) => const Text('Error loading counts'),
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
          _buildTextField('Category Name', _nameController),
          const SizedBox(height: 16),
          _buildTextField('Description', _descController, isMultiline: true),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _handleUpdate(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Save Changes', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: () => _handleDelete(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.error,
                  side: const BorderSide(color: AppColors.error),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Icon(Icons.delete_outline),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isMultiline = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: isMultiline ? 3 : 1,
          style: TextStyle(fontSize: 14),
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

  Future<void> _handleUpdate(BuildContext context) async {
    final selectedCategory = ref.read(selectedCategoryForEditProvider);
    if (selectedCategory == null) return;

    try {
      await ref.read(updateCategoryStateProvider.notifier).updateCategory(
        selectedCategory.categoryId,
        _nameController.text,
        _descController.text,
      );
      if (context.mounted) {
        Toaster.success(context: context, message: 'Category updated successfully', isLandscape: true);
      }
    } catch (e) {
       final failure = ErrorHandler.handleException(e);
       if (context.mounted) {
         Toaster.error(context: context, message: failure.message, isLandscape: true);
       }
    }
  }

  Future<void> _handleDelete(BuildContext context) async {
    final selectedCategory = ref.read(selectedCategoryForEditProvider);
    if (selectedCategory == null) return;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Category'),
        content: Text('Are you sure you want to delete "${selectedCategory.categoryName}"?'),
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
        await ref.read(deleteCategoryStateProvider.notifier).deleteCategory(selectedCategory.categoryId);
        if (context.mounted) {
          ref.read(selectedCategoryForEditProvider.notifier).select(null);
          Toaster.success(context: context, message: 'Category deleted successfully', isLandscape: true);
        }
      } catch (e) {
        final failure = ErrorHandler.handleException(e);
        if (context.mounted) {
          Toaster.error(context: context, message: failure.message, isLandscape: true);
        }
      }
    }
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const _InfoChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.ashGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.primary),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class AddCategorySection extends ConsumerStatefulWidget {
  const AddCategorySection({super.key});

  @override
  ConsumerState<AddCategorySection> createState() => _AddCategorySectionState();
}

class _AddCategorySectionState extends ConsumerState<AddCategorySection> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => ref.read(isAddingCategoryProvider.notifier).set(false),
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 8),
              const Text(
                'Add New Category',
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
            'Category Name',
            _nameController,
            hint: 'e.g. Italian Cuisine',
            icon: Icons.label_outline,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            'Description',
            _descController,
            isMultiline: true,
            hint: 'Describe the contents of this category...',
            icon: Icons.description_outlined,
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _handleCreate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Create Category', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isMultiline = false, String? hint, IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: isMultiline ? 3 : 1,
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
      Toaster.error(context: context, message: 'Please enter a category name', isLandscape: true);
      return;
    }

    try {
      await ref.read(createCategoryStateProvider.notifier).createCategory(
        _nameController.text,
        _descController.text,
      );
      if (context.mounted) {
        Toaster.success(context: context, message: 'Category created successfully', isLandscape: true);
        ref.read(isAddingCategoryProvider.notifier).set(false);
      }
    } catch (e) {
      final failure = ErrorHandler.handleException(e);
      if (context.mounted) {
        Toaster.error(context: context, message: failure.message, isLandscape: true);
      }
    }
  }
}
