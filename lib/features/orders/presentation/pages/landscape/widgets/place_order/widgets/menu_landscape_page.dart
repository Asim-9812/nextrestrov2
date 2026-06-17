import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/menu/presentation/providers/menu_provider.dart';
import 'package:nextrestro/features/orders/presentation/providers/place_order_provider.dart';
import 'package:nextrestro/features/menu/data/models/menu_item_model.dart';
import '../../../../../../data/models/place_order_request.dart';

class MenuLandscapePage extends ConsumerWidget {
  const MenuLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final selectedCategoryId = ref.watch(selectedCategoryIdProvider);
    final subCategories = ref.watch(subCategoriesProvider);
    final selectedSubName = ref.watch(selectedSubCategoryNameProvider);
    final itemsAsync = ref.watch(menuItemsProvider);
    final filteredItems = ref.watch(filteredMenuItemsProvider);

    return Container(
      color: AppColors.bg,
      child: Column(
        children: [
          // Header Row: Title and Search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Menu Items',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: TextField(
                    onChanged: (val) => ref.read(menuSearchQueryProvider.notifier).set(val),
                    style: const TextStyle(fontSize: 11),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: const TextStyle(fontSize: 11),
                      prefixIcon: const Icon(Icons.search, size: 14),
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Categories Horizontal List
          SizedBox(
            height: 28,
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
                                size: 14,
                                color: isSelected ? Colors.white : AppColors.blackGrey,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                cat.categoryName,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : AppColors.blackGrey,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  fontSize: 12,
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

          const SizedBox(height: 12),

          // SubCategories Horizontal List
          if (subCategories.length > 1)
            Container(
              height: 32,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.ashGrey.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
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
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                    child: InkWell(
                      onTap: () => ref.read(selectedSubCategoryNameProvider.notifier).set(sub),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: isSelected ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            )
                          ] : null,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Iconify(
                              icon,
                              size: 16,
                              color: isSelected ? AppColors.primary : AppColors.grey,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              sub,
                              style: TextStyle(
                                color: isSelected ? AppColors.primary : AppColors.grey,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                fontSize: 12,
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

          const SizedBox(height: 8),

          // Items Grid
          Expanded(
            child: itemsAsync.when(
              data: (_) {
                if (filteredItems.isEmpty) return const Center(child: Text('No items found'));
                return GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) => _MenuSelectionItemCard(item: filteredItems[index]),
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

class _MenuSelectionItemCard extends ConsumerWidget {
  final MenuItemModel item;
  const _MenuSelectionItemCard({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderItems = ref.watch(placeOrderProvider.select((s) => s.items));
    final quantity = orderItems.firstWhere((i) => i.productId == item.itemID, orElse: () => const PlaceOrderItem(productId: 0, itemName: '', quantity: 0, unitPrice: 0, subtotal: 0, specialInstructions: '')).quantity;

    String imagePath = 'assets/images/momo.jpg';
    if (item.categoryName.toLowerCase().contains('drink')) imagePath = 'assets/images/drinks.jpg';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(imagePath, width: double.infinity, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.itemName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text('Rs. ${item.price.toStringAsFixed(0)}', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Container(
                  height: 36,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withValues(alpha: 0.2),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => ref
                            .read(placeOrderProvider.notifier)
                            .updateQuantity(item.itemID, -1),
                        icon: const Icon(Icons.remove_rounded),
                        iconSize: 18,
                        splashRadius: 20,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 36,
                          minHeight: 36,
                        ),
                      ),

                      Container(
                        constraints: const BoxConstraints(minWidth: 32),
                        alignment: Alignment.center,
                        child: Text(
                          '$quantity',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),

                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(8),
                            right: Radius.circular(8),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () =>
                              ref.read(placeOrderProvider.notifier).addItem(item),
                          icon: const Icon(
                            Icons.add_rounded,
                            color: Colors.white,
                          ),
                          iconSize: 18,
                          splashRadius: 20,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            minWidth: 36,
                            minHeight: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
