import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/potrait/widgets/portrait_active_shift_card.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/potrait/widgets/portrait_orders_overview.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/potrait/widgets/portrait_sales_summary_chart.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/potrait/widgets/portrait_summary_bento_box.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/potrait/widgets/portrait_top_selling_section.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/potrait/widgets/recent_orders_section_portrait.dart';
import 'package:nextrestro/features/branch/presentation/pages/branch_page.dart';
import 'package:nextrestro/features/login/presentation/login_page.dart';
import 'package:nextrestro/features/menu/presentation/pages/menu_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/orders_page.dart';
import 'package:nextrestro/features/shift/presentation/shift_page.dart';
import 'package:nextrestro/features/tables/presentation/tables_page.dart';
import 'package:nextrestro/features/customer/presentation/pages/customer_page.dart';
import 'package:nextrestro/features/users/presentation/pages/staff_page.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'package:nextrestro/features/admin_dashboard/data/models/dashboard_summary_model.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/pages/dashboard_charts_page.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/providers/dashboard_controller.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/providers/dashboard_state.dart';
import 'package:nextrestro/features/reports/presentation/pages/reports_page.dart';
import 'package:nextrestro/features/department/presentation/pages/department_page.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/widgets/quick_actions_row.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_provider.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/providers/admin_navigation_provider.dart';

class AdminDashboardPotraitPage extends ConsumerStatefulWidget {
  const AdminDashboardPotraitPage({super.key});

  @override
  ConsumerState<AdminDashboardPotraitPage> createState() =>
      _AdminDashboardPotraitPageState();
}

class _AdminDashboardPotraitPageState extends ConsumerState<AdminDashboardPotraitPage> {
  // int _selectedIndex = 0; // Removed local state

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

  String _getPageTitle(int selectedIndex) {
    switch (selectedIndex) {
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
    final selectedIndex = ref.watch(adminDashboardTabControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        title: Text(
          _getPageTitle(selectedIndex),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 1,
        shadowColor: AppColors.border,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(dashboardControllerProvider);
              ref.invalidate(shiftManagementControllerProvider);
              ref.invalidate(orderControllerProvider);
            },
          ),
        ],
      ),
      drawer: _buildDrawer(selectedIndex),
      body: selectedIndex == 0
          ? _buildHomeTab()
          : IndexedStack(
              index: selectedIndex,
              children: [
                const SizedBox.shrink(), // Home handled separately
                const OrdersPage(),
                const TablesPage(),
                const MenuPage(),
                const ShiftPage(),
                const ReportsPage(),
                const CustomerPage(),
                const StaffPage(),
                const BranchPage(),
                const DepartmentPage(),
              ],
            ),
    );
  }

  void _showOpenShiftDialog(BuildContext context, WidgetRef ref, List<ShiftModel> allShifts) {
    final lastClosedShift = allShifts.firstWhere((s) => s.shiftStatus == 2, orElse: () => ShiftModel());
    final existingNames = allShifts.map((s) => s.shiftName ?? '').where((name) => name.isNotEmpty).toSet().toList().cast<String>();

    final TextEditingController amountController = TextEditingController(text: lastClosedShift.closingAmount?.toStringAsFixed(2) ?? '0.00');
    final TextEditingController nameController = TextEditingController();
    String? selectedName = existingNames.isNotEmpty ? existingNames.first : null;
    bool isAddingNewName = existingNames.isEmpty;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Open New Shift'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Shift Name', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: isAddingNewName
                          ? TextField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter shift name',
                              ),
                            )
                          : DropdownButtonFormField<String>(
                              initialValue: selectedName,
                              decoration: const InputDecoration(border: OutlineInputBorder()),
                              items: existingNames.map((name) => DropdownMenuItem(value: name, child: Text(name))).toList(),
                              onChanged: (val) => setState(() => selectedName = val),
                            ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: Icon(isAddingNewName ? Icons.list_rounded : Icons.add_rounded),
                      onPressed: () => setState(() => isAddingNewName = !isAddingNewName),
                      tooltip: isAddingNewName ? 'Choose from list' : 'Add new shift name',
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                        foregroundColor: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Opening Amount', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: 'Rs. ',
                    border: OutlineInputBorder(),
                    hintText: 'Enter opening amount',
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'This is pre-filled from the last shift\'s closing amount.',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
              onPressed: () {
                final name = isAddingNewName ? nameController.text : selectedName;
                if (name == null || name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter or select a shift name')));
                  return;
                }
                final amount = double.tryParse(amountController.text) ?? 0.0;
                ref.read(shiftManagementControllerProvider.notifier).openShift(name, amount);
                Navigator.pop(context);
              },
              child: const Text('Open Shift'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(int selectedIndex) {
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
                _buildDrawerItem(0, 'Dashboard', MaterialSymbols.space_dashboard_rounded, selectedIndex),
                _buildDrawerItem(1, 'Orders', Ion.receipt, selectedIndex),
                _buildDrawerItem(2, 'Tables', MaterialSymbols.table_bar, selectedIndex),
                _buildDrawerItem(3, 'Menu', Bx.food_menu, selectedIndex),
                _buildDrawerItem(4, 'Shift', MaterialSymbols.schedule, selectedIndex),
                _buildDrawerItem(5, 'Reports', MaterialSymbols.bar_chart, selectedIndex),
                _buildDrawerItem(6, 'Customers', Ion.ios_people, selectedIndex),
                _buildDrawerItem(7, 'Staffs', Ion.people_circle_sharp, selectedIndex),
                _buildDrawerItem(8, 'Branch', MaterialSymbols.store, selectedIndex),
                _buildDrawerItem(9, 'Department', MaterialSymbols.account_balance, selectedIndex),
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

  Widget _buildDrawerItem(int index, String title, String icon, int selectedIndex) {
    final isSelected = selectedIndex == index;
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
      selectedTileColor: AppColors.primary.withValues(alpha: 0.1),
      onTap: () {
        ref.read(adminDashboardTabControllerProvider.notifier).set(index);
        Navigator.pop(context);
      },
    );
  }

  Widget _buildHomeTab() {
    final shiftState = ref.watch(shiftManagementControllerProvider);
    final dashboardState = ref.watch(dashboardControllerProvider);
    final ordersState = ref.watch(orderControllerProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          shiftState.when(
            data: (data) {
              final shift = data.shifts.isNotEmpty && data.shifts.first.shiftStatus == 1 ? data.shifts.first : null;
              if (shift == null) {
                return _buildNoShiftCard(data.shifts);
              }
              return PortraitActiveShiftCard(
                shift: shift,
                openerName: data.selectedShiftOpenerName,
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Shift Error: $e'),
          ),

          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: QuickActionsRow(),
          ),

          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Overview',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                _buildCompactDateRangeSelector(dashboardState),
              ],
            ),
          ),
          const SizedBox(height: 16),
          
          dashboardState.when(
            data: (state) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  PortraitSummaryBentoBox(
                    current: state.currentSummary ?? DashboardSummaryModel(),
                    previous: state.previousSummary,
                    selectedRange: state.dateRange,
                    onShowChart: (metric) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardChartsPage(
                            metricName: metric,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  PortraitOrdersOverview(orders: ordersState.asData?.value ?? []),
                  const SizedBox(height: 24),
                  PortraitSalesSummaryChart(
                    summary: state.currentSummary ?? DashboardSummaryModel(),
                  ),
                  const SizedBox(height: 24),
                  PortraitTopSellingSection(
                    products: state.currentSummary?.topSellingProducts ?? [],
                    categories: state.currentSummary?.topSellingCategories ?? [],
                  ),
                ],
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Dashboard Error: $e'),
          ),

          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: RecentOrdersSectionPortrait(),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildCompactDateRangeSelector(AsyncValue<DashboardState> state) {
    return state.when(
      data: (data) => InkWell(
        onTap: () async {
          final RenderBox button = context.findRenderObject() as RenderBox;
          final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
          final RelativeRect position = RelativeRect.fromRect(
            Rect.fromPoints(
              button.localToGlobal(Offset.zero, ancestor: overlay),
              button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
            ),
            Offset.zero & overlay.size,
          );

          final result = await showMenu<DashboardDateRange>(
            context: context,
            position: position,
            items: DashboardDateRange.values.map((range) {
              return PopupMenuItem(
                value: range,
                child: Text(range.name.toUpperCase()),
              );
            }).toList(),
          );

          if (result == DashboardDateRange.custom) {
            _showCustomDateRangePicker(data.fromDate, data.toDate);
          } else if (result != null) {
            ref.read(dashboardControllerProvider.notifier).setDateRange(result);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.bg,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data.dateRange.name.toUpperCase(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const Icon(Icons.arrow_drop_down, size: 18, color: AppColors.primary),
            ],
          ),
        ),
      ),
      loading: () => const SizedBox(width: 40, height: 20, child: LinearProgressIndicator()),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Future<void> _showCustomDateRangePicker(DateTime? currentFrom, DateTime? currentTo) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(
        start: currentFrom ?? DateTime.now(),
        end: currentTo ?? DateTime.now(),
      ),
    );
    if (picked != null) {
      ref.read(dashboardControllerProvider.notifier).setDateRange(
        DashboardDateRange.custom,
        customFrom: picked.start,
        customTo: picked.end,
      );
    }
  }

  Widget _buildNoShiftCard(List<ShiftModel> allShifts) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.lightGrey.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.schedule, color: AppColors.lightGrey, size: 24),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No active shift',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'Open to start sales',
                  style: TextStyle(color: AppColors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => _showOpenShiftDialog(context, ref, allShifts),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Open'),
          ),
        ],
      ),
    );
  }
}
