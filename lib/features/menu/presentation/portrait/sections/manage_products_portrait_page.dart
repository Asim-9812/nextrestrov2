import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import '../../../data/models/product_model.dart';
import '../../providers/menu_provider.dart';
import '../../landscape/sections/manage_products_landscape_page.dart';


class ManageProductsPortraitPage extends ConsumerStatefulWidget {
  const ManageProductsPortraitPage({super.key});

  @override
  ConsumerState<ManageProductsPortraitPage> createState() => _ManageProductsPortraitPageState();
}

class _ManageProductsPortraitPageState extends ConsumerState<ManageProductsPortraitPage> {
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _priceController;
  int? _selectedCategoryId;
  int? _selectedSubCategoryId;
  bool _isTaxable = false;
  int _isActive = 1;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    final selected = ref.read(selectedProductForEditProvider);
    _nameController = TextEditingController(text: selected?.productName ?? '');
    _descController = TextEditingController(text: selected?.description ?? '');
    _priceController = TextEditingController(text: selected?.price.toString() ?? '');
    _selectedCategoryId = selected?.categoryId;
    _selectedSubCategoryId = selected?.subCategoryId;
    _isTaxable = selected?.isTaxable ?? false;
    _isActive = selected?.isActive ?? 1;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = ref.watch(filteredManageProductsProvider);
    final selectedProduct = ref.watch(selectedProductForEditProvider);
    final isAdding = ref.watch(isAddingProductProvider);
    final updateState = ref.watch(updateProductStateProvider);
    final deleteState = ref.watch(deleteProductStateProvider);
    final createState = ref.watch(createProductStateProvider);
    
    final isAnyLoading = updateState.isLoading || deleteState.isLoading || createState.isLoading;

    // Sync controllers
    ref.listen<ProductModel?>(selectedProductForEditProvider, (prev, next) {
      if (next != null) {
        _nameController.text = next.productName;
        _descController.text = next.description ?? '';
        _priceController.text = next.price.toString();
        setState(() {
          _selectedCategoryId = next.categoryId;
          _selectedSubCategoryId = next.subCategoryId;
          _isTaxable = next.isTaxable;
          _isActive = next.isActive;
          _selectedImage = null;
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
                _buildTabItem(0, 'Products', Icons.inventory_2_outlined, !isAdding && !isAnyLoading),
                _buildTabItem(1, 'Add New', Icons.add_circle_outline, isAdding && !isAnyLoading),
              ],
            ),
          ),
        ),

        // Search Bar under tabs (only in list mode)
        if (!isAdding && selectedProduct == null)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: SizedBox(
              height: 38,
              child: TextField(
                onChanged: (val) => ref.read(manageProductSearchQueryProvider.notifier).set(val),
                enabled: !isAnyLoading,
                style: const TextStyle(fontSize: 13),
                decoration: InputDecoration(
                  hintText: 'Search Products...',
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
            : (selectedProduct != null ? _buildEditView(selectedProduct, updateState, deleteState) : _buildList(filteredProducts)),
        ),
      ],
    );
  }

  Widget _buildTabItem(int index, String label, IconData icon, bool isSelected) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (index == 0) {
            ref.read(isAddingProductProvider.notifier).set(false);
          } else {
            ref.read(isAddingProductProvider.notifier).set(true);
            ref.read(selectedProductForEditProvider.notifier).select(null);
            _resetForm();
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

  void _resetForm() {
    _nameController.clear();
    _descController.clear();
    _priceController.clear();
    _selectedCategoryId = null;
    _selectedSubCategoryId = null;
    _isTaxable = false;
    _isActive = 1;
    _selectedImage = null;
  }

  Widget _buildList(List<ProductModel> products) {
    if (products.isEmpty) return const Center(child: Text('No products found', style: TextStyle(fontSize: 12)));
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final p = products[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () => ref.read(selectedProductForEditProvider.notifier).select(p),
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
                  ProductImage(product: p, size: 50),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p.productName,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'Manrope'),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rs. ${p.price}',
                          style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12),
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

  Widget _buildEditView(ProductModel p, AsyncValue updateState, AsyncValue deleteState) {
    final isLoading = updateState.isLoading || deleteState.isLoading;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: isLoading ? null : () => ref.read(selectedProductForEditProvider.notifier).select(null),
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios, size: 14, color: AppColors.primary),
                const SizedBox(width: 4),
                Text('Back to list', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Stack(
              children: [
                ProductImage(product: p, size: 80, localImage: _selectedImage),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: isLoading ? null : _pickImage,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt, color: Colors.white, size: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildField('Product Name', _nameController, icon: Icons.shopping_bag_outlined, enabled: !isLoading),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: _buildField('Price', _priceController, isNumber: true, icon: Icons.payments_outlined, enabled: !isLoading),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildField('Description', _descController, isMultiline: true, icon: Icons.description_outlined, enabled: !isLoading),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildCategoryDropdown(isLoading)),
              const SizedBox(width: 12),
              Expanded(child: _buildSubCategoryDropdown(isLoading)),
            ],
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            dense: true,
            title: const Text('Is Taxable?', style: TextStyle(fontSize: 13)),
            value: _isTaxable,
            onChanged: isLoading ? null : (v) => setState(() => _isTaxable = v),
            activeColor: AppColors.primary,
          ),
          SwitchListTile(
            dense: true,
            title: const Text('Active Status', style: TextStyle(fontSize: 13)),
            value: _isActive == 1,
            onChanged: isLoading ? null : (v) => setState(() => _isActive = v ? 1 : 0),
            activeColor: AppColors.primary,
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLoading ? null : () => _handleUpdate(p),
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
        ],
      ),
    );
  }

  Widget _buildAddForm(AsyncValue createState) {
    final isLoading = createState.isLoading;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('New Product', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: _selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(_selectedImage!, fit: BoxFit.cover),
                        )
                      : const Icon(Icons.image, size: 30, color: AppColors.primary),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: isLoading ? null : _pickImage,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add_a_photo, color: Colors.white, size: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildField('Product Name', _nameController, hint: 'e.g. Burger', icon: Icons.shopping_bag_outlined, enabled: !isLoading),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: _buildField('Price', _priceController, hint: '0.00', isNumber: true, icon: Icons.payments_outlined, enabled: !isLoading),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildField('Description', _descController, hint: 'Optional...', isMultiline: true, icon: Icons.description_outlined, enabled: !isLoading),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildCategoryDropdown(isLoading)),
              const SizedBox(width: 12),
              Expanded(child: _buildSubCategoryDropdown(isLoading)),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLoading ? null : _handleCreate,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: createState.isLoading
                ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                : const Text('Add Product', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, {bool isMultiline = false, bool isNumber = false, String? hint, IconData? icon, bool enabled = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          enabled: enabled,
          maxLines: isMultiline ? 3 : 1,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
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

  Widget _buildCategoryDropdown(bool isLoading) {
    final catsAsync = ref.watch(categoriesProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Category', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        catsAsync.when(
          data: (cats) => DropdownButtonFormField<int>(
            value: cats.any((c) => c.categoryId == _selectedCategoryId) ? _selectedCategoryId : null,
            isExpanded: true,
            items: cats.map((c) => DropdownMenuItem(value: c.categoryId, child: Text(c.categoryName, style: const TextStyle(fontSize: 11), overflow: TextOverflow.ellipsis))).toList(),
            onChanged: isLoading ? null : (v) {
              setState(() {
                _selectedCategoryId = v;
                _selectedSubCategoryId = null; // Reset sub-category
              });
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
            ),
          ),
          loading: () => const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2)),
          error: (_, __) => const Text('Error', style: TextStyle(fontSize: 11)),
        ),
      ],
    );
  }

  Widget _buildSubCategoryDropdown(bool isLoading) {
    final subsAsync = ref.watch(subCategoryEntitiesProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Sub Category', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        subsAsync.when(
          data: (subs) {
            final filteredSubs = subs.where((s) => s.categoryId == _selectedCategoryId).toList();
            return DropdownButtonFormField<int>(
              value: filteredSubs.any((s) => s.subCategoryId == _selectedSubCategoryId) ? _selectedSubCategoryId : null,
              isExpanded: true,
              items: filteredSubs.map((s) => DropdownMenuItem(value: s.subCategoryId, child: Text(s.subCategoryName, style: const TextStyle(fontSize: 11), overflow: TextOverflow.ellipsis))).toList(),
              onChanged: isLoading ? null : (v) => setState(() => _selectedSubCategoryId = v),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
              ),
            );
          },
          loading: () => const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2)),
          error: (_, __) => const Text('Error', style: TextStyle(fontSize: 11)),
        ),
      ],
    );
  }

  Future<void> _handleUpdate(ProductModel old) async {
    try {
      final updated = old.copyWith(
        productName: _nameController.text,
        description: _descController.text,
        price: double.tryParse(_priceController.text) ?? 0.0,
        categoryId: _selectedCategoryId ?? 0,
        subCategoryId: _selectedSubCategoryId ?? 0,
        isTaxable: _isTaxable,
        isActive: _isActive,
      );
      await ref.read(updateProductStateProvider.notifier).updateProduct(
        updated, 
        image: _selectedImage,
      );
      if (mounted) Toaster.success(context: context, message: 'Updated');
    } catch (e) {
      if (mounted) Toaster.error(context: context, message: 'Update failed');
    }
  }

  Future<void> _handleCreate() async {
    if (_nameController.text.isEmpty || _selectedCategoryId == null) {
      Toaster.error(context: context, message: 'Name and Category required');
      return;
    }
    try {
      final userId = ref.read(sessionServiceProvider).getUser()?['userId'] ?? 0;
      final p = ProductModel(
        productId: 0,
        productName: _nameController.text,
        description: _descController.text,
        price: double.tryParse(_priceController.text) ?? 0.0,
        categoryId: _selectedCategoryId!,
        subCategoryId: _selectedSubCategoryId ?? 0,
        isTaxable: _isTaxable,
        isActive: _isActive,
        createdBy: userId is int ? userId : int.tryParse(userId.toString()) ?? 0,
      );
      await ref.read(createProductStateProvider.notifier).createProduct(
        p, 
        image: _selectedImage,
      );
      if (mounted) {
        Toaster.success(context: context, message: 'Added');
        ref.read(isAddingProductProvider.notifier).set(false);
      }
    } catch (e) {
      if (mounted) Toaster.error(context: context, message: 'Creation failed');
    }
  }
}
