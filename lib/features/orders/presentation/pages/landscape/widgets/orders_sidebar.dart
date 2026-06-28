import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'orders_sidebar_item.dart';

class OrdersSidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const OrdersSidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // Increased width to accommodate labels
      decoration: const BoxDecoration(
        color: AppColors.white,
        // border: Border(
        //   left: BorderSide(color: AppColors.lightGrey),
        //   right: BorderSide(color: AppColors.lightGrey),
        // ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          OrdersSidebarItem(
            icon: MaterialSymbols.space_dashboard_rounded,
            label: 'Orders Dashboard',
            isSelected: selectedIndex == 0,
            onTap: () => onItemSelected(0),
          ),
          OrdersSidebarItem(
            icon: MaterialSymbols.add_shopping_cart,
            label: 'Place Orders',
            isSelected: selectedIndex == 1,
            onTap: () => onItemSelected(1),
          ),
          OrdersSidebarItem(
            icon: MaterialSymbols.pending_actions_rounded,
            label: 'Pending Orders',
            isSelected: selectedIndex == 2,
            onTap: () => onItemSelected(2),
          ),
          OrdersSidebarItem(
            icon: MaterialSymbols.settings_suggest_rounded,
            label: 'Manage Orders',
            isSelected: selectedIndex == 3,
            onTap: () => onItemSelected(3),
          ),
        ],
      ),
    );
  }
}
