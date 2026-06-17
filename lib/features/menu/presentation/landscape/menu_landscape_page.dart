import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import '../providers/menu_provider.dart';
import 'widgets/menu_sidebar_item.dart';
import 'widgets/menu_sidebar_dropdown.dart';
import 'sections/manage_menu_landscape_page.dart';
import 'sections/manage_category_landscape_page.dart';
import 'sections/manage_products_landscape_page.dart';

class MenuLandscapePage extends ConsumerWidget {
  const MenuLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedMenuTabProvider);
    final categoryExpanded = ref.watch(categoryExpandedProvider);
    final productExpanded = ref.watch(productExpandedProvider);

    return Scaffold(
      body: Row(
        children: [
          // Left Section - Sidebar Menu
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border(right: BorderSide(color: AppColors.ashGrey, width: 0.5)),
              ),
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    MenuSidebarItem(
                      icon: MaterialSymbols.menu_book_rounded,
                      label: 'Menus',
                      isSelected: selectedIndex == 0,
                      onTap: () => ref.read(selectedMenuTabProvider.notifier).set(0),
                    ),
                    MenuSidebarDropdown(
                      icon: MaterialSymbols.category_rounded,
                      label: 'Category',
                      isExpanded: categoryExpanded,
                      onToggle: () => ref.read(categoryExpandedProvider.notifier).toggle(),
                      items: [
                        DropdownSubItem(
                          label: 'Manage Category',
                          isSelected: selectedIndex == 1,
                          onTap: () => ref.read(selectedMenuTabProvider.notifier).set(1),
                        ),
                        DropdownSubItem(
                          label: 'Manage Sub Category',
                          isSelected: selectedIndex == 3,
                          onTap: () => ref.read(selectedMenuTabProvider.notifier).set(3),
                        ),
                      ],
                    ),
                    MenuSidebarDropdown(
                      icon: MaterialSymbols.inventory_2_rounded,
                      label: 'Products',
                      isExpanded: productExpanded,
                      onToggle: () => ref.read(productExpandedProvider.notifier).toggle(),
                      items: [
                        DropdownSubItem(
                          label: 'Manage Products',
                          isSelected: selectedIndex == 5,
                          onTap: () => ref.read(selectedMenuTabProvider.notifier).set(5),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Right Section - Content
          Expanded(
            flex: 4,
            child: Container(
              height: double.infinity,
              color: AppColors.bg,
              child: _buildMainContent(ref, selectedIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(WidgetRef ref, int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const ManageMenuLandscapePage();
      case 1:
        return const ManageCategoryLandscapePage();
      case 3:
        return const Center(child: Text('Manage Sub Category (Placeholder)'));
      case 5:
        return const ManageProductsLandscapePage();
      default:
        return const SizedBox.shrink();
    }
  }
}
