import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/features/login/presentation/login_page.dart';
import 'package:nextrestro/features/menu/presentation/pages/menu_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/orders_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/landscape/widgets/place_order/widgets/waiter_menu_landscape_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/landscape/widgets/place_order/widgets/waiter_table_selection_landscape_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/landscape/widgets/place_order/widgets/order_summary_landscape_page.dart';
import 'package:nextrestro/features/orders/presentation/providers/place_order_provider.dart';
import 'package:nextrestro/features/profile/presentation/profile_page.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';
import 'package:nextrestro/features/tables/presentation/tables_page.dart';
import '../widgets/waiter_sidebar.dart';
import '../widgets/waiter_header.dart';
import '../widgets/waiter_shift_details_card.dart';

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
    final isExpanded = ref.watch(placeOrderProvider.select((s) => s.isExpanded));

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
                  child: Stack(
                    children: [
                      // Main Content
                      IndexedStack(
                        index: _selectedIndex,
                        children: [
                          _buildDashboardTab(),
                          const OrdersPage(),
                          const TablesPage(),
                          const MenuPage(),
                          const ProfilePage(),
                        ],
                      ),
                      
                      // Dim overlay when expanded
                      if (_selectedIndex == 0 && isExpanded)
                        Positioned.fill(
                          child: GestureDetector(
                            onTap: () => ref.read(placeOrderProvider.notifier).toggleExpanded(),
                            child: Container(
                              color: Colors.black.withValues(alpha: 0.3),
                            ),
                          ),
                        ),

                      // Animated Footer/Overlay
                      if (_selectedIndex == 0)
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          tween: Tween<double>(
                            begin: 70,
                            end: isExpanded ? MediaQuery.of(context).size.height * 0.7 : 70,
                          ),
                          builder: (context, height, child) {
                            return Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              height: height,
                              child: GestureDetector(
                                onTap: isExpanded ? null : () => ref.read(placeOrderProvider.notifier).toggleExpanded(),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                                  child: Container(
                                    color: Colors.white,
                                    child: OverflowBox(
                                      alignment: Alignment.topCenter,
                                      minHeight: 0,
                                      maxHeight: MediaQuery.of(context).size.height * 0.7,
                                      child: const OrderSummaryLandscapePage(),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
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
    final shiftState = ref.watch(shiftManagementControllerProvider);

    return shiftState.when(
      data: (state) {
        final shift = state.shifts.isNotEmpty && state.shifts.first.shiftStatus == 1 ? state.shifts.first : null;
        final openerName = state.selectedShiftOpenerName;

        return Column(
          children: [
            const SizedBox(height: 12),
            if (shift != null)
              WaiterShiftDetailsCard(
                shift: shift,
                openerName: openerName,
              ),
            const SizedBox(height: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70), // Leave space for the footer
                child: Row(
                  children: const [
                    // Table Selection Section
                    Expanded(
                      flex: 2,
                      child: WaiterTableSelectionLandscapePage(),
                    ),
                    VerticalDivider(width: 1, thickness: 1, color: AppColors.ashGrey),
                    // Menu Section
                    Expanded(
                      flex: 5,
                      child: WaiterMenuLandscapePage(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
