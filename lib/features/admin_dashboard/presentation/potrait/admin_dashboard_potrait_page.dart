import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/potrait/widgets/portrait_overview_row.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/potrait/widgets/portrait_shift_details_card.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/potrait/widgets/portrait_shift_header.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/potrait/widgets/recent_orders_section_portrait.dart';
import 'package:nextrestro/features/login/presentation/login_page.dart';
import 'package:nextrestro/features/menu/presentation/pages/menu_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/orders_page.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_provider.dart';
import 'package:nextrestro/features/shift/presentation/shift_page.dart';
import 'package:nextrestro/features/tables/presentation/tables_page.dart';
import 'package:nextrestro/features/customer/presentation/pages/customer_page.dart';
import 'package:nextrestro/features/users/presentation/pages/staff_page.dart';

class AdminDashboardPotraitPage extends ConsumerStatefulWidget {
  const AdminDashboardPotraitPage({super.key});

  @override
  ConsumerState<AdminDashboardPotraitPage> createState() =>
      _AdminDashboardPotraitPageState();
}

class _AdminDashboardPotraitPageState extends ConsumerState<AdminDashboardPotraitPage> {
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
      case 0:
        return 'Dashboard';
      case 1:
        return 'Orders Management';
      case 2:
        return 'Tables Management';
      case 3:
        return 'Menu Management';
      case 4:
        return 'Shift Management';
      case 5:
        return 'Reports';
      case 6:
        return 'Customer Management';
      case 7:
        return 'Staff Management';
      case 8:
        return 'Branch Management';
      case 9:
        return 'Department Management';
      default:
        return 'Dashboard';
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
        shadowColor: AppColors.border,
      ),
      drawer: _buildDrawer(),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeTab(),
          const OrdersPage(),
          const TablesPage(),
          const MenuPage(),
          const ShiftPage(),
          _buildPlaceholderTab('Reports', MaterialSymbols.bar_chart),
          const CustomerPage(),
          const StaffPage(),
          _buildPlaceholderTab('Branch Management', MaterialSymbols.store),
          _buildPlaceholderTab('Department Management', MaterialSymbols.account_balance),
        ],
      ),
    );
  }

  Widget _buildPlaceholderTab(String title, String icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Iconify(icon, size: 64, color: AppColors.primary),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
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
            height: 120, // Smaller fixed height
            child: DrawerHeader(
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(color: AppColors.primary),
              child: Center(
                child: Image.asset(
                  'assets/images/templogo.png',
                  height: 100, // Smaller logo
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
                _buildDrawerItem(4, 'Shift', MaterialSymbols.schedule),
                _buildDrawerItem(5, 'Reports', MaterialSymbols.bar_chart),
                _buildDrawerItem(6, 'Customers', Ion.ios_people),
                _buildDrawerItem(7, 'Staffs', Ion.people_circle_sharp),
                _buildDrawerItem(8, 'Branch', MaterialSymbols.store),
                _buildDrawerItem(9, 'Department', MaterialSymbols.account_balance),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red,size: 16,),
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
          fontSize: 12
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

  Widget _buildHomeTab() {
    final shiftState = ref.watch(shiftControllerProvider);

    return shiftState.when(
      data: (data) {
        final shift = data.$1;
        final openerName = data.$2;

        if (shift == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 64),
                const Icon(Icons.schedule, size: 64, color: AppColors.lightGrey),
                const SizedBox(height: 16),
                const Text(
                  'No shift open',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Implement Open Shift
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Open Shift'),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              PortraitShiftHeader(
                shift: shift,
                onEndShift: () {
                  // TODO: Implement End Shift via provider
                },
              ),
              const SizedBox(height: 12),
              PortraitShiftDetailsCard(
                shift: shift,
                openerName: openerName,
              ),
              const SizedBox(height: 12),
              PortraitOverviewRow(shift: shift),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: RecentOrdersSectionPortrait(),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
