import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/features/login/presentation/login_page.dart';
import 'package:nextrestro/features/menu/presentation/pages/menu_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/orders_page.dart';
import 'package:nextrestro/features/kitchen_dashboard/presentation/portrait/tabs/kitchen_overview_tab.dart';
import 'widgets/kitchen_sidebar.dart';
import 'widgets/kitchen_header.dart';

class KitchenDashboardLandscapePage extends ConsumerStatefulWidget {
  const KitchenDashboardLandscapePage({super.key});

  @override
  ConsumerState<KitchenDashboardLandscapePage> createState() => _KitchenDashboardLandscapePageState();
}

class _KitchenDashboardLandscapePageState extends ConsumerState<KitchenDashboardLandscapePage> {
  int _selectedIndex = 0;

  void _handleLogout() {
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
              if (mounted) {
                nav.pop(); // Close dialog
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

  String _getPageTitle() {
    switch (_selectedIndex) {
      case 0: return 'Dashboard';
      case 1: return 'Live Orders';
      case 2: return 'Menu Management';
      default: return 'Dashboard';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Row(
        children: [
          KitchenSidebar(
            selectedIndex: _selectedIndex,
            onItemSelected: (index) {
              setState(() => _selectedIndex = index);
            },
            onLogout: _handleLogout,
          ),
          Expanded(
            child: Column(
              children: [
                KitchenHeader(title: _getPageTitle()),
                Expanded(
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: [
                      const KitchenOverviewTab(),
                      const OrdersPage(),
                      const MenuPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
