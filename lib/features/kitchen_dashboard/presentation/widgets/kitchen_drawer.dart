import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/features/login/presentation/login_page.dart';

class KitchenDrawer extends ConsumerWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const KitchenDrawer({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      width: 200, // Matching Admin/Waiter drawer width
      child: Column(
        children: [
          SizedBox(
            height: 120, // Matching Admin/Waiter header height
            child: DrawerHeader(
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(color: AppColors.primary),
              child: Center(
                child: Image.asset(
                  'assets/images/templogo.png',
                  height: 100,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(0, 'Dashboard', MaterialSymbols.space_dashboard_rounded),
                _buildDrawerItem(1, 'Orders', Ion.receipt),
                _buildDrawerItem(2, 'Inventory', MaterialSymbols.inventory_2_rounded),
                _buildDrawerItem(3, 'Menu', Bx.food_menu),
                _buildDrawerItem(4, 'Shift', MaterialSymbols.schedule),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red, size: 16),
            title: const Text('Logout', style: TextStyle(color: Colors.red, fontSize: 12)),
            onTap: () {
              Navigator.pop(context);
              _handleLogout(context, ref);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(int index, String title, String icon) {
    final isSelected = selectedIndex == index;
    return ListTile(
      leading: Iconify(
        icon,
        color: isSelected ? AppColors.primary : AppColors.grey,
        size: 16, // Matching Admin/Waiter icon size
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColors.primary : AppColors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 12, // Matching Admin/Waiter font size
        ),
      ),
      selected: isSelected,
      selectedTileColor: AppColors.primary.withOpacity(0.1),
      onTap: () => onItemSelected(index),
    );
  }

  void _handleLogout(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final nav = Navigator.of(context);
              await ref.read(sessionServiceProvider).clearSession();
              if (context.mounted) {
                nav.pop();
                nav.pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
