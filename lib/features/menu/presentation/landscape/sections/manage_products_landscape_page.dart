import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/error/error_handler.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import '../../../data/models/product_model.dart';
import '../../providers/menu_provider.dart';

class ManageProductsLandscapePage extends ConsumerWidget {
  const ManageProductsLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredProducts = ref.watch(filteredManageProductsProvider);
    final productsAsync = ref.watch(productsProvider);

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
                      'Manage Products',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    Text(
                      'View and edit your menu products',
                      style: TextStyle(color: AppColors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  onChanged: (val) => ref.read(manageProductSearchQueryProvider.notifier).set(val),
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search Product...',
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
              // Left Section - Product List
              Expanded(
                flex: 1,
                child: Container(
                  color: AppColors.bg,
                  child: productsAsync.when(
                    data: (_) {
                      if (filteredProducts.isEmpty) {
                        return const Center(child: Text('No products found'));
                      }
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                ref.read(isAddingProductProvider.notifier).set(true);
                                ref.read(selectedProductForEditProvider.notifier).select(null);
                              },
                              icon: const Icon(Icons.add, size: 18),
                              label: const Text('Add New Product'),
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
                              itemCount: filteredProducts.length,
                              itemBuilder: (context, index) {
                                return ProductListCard(product: filteredProducts[index]);
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
                child: ProductDetailSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductListCard extends ConsumerWidget {
  final ProductModel product;

  const ProductListCard({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProduct = ref.watch(selectedProductForEditProvider);
    final isAdding = ref.watch(isAddingProductProvider);
    final isSelected = selectedProduct?.productId == product.productId;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          ref.read(selectedProductForEditProvider.notifier).select(product);
          ref.read(isAddingProductProvider.notifier).set(false);
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
              // Product Image or Placeholder
              ProductImage(product: product, size: 48),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Rs. ${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 10),
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

class ProductImage extends StatelessWidget {
  final ProductModel product;
  final double size;
  const ProductImage({super.key, required this.product, required this.size});

  @override
  Widget build(BuildContext context) {
    if (product.imageUrl != null && product.imageUrl!.isNotEmpty) {
       return ClipRRect(
         borderRadius: BorderRadius.circular(12),
         child: Image.network(
           product.imageUrl!,
           width: size,
           height: size,
           fit: BoxFit.cover,
           errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
         ),
       );
    }
    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          product.productName.isNotEmpty ? product.productName[0].toUpperCase() : 'P',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: size * 0.4,
          ),
        ),
      ),
    );
  }
}

class ProductDetailSection extends ConsumerWidget {
  const ProductDetailSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdding = ref.watch(isAddingProductProvider);

    if (isAdding) {
      return const AddProductSection();
    }

    return const ProductEditSection();
  }
}

class ProductEditSection extends ConsumerStatefulWidget {
  const ProductEditSection({super.key});

  @override
  ConsumerState<ProductEditSection> createState() => _ProductEditSectionState();
}

class _ProductEditSectionState extends ConsumerState<ProductEditSection> {
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
    final selectedProduct = ref.watch(selectedProductForEditProvider);
    final categoriesAsync = ref.watch(categoriesProvider);

    ref.listen<ProductModel?>(selectedProductForEditProvider, (previous, next) {
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

    if (selectedProduct == null) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory_2_outlined, size: 64, color: AppColors.ashGrey),
            SizedBox(height: 16),
            Text(
              'Select a product to view details',
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
              ProductImage(product: selectedProduct, size: 64),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedProduct.productName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      selectedProduct.description ?? 'No description provided',
                      style: const TextStyle(color: AppColors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            'Edit Information',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
          ),
          const SizedBox(height: 12),
          _buildTextField('Product Name', _nameController),
          const SizedBox(height: 16),
          _buildTextField('Description', _descController, isMultiline: true),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildTextField('Price', _priceController, isNumber: true)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Category', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                    const SizedBox(height: 8),
                    categoriesAsync.when(
                      data: (categories) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.ashGrey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            value: categories.any((c) => c.categoryId == _selectedCategoryId) ? _selectedCategoryId : null,
                            isExpanded: true,
                            hint: const Text('Select Category', style: TextStyle(fontSize: 14)),
                            items: categories.map((cat) {
                              return DropdownMenuItem<int>(
                                value: cat.categoryId,
                                child: Text(cat.categoryName, style: const TextStyle(fontSize: 14)),
                              );
                            }).toList(),
                            onChanged: (val) => setState(() => _selectedCategoryId = val),
                          ),
                        ),
                      ),
                      loading: () => const LinearProgressIndicator(),
                      error: (_, __) => const Text('Error loading categories'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTextField(
            'Image URL',
            _imageUrlController,
            hint: 'https://example.com/image.jpg',
            icon: Icons.image_outlined,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: _isTaxable,
                onChanged: (val) => setState(() => _isTaxable = val ?? false),
                activeColor: AppColors.primary,
              ),
              const Text('Is Taxable', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 32),
              const Text('Status: ', style: TextStyle(fontSize: 14)),
              Switch(
                value: _isActive == 1,
                onChanged: (val) => setState(() => _isActive = val ? 1 : 0),
                activeColor: AppColors.primary,
              ),
              Text(_isActive == 1 ? 'Active' : 'Inactive', style: const TextStyle(fontSize: 14)),
            ],
          ),
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

  Widget _buildTextField(String label, TextEditingController controller, {bool isMultiline = false, bool isNumber = false, String? hint, IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: isMultiline ? 3 : 1,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          style: const TextStyle(fontSize: 14),
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

  Future<void> _handleUpdate(BuildContext context) async {
    final selected = ref.read(selectedProductForEditProvider);
    if (selected == null) return;

    try {
      final updatedProduct = selected.copyWith(
        productName: _nameController.text,
        description: _descController.text,
        price: double.tryParse(_priceController.text) ?? 0.0,
        categoryId: _selectedCategoryId ?? 0,
        imageUrl: _imageUrlController.text,
        isTaxable: _isTaxable,
        isActive: _isActive,
      );

      await ref.read(updateProductStateProvider.notifier).updateProduct(updatedProduct);
      if (context.mounted) {
        Toaster.success(context: context, message: 'Product updated successfully', isLandscape: true);
      }
    } catch (e) {
       final failure = ErrorHandler.handleException(e);
       if (context.mounted) {
         Toaster.error(context: context, message: failure.message, isLandscape: true);
       }
    }
  }

  Future<void> _handleDelete(BuildContext context) async {
    final selected = ref.read(selectedProductForEditProvider);
    if (selected == null) return;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Product'),
        content: Text('Are you sure you want to delete "${selected.productName}"?'),
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
        await ref.read(deleteProductStateProvider.notifier).deleteProduct(selected.productId);
        if (context.mounted) {
          ref.read(selectedProductForEditProvider.notifier).select(null);
          Toaster.success(context: context, message: 'Product deleted successfully', isLandscape: true);
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

class AddProductSection extends ConsumerStatefulWidget {
  const AddProductSection({super.key});

  @override
  ConsumerState<AddProductSection> createState() => _AddProductSectionState();
}

class _AddProductSectionState extends ConsumerState<AddProductSection> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageUrlController = TextEditingController();
  int? _selectedCategoryId;
  bool _isTaxable = false;
  int _isActive = 1;

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
    final categoriesAsync = ref.watch(categoriesProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => ref.read(isAddingProductProvider.notifier).set(false),
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 8),
              const Text(
                'Add New Product',
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
            'Product Name',
            _nameController,
            hint: 'e.g. Veggie Burger',
            icon: Icons.shopping_bag_outlined,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            'Description',
            _descController,
            isMultiline: true,
            hint: 'Describe the product details...',
            icon: Icons.description_outlined,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  'Price',
                  _priceController,
                  isNumber: true,
                  hint: '0.00',
                  icon: Icons.payments_outlined,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Category', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                    const SizedBox(height: 8),
                    categoriesAsync.when(
                      data: (categories) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.ashGrey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            value: _selectedCategoryId,
                            isExpanded: true,
                            hint: const Text('Select Category'),
                            items: categories.map((cat) {
                              return DropdownMenuItem<int>(
                                value: cat.categoryId,
                                child: Text(cat.categoryName),
                              );
                            }).toList(),
                            onChanged: (val) => setState(() => _selectedCategoryId = val),
                          ),
                        ),
                      ),
                      loading: () => const LinearProgressIndicator(),
                      error: (_, __) => const Text('Error loading categories'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTextField(
            'Image URL',
            _imageUrlController,
            hint: 'https://example.com/image.jpg',
            icon: Icons.image_outlined,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: _isTaxable,
                onChanged: (val) => setState(() => _isTaxable = val ?? false),
                activeColor: AppColors.primary,
              ),
              const Text('Is Taxable', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 32),
              const Text('Status: ', style: TextStyle(fontSize: 14)),
              Switch(
                value: _isActive == 1,
                onChanged: (val) => setState(() => _isActive = val ? 1 : 0),
                activeColor: AppColors.primary,
              ),
              Text(_isActive == 1 ? 'Active' : 'Inactive', style: const TextStyle(fontSize: 14)),
            ],
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
              child: const Text('Create Product', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isMultiline = false, bool isNumber = false, String? hint, IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: isMultiline ? 3 : 1,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
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
      Toaster.error(context: context, message: 'Please enter a product name', isLandscape: true);
      return;
    }
    
    if (_selectedCategoryId == null) {
      Toaster.error(context: context, message: 'Please select a category', isLandscape: true);
      return;
    }

    try {
      final newProduct = ProductModel(
        productId: 0,
        productName: _nameController.text,
        description: _descController.text,
        price: double.tryParse(_priceController.text) ?? 0.0,
        categoryId: _selectedCategoryId!,
        imageUrl: _imageUrlController.text,
        isTaxable: _isTaxable,
        isActive: _isActive,
      );

      await ref.read(createProductStateProvider.notifier).createProduct(newProduct);
      if (context.mounted) {
        Toaster.success(context: context, message: 'Product created successfully', isLandscape: true);
        ref.read(isAddingProductProvider.notifier).set(false);
      }
    } catch (e) {
      final failure = ErrorHandler.handleException(e);
      if (context.mounted) {
        Toaster.error(context: context, message: failure.message, isLandscape: true);
      }
    }
  }
}
