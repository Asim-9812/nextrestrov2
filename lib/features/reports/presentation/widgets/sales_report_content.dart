import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/fiscal_year/presentation/providers/fiscal_year_provider.dart';
import 'package:nextrestro/features/branch/presentation/providers/branch_provider.dart';
import 'package:nextrestro/features/customer/presentation/providers/customer_provider.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import '../providers/reports_controller.dart';
import '../../../fiscal_year/data/models/fiscal_year_model.dart';

class SalesReportContent extends ConsumerStatefulWidget {
  final bool isPortrait;
  const SalesReportContent({super.key, this.isPortrait = false});

  @override
  ConsumerState<SalesReportContent> createState() => _SalesReportContentState();
}

class _SalesReportContentState extends ConsumerState<SalesReportContent> {
  DateTime fromDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime toDate = DateTime.now();
  int? selectedFiscalYearID;
  int? selectedBranchID;
  int selectedCustomerID = 0;
  int selectedTableID = 0;
  final TextEditingController _invoiceController = TextEditingController();
  
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final ExpansionTileController _filterController = ExpansionTileController();

  @override
  void dispose() {
    _invoiceController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reportState = ref.watch(salesReportControllerProvider);
    final fiscalYearsAsync = ref.watch(fiscalYearsProvider);
    final branchesAsync = ref.watch(branchesProvider);
    final customersAsync = ref.watch(customersProvider);
    final tablesAsync = ref.watch(tablesStreamProvider);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Filter Header
                Container(
                  padding: const EdgeInsets.all(16),
                  color: AppColors.white,
                  child: widget.isPortrait 
                    ? _buildPortraitFilters(fiscalYearsAsync, branchesAsync, customersAsync, tablesAsync)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sales Report Filters',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          _buildFilters(fiscalYearsAsync, branchesAsync, customersAsync, tablesAsync),
                        ],
                      ),
                ),

                // Search Bar Area
                if (reportState.asData?.value != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) => setState(() => _searchQuery = value),
                      decoration: InputDecoration(
                        hintText: 'Search by Invoice or Customer...',
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

                // Data Table Section
                reportState.when(
                  data: (data) {
                    if (data == null) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Text('Click Search to view the report'),
                        ),
                      );
                    }
                    
                    final filteredData = data.data.where((item) {
                      final query = _searchQuery.toLowerCase();
                      return (item.invoiceNo?.toLowerCase().contains(query) ?? false) ||
                             (item.customerName?.toLowerCase().contains(query) ?? false);
                    }).toList();

                    if (filteredData.isEmpty) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Text('No matching records found'),
                        ),
                      );
                    }

                    return _buildDataTable(filteredData);
                  },
                  loading: () => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  error: (error, _) => Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Text('Error: $error'),
                    ),
                  ),
                ),
              ],
            ),
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
    AsyncValue<dynamic> customers,
    AsyncValue<dynamic> tables,
  ) {
    return ExpansionTile(
      controller: _filterController,
      initiallyExpanded: true,
      title: const Text(
        'Sales Report Filters',
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
              _buildCustomerDropdown(customers),
              const SizedBox(height: 12),
              _buildTableDropdown(tables),
              const SizedBox(height: 12),
              TextField(
                controller: _invoiceController,
                decoration: const InputDecoration(
                  labelText: 'Invoice No',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
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
    AsyncValue<dynamic> customers,
    AsyncValue<dynamic> tables,
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
          _buildCustomerDropdown(customers),
          const SizedBox(height: 12),
          _buildTableDropdown(tables),
          const SizedBox(height: 12),
          TextField(
            controller: _invoiceController,
            decoration: const InputDecoration(
              labelText: 'Invoice No',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
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
            Expanded(child: _buildCustomerDropdown(customers)),
            const SizedBox(width: 12),
            Expanded(child: _buildTableDropdown(tables)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _invoiceController,
                decoration: const InputDecoration(
                  labelText: 'Invoice No',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ),
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

  Widget _buildSummaryCards(dynamic summary) {
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
                  _summaryCard('Grand Total', 'Rs. ${summary.grandTotal.toStringAsFixed(2)}'),
                  const SizedBox(width: 8),
                  _summaryCard('Total Items', summary.totalItems.toString()),
                  const SizedBox(width: 8),
                  _summaryCard('Tax', 'Rs. ${summary.tax.toStringAsFixed(2)}'),
                ],
              ),
            )
          : Row(
              children: [
                Expanded(child: _summaryCard('Total Bills', summary.totalBills.toString())),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('SubTotal', 'Rs. ${summary.subTotal.toStringAsFixed(2)}')),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Discount', 'Rs. ${summary.discount.toStringAsFixed(2)}')),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Tax', 'Rs. ${summary.tax.toStringAsFixed(2)}')),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Grand Total', 'Rs. ${summary.grandTotal.toStringAsFixed(2)}')),
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
        // Ensure unique IDs to avoid "There should be exactly one item with [DropdownButton]'s value" crash
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

  Widget _buildCustomerDropdown(AsyncValue<dynamic> customersAsync) {
    return customersAsync.when(
      data: (customers) {
        final customerList = customers as List;
        
        final isValidValue = selectedCustomerID == 0 || customerList.any((c) => c.customerID == selectedCustomerID);

        return DropdownButtonFormField<int>(
          value: isValidValue ? selectedCustomerID : 0,
          decoration: const InputDecoration(
            labelText: 'Customer',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: [
            const DropdownMenuItem(value: 0, child: Text('All Customers')),
            ...customerList.map((c) => DropdownMenuItem(value: c.customerID as int, child: Text('${c.firstName} ${c.lastName}'))),
          ],
          onChanged: (val) => setState(() => selectedCustomerID = val ?? 0),
        );
      },
      loading: () => const LinearProgressIndicator(),
      error: (_, __) => const Text('Error loading customers'),
    );
  }

  Widget _buildTableDropdown(AsyncValue<dynamic> tablesAsync) {
    return tablesAsync.when(
      data: (tables) {
        final tableList = tables as List;
        
        final isValidValue = selectedTableID == 0 || tableList.any((t) => t.tableID == selectedTableID);

        return DropdownButtonFormField<int>(
          value: isValidValue ? selectedTableID : 0,
          decoration: const InputDecoration(
            labelText: 'Table',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: [
            const DropdownMenuItem(value: 0, child: Text('All Tables')),
            ...tableList.map((t) => DropdownMenuItem(value: t.tableID as int, child: Text('Table ${t.tableNumber}'))),
          ],
          onChanged: (val) => setState(() => selectedTableID = val ?? 0),
        );
      },
      loading: () => const LinearProgressIndicator(),
      error: (_, __) => const Text('Error loading tables'),
    );
  }

  Widget _buildDataTable(List<dynamic> data) {
    const columnWidths = {
      0: FixedColumnWidth(150), // Invoice No
      1: FixedColumnWidth(180), // Date
      2: FixedColumnWidth(180), // Customer
      3: FixedColumnWidth(100), // Table
      4: FixedColumnWidth(130), // SubTotal
      5: FixedColumnWidth(130), // Tax
      6: FixedColumnWidth(150), // Grand Total
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
                        _headerCell('Invoice No'),
                        _headerCell('Date'),
                        _headerCell('Customer'),
                        _headerCell('Table'),
                        _headerCell('SubTotal'),
                        _headerCell('Tax'),
                        _headerCell('Grand Total'),
                      ],
                    ),
                  ],
                ),
              ),
              // Body Rows
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: columnWidths,
                    border: TableBorder(
                      horizontalInside: BorderSide(color: AppColors.ashGrey, width: 0.5),
                    ),
                    children: data.map((item) => TableRow(
                      children: [
                        _dataCell(item.invoiceNo ?? ''),
                        _dataCell(DateFormat('MMM dd, yyyy HH:mm').format(DateTime.parse(item.billingDate))),
                        _dataCell(item.customerName ?? '-'),
                        _dataCell(item.tableNumber ?? '-'),
                        _dataCell(item.subTotal.toStringAsFixed(2)),
                        _dataCell(item.tax.toStringAsFixed(2)),
                        _dataCell(
                          item.grandTotal.toStringAsFixed(2),
                          isBold: true,
                          color: AppColors.primary,
                        ),
                      ],
                    )).toList(),
                  ),
                ),
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
    ref.read(salesReportControllerProvider.notifier).fetchSalesReport(
      fromDate: fromDate,
      toDate: toDate,
      fiscalYearID: selectedFiscalYearID!,
      branchID: selectedBranchID ?? 0,
      customerID: selectedCustomerID,
      tableID: selectedTableID,
      invoiceNo: _invoiceController.text,
    );
  }
}
