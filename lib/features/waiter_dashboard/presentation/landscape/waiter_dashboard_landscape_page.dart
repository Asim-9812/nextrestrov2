import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/features/login/presentation/login_page.dart';
import 'package:nextrestro/features/menu/presentation/pages/menu_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/orders_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/landscape/widgets/place_order/widgets/waiter_menu_landscape_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/landscape/widgets/place_order/widgets/waiter_table_selection_landscape_page.dart';
import 'package:nextrestro/features/profile/presentation/profile_page.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';
import 'package:nextrestro/features/tables/presentation/tables_page.dart';
import '../widgets/waiter_sidebar.dart';
import '../widgets/waiter_header.dart';
import '../widgets/current_order_section.dart';

class WaiterDashboardLandscapePage extends ConsumerStatefulWidget {
  const WaiterDashboardLandscapePage({super.key});

  @override
  ConsumerState<WaiterDashboardLandscapePage> createState() => _WaiterDashboardLandscapePageState();
}

class _WaiterDashboardLandscapePageState extends ConsumerState<WaiterDashboardLandscapePage> {
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

  String _getPageTitle() {
    switch (_selectedIndex) {
      case 0: return 'Dashboard';
      case 1: return 'Orders';
      case 2: return 'Tables';
      case 3: return 'Menu';
      case 4: return 'Profile';
      default: return 'Dashboard';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Row(
        children: [
          WaiterSidebar(
            selectedIndex: _selectedIndex,
            onItemSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            onLogout: _handleLogout,
          ),
          Expanded(
            child: Column(
              children: [
                WaiterHeader(title: _getPageTitle()),
                Expanded(
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: [
                      _buildDashboardTab(),
                      const OrdersPage(),
                      const TablesPage(),
                      const MenuPage(),
                      const ProfilePage(),
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

  Widget _buildDashboardTab() {
    return Container(
      color: AppColors.bg,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Table Selection Section
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: const WaiterTableSelectionLandscapePage(),
            ),
          ),
          const SizedBox(width: 16),
          // Menu Section
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: const WaiterMenuLandscapePage(),
            ),
          ),
          const SizedBox(width: 16),
          // Current Order Section
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: const CurrentOrderSection(),
            ),
          ),
        ],
      ),
    );
  }
}
