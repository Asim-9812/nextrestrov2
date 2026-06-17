import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import '../../providers/menu_provider.dart';
import '../../landscape/sections/menu_item_card.dart';

class ManageMenuPortraitPage extends ConsumerWidget {
  const ManageMenuPortraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final selectedCategoryId = ref.watch(selectedCategoryIdProvider);
    final subCategories = ref.watch(subCategoriesProvider);
    final selectedSubName = ref.watch(selectedSubCategoryNameProvider);
    final filteredItems = ref.watch(filteredMenuItemsProvider);
    final itemsAsync = ref.watch(menuItemsProvider);

    return Column(
      children: [
        // Top Filter and Search Bar (Similar to Tables Portrait Header)
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Menu',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Select category and items',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 36,
                  child: TextField(
                    onChanged: (val) => ref.read(menuSearchQueryProvider.notifier).set(val),
                    style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      hintText: 'Search Menu...',
                      hintStyle: const TextStyle(fontSize: 11),
                      prefixIcon: const Icon(Icons.search, size: 18),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.ashGrey, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.ashGrey, width: 0.5),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Category Selection Tabs
        SizedBox(
          height: 38,
          child: categoriesAsync.when(
            data: (categories) => ListView.builder(
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
                  padding: const EdgeInsets.only(right: 6),
                  child: InkWell(
                    onTap: () {
                      ref.read(selectedCategoryIdProvider.notifier).set(cat.categoryId);
                      ref.read(selectedSubCategoryNameProvider.notifier).set('All');
                    },
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary : Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: isSelected ? AppColors.primary : AppColors.ashGrey,
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Iconify(
                            icon,
                            size: 13,
                            color: isSelected ? Colors.white : AppColors.blackGrey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            cat.categoryName,
                            style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? Colors.white : AppColors.blackGrey
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            loading: () => const Center(child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))),
            error: (err, stack) => const SizedBox.shrink(),
          ),
        ),

        const SizedBox(height: 12),

        // SubCategories Segmented Control
        if (subCategories.length > 1)
          Container(
            height: 34,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: AppColors.ashGrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: subCategories.length,
              itemBuilder: (context, index) {
                final sub = subCategories[index];
                final isSelected = selectedSubName == sub;
                return Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: InkWell(
                    onTap: () => ref.read(selectedSubCategoryNameProvider.notifier).set(sub),
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: isSelected ? [
                          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2, offset: const Offset(0, 1))
                        ] : null,
                      ),
                      child: Text(
                        sub,
                        style: TextStyle(
                          color: isSelected ? AppColors.primary : AppColors.grey,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 10,
                        ),
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
              if (filteredItems.isEmpty) {
                return const Center(child: Text('No items found', style: TextStyle(fontSize: 11)));
              }
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                ),
                itemCount: filteredItems.length,
                itemBuilder: (context, index) => MenuItemCard(
                  item: filteredItems[index],
                  isPortrait: true,
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(fontSize: 11))),
          ),
        ),
      ],
    );
  }
}
