import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';

class KitchenSidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final VoidCallback onLogout;

  const KitchenSidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72, // Pixel-perfect match with AdminSidebar
      color: AppColors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Image.asset('assets/images/tempLogo.png'),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: _buildNavItems(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: onLogout,
                icon: const Icon(Icons.logout, color: Colors.red, size: 20),
                tooltip: 'Logout',
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildNavItems() {
    final items = [
      (MaterialSymbols.space_dashboard_rounded, 0, 'Dashboard'),
      (Ion.receipt, 1, 'Orders'),
      (MaterialSymbols.inventory_2_rounded, 2, 'Inventory'),
      (Bx.food_menu, 3, 'Menu'),
      (MaterialSymbols.schedule, 4, 'Shift Management'),
    ];

    return items.map((item) {
      final isSelected = selectedIndex == item.$2;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Material(
          color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
          child: InkWell(
            onTap: () => onItemSelected(item.$2),
            child: Container(
              height: 48,
              alignment: Alignment.center,
              child: Iconify(
                item.$1,
                color: isSelected ? AppColors.primary : AppColors.grey,
                size: 20,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}
