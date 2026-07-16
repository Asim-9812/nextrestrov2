import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/fiscal_year/presentation/providers/fiscal_year_provider.dart';
import 'package:nextrestro/features/branch/presentation/providers/branch_provider.dart';
import 'package:nextrestro/features/users/presentation/providers/staff_provider.dart';
import '../providers/reports_controller.dart';
import 'package:nextrestro/features/fiscal_year/data/models/fiscal_year_model.dart';
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

  final ExpansionTileController _filterController = ExpansionTileController();
  
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  void dispose() {
    _searchController.dispose();
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reportState = ref.watch(userSalesReportControllerProvider);
    final fiscalYearsAsync = ref.watch(fiscalYearsProvider);
    final branchesAsync = ref.watch(branchesProvider);
    final staffAsync = ref.watch(allStaffProvider);

    const columnWidths = {
      0: FixedColumnWidth(60),  // SN
      1: FixedColumnWidth(220), // User Name
      2: FixedColumnWidth(100), // Bills
      3: FixedColumnWidth(100), // Qty
      4: FixedColumnWidth(130), // Gross
      5: FixedColumnWidth(130), // Tax
      6: FixedColumnWidth(150), // Net
    };

    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              // Filter Header
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: AppColors.white,
                  child: widget.isPortrait 
                    ? _buildPortraitFilters(fiscalYearsAsync, branchesAsync, staffAsync)
                    : Column(
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
              ),

              // Search Bar Area
              if (reportState.asData?.value != null)
                SliverToBoxAdapter(
                  child: Padding(
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
                ),

              // Data Table Section
              reportState.when(
                data: (data) {
                  if (data == null) {
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Text('Click Search to view the report'),
                        ),
                      ),
                    );
                  }
                  
                  final filteredData = data.data.where((item) {
                    final query = _searchQuery.toLowerCase();
                    return (item.userName?.toLowerCase().contains(query) ?? false);
                  }).toList();

                  if (filteredData.isEmpty) {
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Text('No matching records found'),
                        ),
                      ),
                    );
                  }

                  return SliverMainAxisGroup(
                    slivers: [
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _SliverAppBarDelegate(
                          minHeight: 50,
                          maxHeight: 50,
                          child: Container(
                            color: AppColors.bg,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: SingleChildScrollView(
                              controller: _horizontalScrollController,
                              scrollDirection: Axis.horizontal,
                              child: StickyHeader(
                                columnWidths: columnWidths,
                                children: [
                                  _headerCell('SN'),
                                  _headerCell('User Name'),
                                  _headerCell('Bills'),
                                  _headerCell('Qty'),
                                  _headerCell('Gross'),
                                  _headerCell('Tax'),
                                  _headerCell('Net'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SingleChildScrollView(
                          controller: _horizontalScrollController,
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Table(
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              columnWidths: columnWidths,
                              border: TableBorder(
                                horizontalInside: BorderSide(color: AppColors.ashGrey, width: 0.5),
                              ),
                              children: filteredData.map((item) => TableRow(
                                children: [
                                  _dataCell(item.sn?.toString() ?? ''),
                                  _dataCell(item.userName ?? ''),
                                  _dataCell(item.totalBills.toString()),
                                  _dataCell(item.quantity.toString()),
                                  _dataCell(item.grossAmount.toStringAsFixed(2)),
                                  _dataCell(item.taxAmount.toStringAsFixed(2)),
                                  _dataCell(
                                    item.netAmount.toStringAsFixed(2),
                                    isBold: true,
                                    color: AppColors.primary,
                                  ),
                                ],
                              )).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                loading: () => const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                error: (error, _) => SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Text('Error: $error'),
                    ),
                  ),
                ),
              ),
            ],
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

  Widget _buildPortraitFilters(
    AsyncValue<List<FiscalYearModel>> fiscalYears,
    AsyncValue<dynamic> branches,
    AsyncValue<dynamic> staff,
  ) {
    return ExpansionTile(
      controller: _filterController,
      initiallyExpanded: true,
      title: const Text(
        'Report Filters',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      tilePadding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
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
          ),
        ),
      ],
    );
  }

  Widget _buildFilters(
    AsyncValue<List<FiscalYearModel>> fiscalYears,
    AsyncValue<dynamic> branches,
    AsyncValue<dynamic> staff,
  ) {
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
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 18),
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
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _summaryCard('Total Bills', summary.totalBills.toString()),
                  const SizedBox(width: 8),
                  _summaryCard('Net Amount', 'Rs. ${summary.netAmount.toStringAsFixed(2)}'),
                  const SizedBox(width: 8),
                  _summaryCard('Total Qty', summary.totalQuantity.toString()),
                  const SizedBox(width: 8),
                  _summaryCard('Tax', 'Rs. ${summary.taxAmount.toStringAsFixed(2)}'),
                ],
              ),
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
          Text(
            label, 
            style: const TextStyle(fontSize: 12, color: AppColors.grey),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value, 
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primary)
            ),
          ),
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
            Expanded(
              child: Text(
                '$label: ${DateFormat('yyyy-MM-dd').format(date)}', 
                style: const TextStyle(fontSize: 13),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.calendar_today, size: 16, color: AppColors.primary),
          ],
        ),
      ),
    );
  }

  Widget _buildFiscalYearDropdown(AsyncValue<List<FiscalYearModel>> fiscalYearsAsync) {
    return fiscalYearsAsync.when(
      data: (years) {
        final uniqueYears = <int, FiscalYearModel>{};
        for (var y in years) {
          if (y.fiscalYearId != null) {
            uniqueYears[y.fiscalYearId!] = y;
          }
        }
        final sortedYears = uniqueYears.values.toList();

        if (selectedFiscalYearID == null && sortedYears.isNotEmpty) {
          selectedFiscalYearID = sortedYears.first.fiscalYearId;
        }

        final isValidValue = sortedYears.any((y) => y.fiscalYearId == selectedFiscalYearID);

        return DropdownButtonFormField<int>(
          value: isValidValue ? selectedFiscalYearID : (sortedYears.isNotEmpty ? sortedYears.first.fiscalYearId : null),
          decoration: const InputDecoration(
            labelText: 'Fiscal Year',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: sortedYears.map((y) => DropdownMenuItem(value: y.fiscalYearId, child: Text(y.fiscalYearName ?? ''))).toList(),
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

        final isValidValue = branchList.any((b) => b.branchID == selectedBranchID);

        return DropdownButtonFormField<int>(
          value: isValidValue ? selectedBranchID : (branchList.isNotEmpty ? branchList.first.branchID : null),
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
        
        final isValidValue = selectedUserID == 0 || staffList.any((s) => s.userID == selectedUserID);

        return DropdownButtonFormField<int>(
          value: isValidValue ? selectedUserID : 0,
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
    const columnWidths = {
      0: FixedColumnWidth(60),  // SN
      1: FixedColumnWidth(220), // User Name
      2: FixedColumnWidth(100), // Bills
      3: FixedColumnWidth(100), // Qty
      4: FixedColumnWidth(130), // Gross
      5: FixedColumnWidth(130), // Tax
      6: FixedColumnWidth(150), // Net
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerTheme: const DividerThemeData(thickness: 0.5),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  border: Border(bottom: BorderSide(color: AppColors.border, width: 0.5)),
                ),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: columnWidths,
                  children: [
                    TableRow(
                      children: [
                        _headerCell('SN'),
                        _headerCell('User Name'),
                        _headerCell('Bills'),
                        _headerCell('Qty'),
                        _headerCell('Gross'),
                        _headerCell('Tax'),
                        _headerCell('Net'),
                      ],
                    ),
                  ],
                ),
              ),
              // Body Rows
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: columnWidths,
                border: TableBorder(
                  horizontalInside: BorderSide(color: AppColors.ashGrey, width: 0.5),
                ),
                children: data.map((item) => TableRow(
                  children: [
                    _dataCell(item.sn?.toString() ?? ''),
                    _dataCell(item.userName ?? ''),
                    _dataCell(item.totalBills.toString()),
                    _dataCell(item.quantity.toString()),
                    _dataCell(item.grossAmount.toStringAsFixed(2)),
                    _dataCell(item.taxAmount.toStringAsFixed(2)),
                    _dataCell(
                      item.netAmount.toStringAsFixed(2),
                      isBold: true,
                      color: AppColors.primary,
                    ),
                  ],
                )).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }

  Widget _dataCell(String text, {bool isBold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: color ?? AppColors.black,
        ),
      ),
    );
  }

  void _onSearch() {
    if (selectedFiscalYearID == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a fiscal year')));
      return;
    }

    if (widget.isPortrait) {
      _filterController.collapse();
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

class StickyHeader extends StatelessWidget {
  final Map<int, TableColumnWidth> columnWidths;
  final List<Widget> children;

  const StickyHeader({
    super.key,
    required this.columnWidths,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.border, width: 0.5)),
      ),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: columnWidths,
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
            ),
            children: children,
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
