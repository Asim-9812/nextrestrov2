import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/fiscal_year/presentation/providers/fiscal_year_provider.dart';
import 'package:nextrestro/features/branch/presentation/providers/branch_provider.dart';
import 'package:nextrestro/features/users/presentation/providers/staff_provider.dart';
import '../providers/reports_controller.dart';
import '../../../fiscal_year/data/models/fiscal_year_model.dart';
import '../../data/models/user_sales_report_model.dart';

class UserSalesReportContent extends ConsumerStatefulWidget {
  final bool isPortrait;
  const UserSalesReportContent({super.key, this.isPortrait = false});

  @override
  ConsumerState<UserSalesReportContent> createState() => _UserSalesReportContentState();
}

class _UserSalesReportContentState extends ConsumerState<UserSalesReportContent> {
  DateTime fromDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime toDate = DateTime.now();
  int? selectedFiscalYearID;
  int? selectedBranchID;
  int selectedUserID = 0; // Default to 0 (All)
  
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reportState = ref.watch(userSalesReportControllerProvider);
    final fiscalYearsAsync = ref.watch(fiscalYearsProvider);
    final branchesAsync = ref.watch(branchesProvider);
    final staffAsync = ref.watch(allStaffProvider);

    return Column(
      children: [
        // Filter Header
        Container(
          padding: const EdgeInsets.all(16),
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'User Sales Report Filters',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildFilters(fiscalYearsAsync, branchesAsync, staffAsync),
            ],
          ),
        ),

        // Data Table Section
        Expanded(
          child: reportState.when(
            data: (data) {
              if (data == null) {
                return const Center(child: Text('Click Search to view the report'));
              }
              
              final filteredData = data.data.where((item) {
                final query = _searchQuery.toLowerCase();
                return (item.userName?.toLowerCase().contains(query) ?? false);
              }).toList();

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) => setState(() => _searchQuery = value),
                      decoration: InputDecoration(
                        hintText: 'Search by User Name...',
                        prefixIcon: const Icon(Icons.search, size: 20),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        suffixIcon: _searchQuery.isNotEmpty 
                          ? IconButton(
                              icon: const Icon(Icons.clear, size: 20),
                              onPressed: () {
                                _searchController.clear();
                                setState(() => _searchQuery = '');
                              },
                            )
                          : null,
                      ),
                    ),
                  ),
                  
                  if (filteredData.isEmpty)
                    const Expanded(child: Center(child: Text('No matching records found')))
                  else
                    Expanded(child: _buildDataTable(filteredData)),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text('Error: $error')),
          ),
        ),

        // Fixed Footer Summary
        reportState.when(
          data: (data) => data != null ? _buildSummaryCards(data.summary!) : const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildFilters(
    AsyncValue<List<FiscalYearModel>> fiscalYears,
    AsyncValue<dynamic> branches,
    AsyncValue<dynamic> staff,
  ) {
    if (widget.isPortrait) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildDatePicker('From', fromDate, (date) => setState(() => fromDate = date))),
              const SizedBox(width: 8),
              Expanded(child: _buildDatePicker('To', toDate, (date) => setState(() => toDate = date))),
            ],
          ),
          const SizedBox(height: 12),
          _buildFiscalYearDropdown(fiscalYears),
          const SizedBox(height: 12),
          _buildBranchDropdown(branches),
          const SizedBox(height: 12),
          _buildUserDropdown(staff),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _onSearch,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Search'),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildDatePicker('From', fromDate, (date) => setState(() => fromDate = date))),
            const SizedBox(width: 12),
            Expanded(child: _buildDatePicker('To', toDate, (date) => setState(() => toDate = date))),
            const SizedBox(width: 12),
            Expanded(child: _buildFiscalYearDropdown(fiscalYears)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildBranchDropdown(branches)),
            const SizedBox(width: 12),
            Expanded(child: _buildUserDropdown(staff)),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: _onSearch,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
              ),
              child: const Text('Search'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryCards(UserSalesReportSummary summary) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.border.withValues(alpha: 0.5))),
      ),
      child: widget.isPortrait
          ? Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _summaryCard('Total Bills', summary.totalBills.toString())),
                    const SizedBox(width: 8),
                    Expanded(child: _summaryCard('Net Amount', 'Rs. ${summary.netAmount.toStringAsFixed(2)}')),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: _summaryCard('Total Qty', summary.totalQuantity.toString())),
                    const SizedBox(width: 8),
                    Expanded(child: _summaryCard('Tax', 'Rs. ${summary.taxAmount.toStringAsFixed(2)}')),
                  ],
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: _summaryCard('Total Bills', summary.totalBills.toString())),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Total Qty', summary.totalQuantity.toString())),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Gross Amount', 'Rs. ${summary.grossAmount.toStringAsFixed(2)}')),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Tax', 'Rs. ${summary.taxAmount.toStringAsFixed(2)}')),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Net Amount', 'Rs. ${summary.netAmount.toStringAsFixed(2)}')),
              ],
            ),
    );
  }

  Widget _summaryCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.grey)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primary)),
        ],
      ),
    );
  }

  Widget _buildDatePicker(String label, DateTime date, Function(DateTime) onPicked) {
    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
        );
        if (picked != null) onPicked(picked);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.ashGrey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$label: ${DateFormat('yyyy-MM-dd').format(date)}', style: const TextStyle(fontSize: 13)),
            const Icon(Icons.calendar_today, size: 16, color: AppColors.primary),
          ],
        ),
      ),
    );
  }

  Widget _buildFiscalYearDropdown(AsyncValue<List<FiscalYearModel>> fiscalYearsAsync) {
    return fiscalYearsAsync.when(
      data: (years) {
        if (selectedFiscalYearID == null && years.isNotEmpty) {
          selectedFiscalYearID = years.first.fiscalYearId;
        }
        return DropdownButtonFormField<int>(
          initialValue: selectedFiscalYearID,
          decoration: const InputDecoration(
            labelText: 'Fiscal Year',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: years.map((y) => DropdownMenuItem(value: y.fiscalYearId, child: Text(y.fiscalYearName ?? ''))).toList(),
          onChanged: (val) => setState(() => selectedFiscalYearID = val),
        );
      },
      loading: () => const LinearProgressIndicator(),
      error: (_, __) => const Text('Error loading fiscal years'),
    );
  }

  Widget _buildBranchDropdown(AsyncValue<dynamic> branchesAsync) {
    return branchesAsync.when(
      data: (branches) {
        final branchList = branches as List;
        if (selectedBranchID == null && branchList.isNotEmpty) {
          selectedBranchID = branchList.first.branchID;
        }
        return DropdownButtonFormField<int>(
          initialValue: selectedBranchID,
          decoration: const InputDecoration(
            labelText: 'Branch',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: branchList.map((b) => DropdownMenuItem(value: b.branchID as int, child: Text(b.branchName as String))).toList(),
          onChanged: (val) => setState(() => selectedBranchID = val),
        );
      },
      loading: () => const LinearProgressIndicator(),
      error: (_, __) => const Text('Error loading branches'),
    );
  }

  Widget _buildUserDropdown(AsyncValue<dynamic> staffAsync) {
    return staffAsync.when(
      data: (staff) {
        final staffList = staff as List;
        return DropdownButtonFormField<int>(
          initialValue: selectedUserID,
          decoration: const InputDecoration(
            labelText: 'User',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: [
            const DropdownMenuItem(value: 0, child: Text('All Users')),
            ...staffList.map((s) => DropdownMenuItem(value: s.userID as int, child: Text(s.fullName ?? s.username))),
          ],
          onChanged: (val) => setState(() => selectedUserID = val ?? 0),
        );
      },
      loading: () => const LinearProgressIndicator(),
      error: (_, __) => const Text('Error loading users'),
    );
  }

  Widget _buildDataTable(List<UserSalesData> data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerTheme: const DividerThemeData(thickness: 0.5),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width - 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sticky Header
                DataTable(
                  headingRowColor: WidgetStateProperty.all(AppColors.primary.withValues(alpha: 0.1)),
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  columns: const [
                    DataColumn(label: Text('SN', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('User Name', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Bills', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Qty', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Gross', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Tax', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Net', style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: const [], // No rows in header table
                ),
                // Scrollable Body
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      headingRowHeight: 0, // Hide header in body table
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      columns: const [
                        DataColumn(label: SizedBox.shrink()),
                        DataColumn(label: SizedBox.shrink()),
                        DataColumn(label: SizedBox.shrink()),
                        DataColumn(label: SizedBox.shrink()),
                        DataColumn(label: SizedBox.shrink()),
                        DataColumn(label: SizedBox.shrink()),
                        DataColumn(label: SizedBox.shrink()),
                      ],
                      rows: data.map((item) => DataRow(cells: [
                        DataCell(Text(item.sn?.toString() ?? '', style: const TextStyle(fontSize: 13))),
                        DataCell(Text(item.userName ?? '', style: const TextStyle(fontSize: 13))),
                        DataCell(Text(item.totalBills.toString(), style: const TextStyle(fontSize: 13))),
                        DataCell(Text(item.quantity.toString(), style: const TextStyle(fontSize: 13))),
                        DataCell(Text(item.grossAmount.toStringAsFixed(2), style: const TextStyle(fontSize: 13))),
                        DataCell(Text(item.taxAmount.toStringAsFixed(2), style: const TextStyle(fontSize: 13))),
                        DataCell(Text(item.netAmount.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.primary))),
                      ])).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSearch() {
    if (selectedFiscalYearID == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a fiscal year')));
      return;
    }
    ref.read(userSalesReportControllerProvider.notifier).fetchUserSalesReport(
      fromDate: fromDate,
      toDate: toDate,
      fiscalYearID: selectedFiscalYearID!,
      branchID: selectedBranchID?.toString() ?? '0',
      userID: selectedUserID,
    );
  }
}
