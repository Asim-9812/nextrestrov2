import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/fiscal_year/presentation/providers/fiscal_year_provider.dart';
import 'package:nextrestro/features/branch/presentation/providers/branch_provider.dart';
import 'package:nextrestro/features/menu/presentation/providers/menu_provider.dart';
import '../providers/reports_controller.dart';
import '../../../fiscal_year/data/models/fiscal_year_model.dart';
import '../../data/models/product_sales_report_model.dart';

class ProductSalesReportContent extends ConsumerStatefulWidget {
  final bool isPortrait;
  const ProductSalesReportContent({super.key, this.isPortrait = false});

  @override
  ConsumerState<ProductSalesReportContent> createState() => _ProductSalesReportContentState();
}

class _ProductSalesReportContentState extends ConsumerState<ProductSalesReportContent> {
  DateTime fromDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime toDate = DateTime.now();
  int? selectedFiscalYearID;
  int? selectedBranchID;
  int selectedCategoryID = 0;
  int selectedProductID = 0;
  
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final ExpansionTileController _filterController = ExpansionTileController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reportState = ref.watch(productSalesReportControllerProvider);
    final fiscalYearsAsync = ref.watch(fiscalYearsProvider);
    final branchesAsync = ref.watch(branchesProvider);
    final categoriesAsync = ref.watch(categoriesProvider);
    final productsAsync = ref.watch(productsProvider);

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
                    ? _buildPortraitFilters(fiscalYearsAsync, branchesAsync, categoriesAsync, productsAsync)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Product Sales Report Filters',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          _buildFilters(fiscalYearsAsync, branchesAsync, categoriesAsync, productsAsync),
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
                        hintText: 'Search across all fields...',
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
                      return (item.productName?.toLowerCase().contains(query) ?? false) ||
                             (item.invoiceNo?.toLowerCase().contains(query) ?? false);
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
    AsyncValue<dynamic> categories,
    AsyncValue<dynamic> products,
  ) {
    return ExpansionTile(
      controller: _filterController,
      initiallyExpanded: true,
      title: const Text(
        'Product Sales Report Filters',
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
              _buildCategoryDropdown(categories),
              const SizedBox(height: 12),
              _buildProductDropdown(products),
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
    AsyncValue<dynamic> categories,
    AsyncValue<dynamic> products,
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
          _buildCategoryDropdown(categories),
          const SizedBox(height: 12),
          _buildProductDropdown(products),
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
            Expanded(child: _buildCategoryDropdown(categories)),
            const SizedBox(width: 12),
            Expanded(child: _buildProductDropdown(products)),
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

  Widget _buildSummaryCards(ProductSalesReportSummary summary) {
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
                Expanded(child: _summaryCard('Gross Amt', 'Rs. ${summary.grossAmount.toStringAsFixed(2)}')),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Discount', 'Rs. ${summary.discountAmount.toStringAsFixed(2)}')),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Tax', 'Rs. ${summary.taxAmount.toStringAsFixed(2)}')),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Net Amt', 'Rs. ${summary.netAmount.toStringAsFixed(2)}')),
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

  Widget _buildCategoryDropdown(AsyncValue<dynamic> categoriesAsync) {
    return categoriesAsync.when(
      data: (categories) {
        final categoryList = categories as List;
        
        final isValidValue = selectedCategoryID == 0 || categoryList.any((c) => c.categoryId == selectedCategoryID);

        return DropdownButtonFormField<int>(
          value: isValidValue ? selectedCategoryID : 0,
          decoration: const InputDecoration(
            labelText: 'Category',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: [
            const DropdownMenuItem(value: 0, child: Text('All Categories')),
            ...categoryList.map((c) => DropdownMenuItem(value: c.categoryId as int, child: Text(c.categoryName as String))),
          ],
          onChanged: (val) => setState(() => selectedCategoryID = val ?? 0),
        );
      },
      loading: () => const LinearProgressIndicator(),
      error: (_, __) => const Text('Error loading categories'),
    );
  }

  Widget _buildProductDropdown(AsyncValue<dynamic> productsAsync) {
    return productsAsync.when(
      data: (products) {
        final productList = products as List;
        
        final isValidValue = selectedProductID == 0 || productList.any((p) => p.productId == selectedProductID);

        return DropdownButtonFormField<int>(
          value: isValidValue ? selectedProductID : 0,
          decoration: const InputDecoration(
            labelText: 'Product',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: [
            const DropdownMenuItem(value: 0, child: Text('All Products')),
            ...productList.map((p) => DropdownMenuItem(value: p.productId as int, child: Text(p.productName as String))),
          ],
          onChanged: (val) => setState(() => selectedProductID = val ?? 0),
        );
      },
      loading: () => const LinearProgressIndicator(),
      error: (_, __) => const Text('Error loading products'),
    );
  }

  Widget _buildDataTable(List<ProductSalesData> data) {
    const columnWidths = {
      0: FixedColumnWidth(150), // Invoice No
      1: FixedColumnWidth(220), // Product Name
      2: FixedColumnWidth(150), // Category
      3: FixedColumnWidth(80),  // Qty
      4: FixedColumnWidth(130), // Unit Price
      5: FixedColumnWidth(130), // Total
      6: FixedColumnWidth(180), // Customer
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
                        _headerCell('Product Name'),
                        _headerCell('Category'),
                        _headerCell('Qty'),
                        _headerCell('Unit Price'),
                        _headerCell('Total'),
                        _headerCell('Customer'),
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
                        _dataCell(item.productName ?? ''),
                        _dataCell(item.categoryName ?? '-'),
                        _dataCell(item.quantity.toString()),
                        _dataCell(item.unitPrice.toStringAsFixed(2)),
                        _dataCell(
                          'Rs. ${item.total.toStringAsFixed(2)}',
                          isBold: true,
                          color: AppColors.primary,
                        ),
                        _dataCell(item.customerName ?? '-'),
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

    if (widget.isPortrait) {
      _filterController.collapse();
    }

    ref.read(productSalesReportControllerProvider.notifier).fetchProductSalesReport(
      fromDate: fromDate,
      toDate: toDate,
      fiscalYearID: selectedFiscalYearID!,
      branchID: selectedBranchID?.toString() ?? '0',
      categoryID: selectedCategoryID,
      productID: selectedProductID,
    );
  }
}
