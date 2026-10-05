import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/app_product_image.dart';
import '../../../../injection_container.dart' as di;
import '../../../product/data/datasources/product_remote_data_source.dart';
import '../../../product/domain/entities/product.dart';
import '../../../product/presentation/pages/product_details_page.dart';

class AdminInventoryPage extends StatefulWidget {
  const AdminInventoryPage({super.key});

  @override
  State<AdminInventoryPage> createState() => _AdminInventoryPageState();
}

class _AdminInventoryPageState extends State<AdminInventoryPage> {
  bool _isLoading = true;
  String? _errorMessage;
  List<Product> _products = [];

  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Available', 'Low Stock', 'Out of Stock'];

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchInventory();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchInventory() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final items = await di.sl<ProductRemoteDataSource>().getAllProducts();
      if (!mounted) return;
      setState(() {
        _products = items;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e.toString().replaceAll('Exception: ', '');
        _isLoading = false;
      });
    }
  }

  String _getStockTag(Product product) {
    final qty = product.availableQty ?? 0.0;
    if (qty <= 0) return 'Out of Stock';
    if (qty <= 10) return 'Low Stock';
    return 'Available';
  }

  Color _getStockColor(String tag) {
    switch (tag) {
      case 'Out of Stock':
        return Colors.red;
      case 'Low Stock':
        return Colors.orange;
      case 'Available':
      default:
        return Colors.green;
    }
  }

  List<Product> get _filteredProducts {
    return _products.where((product) {
      final tag = _getStockTag(product);

      // 1. Stock Filter
      if (_selectedFilter != 'All' && tag != _selectedFilter) {
        return false;
      }

      // 2. Search Query
      if (_searchQuery.trim().isNotEmpty) {
        final q = _searchQuery.trim().toLowerCase();
        final matchesName = product.name.toLowerCase().contains(q);
        final matchesCategory = product.category.toLowerCase().contains(q);
        final matchesCode = (product.productCode ?? '').toLowerCase().contains(q);
        final matchesSku = (product.sku ?? '').toLowerCase().contains(q);
        final matchesBrand = (product.brandName ?? '').toLowerCase().contains(q);

        return matchesName || matchesCategory || matchesCode || matchesSku || matchesBrand;
      }

      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: AppColors.primaryLighter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.inventory_2_outlined, color: AppColors.primary, size: 24),
                      AppSizes.gapW8,
                      Text(
                        'Inventory & Stock',
                        style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                    tooltip: 'Refresh Inventory',
                    icon: const Icon(Icons.refresh, color: AppColors.primary),
                    onPressed: _fetchInventory,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Live stock tracking from e-commerce catalog (@getEcommerceProducts).',
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),

        // Search & Filter Bar
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search input
              TextField(
                controller: _searchController,
                onChanged: (val) {
                  setState(() {
                    _searchQuery = val;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search product name, category, SKU...',
                  prefixIcon: const Icon(Icons.search, color: AppColors.textTertiary),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, size: 18),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  filled: true,
                  fillColor: const Color(0xFFF0F7FC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              AppSizes.gapH12,

              // Stock Filter Chips
              SizedBox(
                height: 38,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _filters.length,
                  separatorBuilder: (context, _) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final filter = _filters[index];
                    final isSelected = filter == _selectedFilter;
                    return ChoiceChip(
                      label: Text(filter),
                      selected: isSelected,
                      selectedColor: AppColors.primary,
                      backgroundColor: const Color(0xFFF0F7FC),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : AppColors.textPrimary,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 12,
                      ),
                      onSelected: (val) {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Inventory List
        Expanded(
          child: _isLoading
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Loading inventory from API...', style: TextStyle(color: AppColors.textSecondary)),
                    ],
                  ),
                )
              : _errorMessage != null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error_outline, color: Colors.red, size: 48),
                            const SizedBox(height: 12),
                            Text(
                              'Error loading inventory',
                              style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _errorMessage!,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton.icon(
                              onPressed: _fetchInventory,
                              icon: const Icon(Icons.refresh, color: Colors.white),
                              label: const Text('Retry', style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                    )
                  : _filteredProducts.isEmpty
                      ? RefreshIndicator(
                          onRefresh: _fetchInventory,
                          child: ListView(
                            children: const [
                              SizedBox(height: 80),
                              Center(
                                child: Column(
                                  children: [
                                    Icon(Icons.inventory_2_outlined, size: 64, color: AppColors.textTertiary),
                                    SizedBox(height: 12),
                                    Text(
                                      'No products match criteria',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textSecondary),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Pull down to refresh catalog',
                                      style: TextStyle(fontSize: 12, color: AppColors.textTertiary),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: _fetchInventory,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            itemCount: _filteredProducts.length,
                            separatorBuilder: (context, _) => const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final product = _filteredProducts[index];
                              return _buildProductCard(product);
                            },
                          ),
                        ),
        ),
      ],
    );
  }

  Widget _buildProductCard(Product product) {
    final stockTag = _getStockTag(product);
    final stockColor = _getStockColor(stockTag);
    final availableQty = product.availableQty?.toInt() ?? 0;

    return InkWell(
      onTap: () {
        // Tapping leads to ProductDetailsPage in Admin ReadOnly View (No Cart/Wishlist buttons)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              product: product,
              isAdminView: true,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: const Color(0xFFEEEEEE)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Thumbnail
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.primarySoft,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AppProductImage(
                      imageUrl: product.images.isNotEmpty ? product.images.first : null,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AppSizes.gapW12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Category: ${product.category}${product.sku != null && product.sku!.isNotEmpty ? ' • SKU: ${product.sku}' : ''}',
                        style: AppTextStyles.bodySmall.copyWith(color: AppColors.textTertiary, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: AppTextStyles.bodySmall.copyWith(color: AppColors.textTertiary),
                    ),
                    Text(
                      'Rs. ${product.price.toStringAsFixed(2)}',
                      style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Qty',
                      style: AppTextStyles.bodySmall.copyWith(color: AppColors.textTertiary),
                    ),
                    Text(
                      '$availableQty units',
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: availableQty == 0
                            ? Colors.red
                            : availableQty <= 10
                                ? Colors.orange
                                : AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),

                // Tag Condition Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: stockColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    stockTag,
                    style: TextStyle(
                      color: stockColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
