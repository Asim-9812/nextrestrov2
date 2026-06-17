import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/menu/presentation/providers/menu_provider.dart';
import 'package:nextrestro/features/orders/presentation/providers/place_order_provider.dart';
import 'package:nextrestro/features/menu/data/models/menu_item_model.dart';
import '../../../../../../data/models/place_order_request.dart';

class MenuPortraitPage extends ConsumerWidget {
  const MenuPortraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final selectedCategoryId = ref.watch(selectedCategoryIdProvider);
    final subCategories = ref.watch(subCategoriesProvider);
    final selectedSubName = ref.watch(selectedSubCategoryNameProvider);
    final itemsAsync = ref.watch(menuItemsProvider);
    final filteredItems = ref.watch(filteredMenuItemsProvider);

    return Column(
      children: [
        // Search and Categories
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                onChanged: (val) => ref.read(menuSearchQueryProvider.notifier).set(val),
                decoration: InputDecoration(
                  hintText: 'Search menu items...',
                  prefixIcon: const Icon(Icons.search),
                  isDense: true,
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 40,
                child: categoriesAsync.when(
                  data: (categories) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      final isSelected = selectedCategoryId == cat.categoryId;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(cat.categoryName),
                          selected: isSelected,
                          onSelected: (val) {
                            ref.read(selectedCategoryIdProvider.notifier).set(cat.categoryId);
                            ref.read(selectedSubCategoryNameProvider.notifier).set('All');
                          },
                          selectedColor: AppColors.primary,
                          labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: 12),
                          backgroundColor: Colors.white,
                        ),
                      );
                    },
                  ),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),

        // Subcategories
        if (subCategories.length > 1)
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: SizedBox(
              height: 32,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: subCategories.length,
                itemBuilder: (context, index) {
                  final sub = subCategories[index];
                  final isSelected = selectedSubName == sub;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () => ref.read(selectedSubCategoryNameProvider.notifier).set(sub),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          sub,
                          style: TextStyle(
                            color: isSelected ? AppColors.primary : AppColors.grey,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

        // Items Grid
        Expanded(
          child: itemsAsync.when(
            data: (_) {
              if (filteredItems.isEmpty) return const Center(child: Text('No items found'));
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
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
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(imagePath, width: double.infinity, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.itemName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                Text('Rs. ${item.price.toStringAsFixed(0)}', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => ref.read(placeOrderProvider.notifier).updateQuantity(item.itemID, -1),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(color: AppColors.ashGrey.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(6)),
                        child: const Icon(Icons.remove, size: 18),
                      ),
                    ),
                    Text('$quantity', style: const TextStyle(fontWeight: FontWeight.bold)),
                    InkWell(
                      onTap: () => ref.read(placeOrderProvider.notifier).addItem(item),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(6)),
                        child: const Icon(Icons.add, size: 18, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
