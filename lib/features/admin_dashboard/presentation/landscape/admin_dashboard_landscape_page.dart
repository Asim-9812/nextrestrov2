import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/features/login/presentation/login_page.dart';
import 'package:nextrestro/features/menu/presentation/pages/menu_page.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';
import 'package:nextrestro/features/shift/presentation/shift_page.dart';
import 'package:nextrestro/features/tables/presentation/tables_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/orders_page.dart';
import 'widgets/admin_sidebar.dart';
import 'widgets/admin_header.dart';
import 'widgets/active_shift_card.dart';
import 'widgets/dashboard_overview_row.dart';
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
      backgroundColor: AppColors.bg,
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
                      _buildPlaceholderTab('Reports', Icons.bar_chart),
                      _buildPlaceholderTab('Customer Management', Icons.bar_chart),
                      _buildPlaceholderTab('Staff Management', Icons.people),
                      _buildPlaceholderTab('Branch Management', Icons.store),
                      _buildPlaceholderTab('Department Management', Icons.account_balance),
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

    return shiftState.when(
      data: (state) {
        final shift = state.shifts.isNotEmpty && state.shifts.first.shiftStatus == 1 ? state.shifts.first : null;
        final openerName = state.selectedShiftOpenerName;

        if (shift == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  onPressed: () => _showOpenShiftDialog(context, ref, state.shifts),
                  icon: const Icon(Icons.add),
                  label: const Text('Open Shift'),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActiveShiftCard(
                shift: shift,
                openerName: openerName,
              ),
              const SizedBox(height: 32),
              const Text(
                'Overview',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 16),
              DashboardOverviewRow(shift: shift),
              const SizedBox(height: 32),
              const RecentOrdersSection(),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
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
