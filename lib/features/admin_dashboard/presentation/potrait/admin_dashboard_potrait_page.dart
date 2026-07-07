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
import 'package:intl/intl.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'package:nextrestro/features/admin_dashboard/data/models/dashboard_summary_model.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/pages/dashboard_charts_page.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/providers/dashboard_controller.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/providers/dashboard_state.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/widgets/summary_bento_box.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/widgets/top_selling_section.dart';
import 'package:nextrestro/features/department/presentation/pages/department_page.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(dashboardControllerProvider);
              ref.invalidate(shiftManagementControllerProvider);
            },
          ),
        ],
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
          const DepartmentPage(),
        ],
      ),
    );
  }

  void _showEndShiftDialog(BuildContext context, WidgetRef ref, ShiftModel shift) {
    final TextEditingController amountController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('End Shift'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Enter closing amount to end the shift.'),
            const SizedBox(height: 16),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Closing Amount',
                prefixText: 'Rs. ',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final amount = double.tryParse(amountController.text) ?? 0.0;
              ref.read(shiftManagementControllerProvider.notifier).endShift(shift, amount);
              Navigator.pop(context);
            },
            child: const Text('End Shift'),
          ),
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
      selectedTileColor: AppColors.primary.withValues(alpha: 0.1),
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        Navigator.pop(context);
      },
    );
  }

  Widget _buildHomeTab() {
    final shiftState = ref.watch(shiftManagementControllerProvider);
    final dashboardState = ref.watch(dashboardControllerProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 12),
          // Range Selector in Portrait
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: _buildDateRangeSelector(dashboardState),
          ),
          const SizedBox(height: 12),
          
          shiftState.when(
            data: (data) {
              final shift = data.shifts.isNotEmpty && data.shifts.first.shiftStatus == 1 ? data.shifts.first : null;
              if (shift == null) {
                return _buildNoShiftCard(data.shifts);
              }
              return Column(
                children: [
                  PortraitShiftHeader(
                    shift: shift,
                    onEndShift: () {
                      _showEndShiftDialog(context, ref, shift);
                    },
                  ),
                  const SizedBox(height: 12),
                  PortraitShiftDetailsCard(
                    shift: shift,
                    openerName: data.selectedShiftOpenerName,
                  ),
                ],
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, _) => Text('Shift Error: $e'),
          ),

          const SizedBox(height: 12),
          
          dashboardState.when(
            data: (state) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  SummaryBentoBox(
                    current: state.currentSummary ?? DashboardSummaryModel(),
                    previous: state.previousSummary,
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
                  const SizedBox(height: 12),
                  // In portrait, we might need a modified TopSellingSection or scrollable
                  TopSellingSection(
                    products: state.currentSummary?.topSellingProducts ?? [],
                    categories: state.currentSummary?.topSellingCategories ?? [],
                  ),
                ],
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Dashboard Error: $e'),
          ),

          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: RecentOrdersSectionPortrait(),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildDateRangeSelector(AsyncValue<DashboardState> state) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16, color: AppColors.primary),
              const SizedBox(width: 12),
              Expanded(
                child: state.when(
                  data: (data) => DropdownButton<DashboardDateRange>(
                    value: data.dateRange,
                    isExpanded: true,
                    underline: const SizedBox(),
                    style: const TextStyle(fontSize: 14, color: AppColors.black, fontWeight: FontWeight.bold),
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
                  loading: () => const LinearProgressIndicator(),
                  error: (_, stack) => const Text('Error'),
                ),
              ),
              if (state.asData?.value.dateRange == DashboardDateRange.custom)
                Text(
                  '${DateFormat('MM/dd').format(state.asData!.value.fromDate!)} - ${DateFormat('MM/dd').format(state.asData!.value.toDate!)}',
                  style: const TextStyle(fontSize: 12, color: AppColors.primary),
                ),
            ],
          ),
          const Divider(height: 1),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () {
                ref.read(dashboardControllerProvider.notifier).setDateRange(state.asData!.value.dateRange);
                ref.invalidate(shiftManagementControllerProvider);
              },
              icon: const Icon(Icons.refresh, size: 14),
              label: const Text('Refresh Dashboard', style: TextStyle(fontSize: 11)),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
        ],
      ),
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.schedule, color: AppColors.lightGrey),
          const SizedBox(width: 12),
          const Expanded(child: Text('No active shift', style: TextStyle(fontWeight: FontWeight.bold))),
          ElevatedButton(
            onPressed: () => _showOpenShiftDialog(context, ref, allShifts),
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0)),
            child: const Text('Open'),
          ),
        ],
      ),
    );
  }
}
