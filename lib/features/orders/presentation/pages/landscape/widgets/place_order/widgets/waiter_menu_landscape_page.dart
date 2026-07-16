import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/menu/presentation/providers/menu_provider.dart';
import 'package:nextrestro/features/orders/presentation/providers/place_order_provider.dart';
import 'package:nextrestro/features/menu/data/models/menu_item_model.dart';
import 'package:nextrestro/features/orders/data/models/place_order_request.dart';

class WaiterMenuLandscapePage extends ConsumerWidget {
  const WaiterMenuLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final selectedCategoryId = ref.watch(selectedCategoryIdProvider);
    final subCategories = ref.watch(subCategoriesProvider);
    final selectedSubName = ref.watch(selectedSubCategoryNameProvider);
    final itemsAsync = ref.watch(menuItemsProvider);
    final filteredItems = ref.watch(filteredMenuItemsProvider);

    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          // Header Row: Title and Search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: [
                const Text(
                  'Menu',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
                ),
                const Spacer(), // Replaced SizedBox with Spacer for a big gap
                SizedBox(
                  width: 200, // Fixed small width for search field
                  child: TextField(
                    onChanged: (val) => ref.read(menuSearchQueryProvider.notifier).set(val),
                    style: const TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      hintText: 'Search menu items...',
                      hintStyle: const TextStyle(fontSize: 13, color: AppColors.grey),
                      prefixIcon: const Icon(Icons.search, size: 18, color: AppColors.grey),

                      filled: true,
                      fillColor: AppColors.bg,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Categories Horizontal List
          SizedBox(
            height: 36,
            child: categoriesAsync.when(
              data: (categories) {
                if (categories.isEmpty) return const SizedBox.shrink();
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    final isSelected = selectedCategoryId == cat.categoryId;
                    
                    String icon = MaterialSymbols.category_rounded;
                    if (cat.categoryName.toLowerCase().contains('food')) icon = MaterialSymbols.restaurant;
                    if (cat.categoryName.toLowerCase().contains('drink')) icon = MaterialSymbols.local_bar;
                    if (cat.categoryName.toLowerCase().contains('dessert')) icon = MaterialSymbols.icecream;
                    if (cat.categoryName.toLowerCase().contains('snack')) icon = MaterialSymbols.fastfood;

                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: InkWell(
                        onTap: () {
                          ref.read(selectedCategoryIdProvider.notifier).set(cat.categoryId);
                          ref.read(selectedSubCategoryNameProvider.notifier).set('All');
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primary : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected ? AppColors.primary : AppColors.ashGrey,
                            ),
                            boxShadow: isSelected ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              )
                            ] : null,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Iconify(
                                icon,
                                size: 16,
                                color: isSelected ? Colors.white : AppColors.blackGrey,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                cat.categoryName,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : AppColors.blackGrey,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  fontSize: 12, // Smaller font for categories
                                  fontFamily: 'Manrope',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ),

          const SizedBox(height: 8),

          // SubCategories Horizontal List
          if (subCategories.length > 1)
            Container(
              height: 32, // Smaller height
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.ashGrey.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemCount: subCategories.length,
                itemBuilder: (context, index) {
                  final sub = subCategories[index];
                  final isSelected = selectedSubName == sub;
                  
                  String icon = MaterialSymbols.list_alt_rounded;
                  if (sub == 'All') icon = MaterialSymbols.grid_view_rounded;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                    child: InkWell(
                      onTap: () => ref.read(selectedSubCategoryNameProvider.notifier).set(sub),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: isSelected ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            )
                          ] : null,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Iconify(
                              icon,
                              size: 14,
                              color: isSelected ? AppColors.primary : AppColors.grey,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              sub,
                              style: TextStyle(
                                color: isSelected ? AppColors.primary : AppColors.grey,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                fontSize: 12, // Smaller font
                                fontFamily: 'Manrope',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          const SizedBox(height: 4),

          // Items Grid
          Expanded(
            child: itemsAsync.when(
              data: (_) {
                if (filteredItems.isEmpty) return const Center(child: Text('No items found'));
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Changed to 3
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) => _WaiterMenuSelectionItemCard(item: filteredItems[index]),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }
}

class _WaiterMenuSelectionItemCard extends ConsumerWidget {
  final MenuItemModel item;
  const _WaiterMenuSelectionItemCard({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderItems = ref.watch(placeOrderProvider.select((s) => s.items));
    final quantity = orderItems.firstWhere((i) => i.productId == item.itemID, orElse: () => const PlaceOrderItem(productId: 0, itemName: '', quantity: 0, unitPrice: 0, subtotal: 0, specialInstructions: '')).quantity;

    String imagePath = 'assets/images/momo.jpg';
    if (item.categoryName.toLowerCase().contains('drink')) imagePath = 'assets/images/drinks.jpg';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.ashGrey.withValues(alpha: 0.5)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(imagePath, width: double.infinity, fit: BoxFit.cover),
                ),
                // Removed popular badge as isPopular is not in the model yet
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.itemName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, fontFamily: 'Manrope'), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text('Rs. ${item.price.toStringAsFixed(0)}', style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _qtyButton(Icons.remove, () => ref.read(placeOrderProvider.notifier).updateQuantity(item.itemID, -1)),
                    Expanded(
                      child: Center(
                        child: Text(
                          '$quantity',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ),
                    _qtyButton(Icons.add, () => ref.read(placeOrderProvider.notifier).addItem(item), isAdd: true),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap, {bool isAdd = false}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isAdd ? Colors.orange : AppColors.bg,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, size: 16, color: isAdd ? Colors.white : AppColors.blackGrey),
      ),
    );
  }
}