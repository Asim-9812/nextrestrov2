import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/kitchen_dashboard/presentation/widgets/kitchen_drawer.dart';
import 'package:nextrestro/features/orders/presentation/pages/orders_page.dart';
import 'package:nextrestro/features/menu/presentation/pages/menu_page.dart';
import 'tabs/kitchen_overview_tab.dart';

class KitchenDashboardPortraitPage extends ConsumerStatefulWidget {
  const KitchenDashboardPortraitPage({super.key});

  @override
  ConsumerState<KitchenDashboardPortraitPage> createState() => _KitchenDashboardPortraitPageState();
}

class _KitchenDashboardPortraitPageState extends ConsumerState<KitchenDashboardPortraitPage> {
  int _selectedIndex = 0;

  String _getPageTitle() {
    switch (_selectedIndex) {
      case 0: return 'Dashboard';
      case 1: return 'Orders';
      case 2: return 'Menu';
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
      drawer: KitchenDrawer(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.pop(context);
        },
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const KitchenOverviewTab(),
          const OrdersPage(),
          const MenuPage(),
        ],
      ),
    );
  }
}
