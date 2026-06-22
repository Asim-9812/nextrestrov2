import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/features/login/presentation/login_page.dart';
import 'package:nextrestro/features/menu/presentation/pages/menu_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/orders_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/portrait/widgets/place_order/orders_place_order_portrait_page.dart';
import 'package:nextrestro/features/profile/presentation/profile_page.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/potrait/widgets/portrait_shift_header.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_provider.dart';
import 'package:nextrestro/features/tables/presentation/tables_page.dart';
import '../widgets/waiter_shift_details_card.dart';

class WaiterDashboardPotraitPage extends ConsumerStatefulWidget {
  const WaiterDashboardPotraitPage({super.key});

  @override
  ConsumerState<WaiterDashboardPotraitPage> createState() => _WaiterDashboardPotraitPageState();
}

class _WaiterDashboardPotraitPageState extends ConsumerState<WaiterDashboardPotraitPage> {
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
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        title: Text(
          _getPageTitle(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 1,
      ),
      drawer: _buildDrawer(),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildDashboardTab(),
          const OrdersPage(),
          const TablesPage(),
          const MenuPage(),
          const ProfilePage(),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      width: 200,
      child: Column(
        children: [
          SizedBox(
            height: 120,
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
                _buildDrawerItem(2, 'Tables', MaterialSymbols.table_bar),
                _buildDrawerItem(3, 'Menu', Bx.food_menu),
                _buildDrawerItem(4, 'Profile', MaterialSymbols.person),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red, size: 16),
            title: const Text('Logout', style: TextStyle(color: Colors.red, fontSize: 12)),
            onTap: () {
              Navigator.pop(context);
              _handleLogout();
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(int index, String title, String icon) {
    final isSelected = _selectedIndex == index;
    return ListTile(
      leading: Iconify(
        icon,
        color: isSelected ? AppColors.primary : AppColors.grey,
        size: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColors.primary : AppColors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 12,
        ),
      ),
      selected: isSelected,
      selectedTileColor: AppColors.primary.withOpacity(0.1),
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        Navigator.pop(context);
      },
    );
  }

  Widget _buildDashboardTab() {
    final shiftState = ref.watch(shiftControllerProvider);

    return shiftState.when(
      data: (data) {
        final shift = data.$1;
        final openerName = data.$2;

        return Column(
          children: [
            const SizedBox(height: 12),
            PortraitShiftHeader(shift: shift),
            const SizedBox(height: 12),
            if (shift != null)
              WaiterShiftDetailsCard(
                shift: shift,
                openerName: openerName,
              ),
            const SizedBox(height: 12),
            const Expanded(
              child: OrdersPlaceOrderPortraitPage(),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
