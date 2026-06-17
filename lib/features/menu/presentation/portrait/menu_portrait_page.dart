import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import '../providers/menu_provider.dart';
import 'sections/manage_menu_portrait_page.dart';
import 'sections/manage_category_portrait_page.dart';
import 'sections/manage_products_portrait_page.dart';

class MenuPortraitPage extends ConsumerWidget {
  const MenuPortraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedMenuTabProvider);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: _buildMainContent(selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          currentIndex: _getBottomNavIndex(selectedIndex),
          onTap: (index) => _handleNavTap(ref, index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.grey,
          showUnselectedLabels: true,
          selectedFontSize: 11,
          unselectedFontSize: 10,
          iconSize: 20,
          items: const [
            BottomNavigationBarItem(
              icon: Iconify(MaterialSymbols.menu_book_rounded, color: AppColors.grey, size: 20),
              activeIcon: Iconify(MaterialSymbols.menu_book_rounded, color: AppColors.primary, size: 20),
              label: 'Menus',
            ),
            BottomNavigationBarItem(
              icon: Iconify(MaterialSymbols.category_rounded, color: AppColors.grey, size: 20),
              activeIcon: Iconify(MaterialSymbols.category_rounded, color: AppColors.primary, size: 20),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Iconify(MaterialSymbols.inventory_2_rounded, color: AppColors.grey, size: 20),
              activeIcon: Iconify(MaterialSymbols.inventory_2_rounded, color: AppColors.primary, size: 20),
              label: 'Products',
            ),
          ],
        ),
      ),
    );
  }

  int _getBottomNavIndex(int selectedTab) {
    if (selectedTab == 0) return 0;
    if (selectedTab >= 1 && selectedTab <= 4) return 1;
    if (selectedTab >= 5 && selectedTab <= 6) return 2;
    return 0;
  }

  void _handleNavTap(WidgetRef ref, int index) {
    switch (index) {
      case 0:
        ref.read(selectedMenuTabProvider.notifier).set(0);
        break;
      case 1:
        ref.read(selectedMenuTabProvider.notifier).set(1);
        break;
      case 2:
        ref.read(selectedMenuTabProvider.notifier).set(5);
        break;
    }
  }

  Widget _buildMainContent(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const ManageMenuPortraitPage();
      case 1:
      case 3:
        return const ManageCategoryPortraitPage();
      case 5:
        return const ManageProductsPortraitPage();
      default:
        return const ManageMenuPortraitPage();
    }
  }
}
