import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/features/branch/presentation/pages/branch_page.dart';
import 'package:nextrestro/features/login/presentation/login_page.dart';
import 'package:nextrestro/features/menu/presentation/pages/menu_page.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';
import 'package:nextrestro/features/shift/presentation/shift_page.dart';
import 'package:nextrestro/features/tables/presentation/tables_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/orders_page.dart';
import 'package:nextrestro/features/customer/presentation/pages/customer_page.dart';
import 'package:nextrestro/features/users/presentation/pages/staff_page.dart';
import 'package:intl/intl.dart';
import 'package:nextrestro/features/admin_dashboard/data/models/dashboard_summary_model.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/pages/dashboard_charts_page.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/providers/dashboard_controller.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/providers/dashboard_state.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/widgets/summary_bento_box.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_provider.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/widgets/orders_overview_grid.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/widgets/sales_summary_pie_chart.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/widgets/top_selling_section.dart';
import 'package:nextrestro/features/department/presentation/pages/department_page.dart';
import 'package:nextrestro/features/reports/presentation/pages/reports_page.dart';
import 'widgets/admin_sidebar.dart';
import 'widgets/admin_header.dart';
import 'widgets/active_shift_card.dart';
import 'widgets/recent_orders_section.dart';

class AdminDashboardLandscapePage extends ConsumerStatefulWidget {
  const AdminDashboardLandscapePage({super.key});

  @override
  ConsumerState<AdminDashboardLandscapePage> createState() =>
      _AdminDashboardLandscapePageState();
}

class _AdminDashboardLandscapePageState
    extends ConsumerState<AdminDashboardLandscapePage> {
  int _selectedIndex = 0;
  bool _isSalesExpanded = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Row(
        children: [
          AdminSidebar(
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
                AdminHeader(title: _getPageTitle()),
                Expanded(
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: [
                      _buildHomeTab(),
                      _buildOrdersTab(),
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
                ),
              ],
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

  Widget _buildPlaceholderTab(String title, IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: AppColors.primary),
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

  Widget _buildHomeTab() {
    final shiftState = ref.watch(shiftManagementControllerProvider);
    final dashboardState = ref.watch(dashboardControllerProvider);
    final ordersState = ref.watch(orderControllerProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Shift Overview Card
          shiftState.when(
            data: (state) {
              final shift = state.shifts.isNotEmpty && state.shifts.first.shiftStatus == 1 ? state.shifts.first : null;
              if (shift == null) {
                return _buildNoShiftCard();
              }
              return ActiveShiftCard(
                shift: shift,
                openerName: state.selectedShiftOpenerName,
              );
            },
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stack) => Text('Shift Error: $error'),
          ),
          const SizedBox(height: 16),

          // Dashboard Overview Header
          Row(
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
              _buildDateRangeSelector(dashboardState),
            ],
          ),
          const SizedBox(height: 16),

          // Dashboard Summary Cards
          dashboardState.when(
            data: (state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SummaryBentoBox(
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
                
                // Row 1: Insights (Sales Summary & Orders Overview)
                SizedBox(
                  height: 320,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 1,
                        child: SalesSummaryPieChart(
                          summary: state.currentSummary ?? DashboardSummaryModel(),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 1,
                        child: ordersState.when(
                          data: (orders) => OrdersOverviewGrid(orders: orders),
                          loading: () => const Center(child: CircularProgressIndicator()),
                          error: (error, _) => Center(child: Text('Error: $error')),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Row 2: Activity (Recent Orders & Top Selling Items)
                SizedBox(
                  height: 480,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 3,
                        child: const RecentOrdersSection(),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 2,
                        child: TopSellingSection(
                          products: state.currentSummary?.topSellingProducts ?? [],
                          categories: state.currentSummary?.topSellingCategories ?? [],
                          isPortrait: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stack) => Center(child: Text('Dashboard Error: $error')),
          ),
        ],
      ),
    );
  }

  Widget _buildNoShiftCard() {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.schedule, size: 48, color: AppColors.lightGrey),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No active shift',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Open a shift to start recording sales.',
                style: TextStyle(color: AppColors.grey),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => _showOpenShiftDialog(context, ref, []),
            child: const Text('Open Shift'),
          ),
        ],
      ),
    );
  }

  Widget _buildDateRangeSelector(AsyncValue<DashboardState> state) {
    return state.when(
      data: (data) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<DashboardDateRange>(
                value: data.dateRange,
                isDense: true,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                items: DashboardDateRange.values.map((range) {
                  return DropdownMenuItem(
                    value: range,
                    child: Text(range.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val == DashboardDateRange.custom) {
                    _showCustomDateRangePicker(data.fromDate, data.toDate);
                  } else if (val != null) {
                    ref.read(dashboardControllerProvider.notifier).setDateRange(val);
                  }
                },
              ),
            ),
            if (data.dateRange == DashboardDateRange.custom) ...[
              const SizedBox(width: 8),
              Text(
                '${DateFormat('MMM dd').format(data.fromDate!)} - ${DateFormat('MMM dd').format(data.toDate!)}',
                style: const TextStyle(fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
            ],
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {
                ref.read(dashboardControllerProvider.notifier).setDateRange(data.dateRange);
                ref.invalidate(shiftManagementControllerProvider);
              },
              icon: const Icon(Icons.refresh, size: 16, color: AppColors.grey),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
      loading: () => const SizedBox(width: 100, child: LinearProgressIndicator()),
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

  void _showOpenShiftDialog(BuildContext context, WidgetRef ref, List<ShiftModel> allShifts) {
    final lastClosedShift = allShifts.firstWhere((s) => s.shiftStatus == 2, orElse: () => const ShiftModel());
    final List<String> existingNames = allShifts.map((s) => s.shiftName ?? '').where((name) => name.isNotEmpty).toSet().toList();

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

  Widget _buildOrdersTab() {
    return const OrdersPage();
  }
}
