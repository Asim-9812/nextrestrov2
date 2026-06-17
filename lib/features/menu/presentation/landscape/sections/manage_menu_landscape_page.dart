import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import '../../providers/menu_provider.dart';
import 'menu_item_card.dart';

class ManageMenuLandscapePage extends ConsumerWidget {
  const ManageMenuLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final selectedCategoryId = ref.watch(selectedCategoryIdProvider);
    final subCategories = ref.watch(subCategoriesProvider);
    final selectedSubName = ref.watch(selectedSubCategoryNameProvider);
    final filteredItems = ref.watch(filteredMenuItemsProvider);
    final itemsAsync = ref.watch(menuItemsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header and Search
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
                      'Menu',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Select category and items to manage',
                      style: TextStyle(color: AppColors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  onChanged: (val) => ref.read(menuSearchQueryProvider.notifier).set(val),
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search Menu...',
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

        // Categories Horizontal List
        SizedBox(
          height: 36,
          child: categoriesAsync.when(
            data: (categories) {
              if (categories.isEmpty) return const SizedBox.shrink();
              
              if (selectedCategoryId == null && categories.isNotEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                   ref.read(selectedCategoryIdProvider.notifier).set(categories.first.categoryId);
                });
              }

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
                              color: AppColors.primary.withOpacity(0.3),
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
                                fontSize: 14,
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
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error loading categories: $err')),
          ),
        ),

        const SizedBox(height: 24),

        // SubCategories Horizontal List
        if (subCategories.length > 1)
          Container(
            height: 44,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.ashGrey.withOpacity(0.2),
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
                            color: Colors.black.withOpacity(0.05),
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
                              fontSize: 14,
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

        const SizedBox(height: 16),

        // Menu Items Grid
        Expanded(
          child: itemsAsync.when(
            data: (_) {
              if (filteredItems.isEmpty) {
                return const Center(child: Text('No menu items found'));
              }
              return GridView.builder(
                padding: const EdgeInsets.all(24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.95,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return MenuItemCard(item: filteredItems[index]);
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error loading items: $err')),
          ),
        ),
      ],
    );
  }
}
