import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/error/error_handler.dart';
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
  late TextEditingController _imageUrlController;
  int? _selectedCategoryId;
  bool _isTaxable = false;
  int _isActive = 1;

  @override
  void initState() {
    super.initState();
    final selected = ref.read(selectedProductForEditProvider);
    _nameController = TextEditingController(text: selected?.productName ?? '');
    _descController = TextEditingController(text: selected?.description ?? '');
    _priceController = TextEditingController(text: selected?.price.toString() ?? '');
    _imageUrlController = TextEditingController(text: selected?.imageUrl ?? '');
    _selectedCategoryId = selected?.categoryId;
    _isTaxable = selected?.isTaxable ?? false;
    _isActive = selected?.isActive ?? 1;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = ref.watch(filteredManageProductsProvider);
    final selectedProduct = ref.watch(selectedProductForEditProvider);
    final isAdding = ref.watch(isAddingProductProvider);

    // Sync controllers
    ref.listen<ProductModel?>(selectedProductForEditProvider, (prev, next) {
      if (next != null) {
        _nameController.text = next.productName;
        _descController.text = next.description ?? '';
        _priceController.text = next.price.toString();
        _imageUrlController.text = next.imageUrl ?? '';
        setState(() {
          _selectedCategoryId = next.categoryId;
          _isTaxable = next.isTaxable;
          _isActive = next.isActive;
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
                _buildTabItem(0, 'Products', Icons.inventory_2_outlined, !isAdding),
                _buildTabItem(1, 'Add New', Icons.add_circle_outline, isAdding),
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
            ? _buildAddForm() 
            : (selectedProduct != null ? _buildEditView(selectedProduct) : _buildList(filteredProducts)),
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
    _imageUrlController.clear();
    _selectedCategoryId = null;
    _isTaxable = false;
    _isActive = 1;
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

  Widget _buildEditView(ProductModel p) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => ref.read(selectedProductForEditProvider.notifier).select(null),
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios, size: 14, color: AppColors.primary),
                const SizedBox(width: 4),
                Text('Back to list', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(child: ProductImage(product: p, size: 80)),
          const SizedBox(height: 20),
          _buildField('Product Name', _nameController, icon: Icons.shopping_bag_outlined),
          const SizedBox(height: 16),
          _buildField('Description', _descController, isMultiline: true, icon: Icons.description_outlined),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildField('Price', _priceController, isNumber: true, icon: Icons.payments_outlined)),
              const SizedBox(width: 12),
              Expanded(child: _buildCategoryDropdown()),
            ],
          ),
          const SizedBox(height: 16),
          _buildField('Image URL', _imageUrlController, icon: Icons.image_outlined),
          const SizedBox(height: 16),
          SwitchListTile(
            dense: true,
            title: const Text('Is Taxable?', style: TextStyle(fontSize: 13)),
            value: _isTaxable,
            onChanged: (v) => setState(() => _isTaxable = v),
            activeColor: AppColors.primary,
          ),
          SwitchListTile(
            dense: true,
            title: const Text('Active Status', style: TextStyle(fontSize: 13)),
            value: _isActive == 1,
            onChanged: (v) => setState(() => _isActive = v ? 1 : 0),
            activeColor: AppColors.primary,
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _handleUpdate(p),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Save Changes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
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
          const Text('New Product', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          _buildField('Product Name', _nameController, hint: 'e.g. Burger', icon: Icons.shopping_bag_outlined),
          const SizedBox(height: 16),
          _buildField('Description', _descController, hint: 'Optional...', isMultiline: true, icon: Icons.description_outlined),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildField('Price', _priceController, hint: '0.00', isNumber: true, icon: Icons.payments_outlined)),
              const SizedBox(width: 12),
              Expanded(child: _buildCategoryDropdown()),
            ],
          ),
          const SizedBox(height: 16),
          _buildField('Image URL', _imageUrlController, hint: 'https://...', icon: Icons.image_outlined),
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
              child: const Text('Add Product', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, {bool isMultiline = false, bool isNumber = false, String? hint, IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
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

  Widget _buildCategoryDropdown() {
    final catsAsync = ref.watch(categoriesProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Category', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        catsAsync.when(
          data: (cats) => DropdownButtonFormField<int>(
            value: cats.any((c) => c.categoryId == _selectedCategoryId) ? _selectedCategoryId : null,
            items: cats.map((c) => DropdownMenuItem(value: c.categoryId, child: Text(c.categoryName, style: const TextStyle(fontSize: 13)))).toList(),
            onChanged: (v) => setState(() => _selectedCategoryId = v),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
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

  Future<void> _handleUpdate(ProductModel old) async {
    try {
      final updated = old.copyWith(
        productName: _nameController.text,
        description: _descController.text,
        price: double.tryParse(_priceController.text) ?? 0.0,
        imageUrl: _imageUrlController.text,
        categoryId: _selectedCategoryId ?? 0,
        isTaxable: _isTaxable,
        isActive: _isActive,
      );
      await ref.read(updateProductStateProvider.notifier).updateProduct(updated);
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
      final p = ProductModel(
        productId: 0,
        productName: _nameController.text,
        description: _descController.text,
        price: double.tryParse(_priceController.text) ?? 0.0,
        categoryId: _selectedCategoryId!,
        imageUrl: _imageUrlController.text,
        isTaxable: _isTaxable,
        isActive: _isActive,
      );
      await ref.read(createProductStateProvider.notifier).createProduct(p);
      if (mounted) {
        Toaster.success(context: context, message: 'Added');
        ref.read(isAddingProductProvider.notifier).set(false);
      }
    } catch (e) {
      if (mounted) Toaster.error(context: context, message: 'Creation failed');
    }
  }
}
