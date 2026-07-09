import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/fiscal_year/presentation/providers/fiscal_year_provider.dart';
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
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reportState = ref.watch(salesReportControllerProvider);
    final fiscalYearsAsync = ref.watch(fiscalYearsProvider);

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
                'Sales Report Filters',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              widget.isPortrait ? _buildPortraitFilters(fiscalYearsAsync) : _buildLandscapeFilters(fiscalYearsAsync),
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
              
              // Local filtering
              final filteredData = data.data.where((item) {
                final query = _searchQuery.toLowerCase();
                return (item.invoiceNo?.toLowerCase().contains(query) ?? false) ||
                       (item.customerName?.toLowerCase().contains(query) ?? false) ||
                       (item.tableNumber?.toLowerCase().contains(query) ?? false);
              }).toList();

              return Column(
                children: [
                  // Search Bar above table
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) => setState(() => _searchQuery = value),
                      decoration: InputDecoration(
                        hintText: 'Search by Invoice, Customer or Table...',
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

        // Fixed Footer Summary using original card design
        reportState.when(
          data: (data) => data != null ? _buildSummaryCards(data.summary!) : const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
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
          ? Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _summaryCard('Total Bills', summary.totalBills.toString())),
                    const SizedBox(width: 8),
                    Expanded(child: _summaryCard('Grand Total', 'Rs. ${summary.grandTotal}')),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: _summaryCard('Total Items', summary.totalItems.toString())),
                    const SizedBox(width: 8),
                    Expanded(child: _summaryCard('Tax', 'Rs. ${summary.tax}')),
                  ],
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: _summaryCard('Total Bills', summary.totalBills.toString())),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('SubTotal', 'Rs. ${summary.subTotal}')),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Discount', 'Rs. ${summary.discount}')),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Tax', 'Rs. ${summary.tax}')),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Grand Total', 'Rs. ${summary.grandTotal}')),
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
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary)),
        ],
      ),
    );
  }

  Widget _buildLandscapeFilters(AsyncValue<List<FiscalYearModel>> fiscalYearsAsync) {
    return Row(
      children: [
        _buildDatePicker('From', fromDate, (date) => setState(() => fromDate = date)),
        const SizedBox(width: 16),
        _buildDatePicker('To', toDate, (date) => setState(() => toDate = date)),
        const SizedBox(width: 16),
        Expanded(child: _buildFiscalYearDropdown(fiscalYearsAsync)),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: _onSearch,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: const Text('Search'),
        ),
      ],
    );
  }

  Widget _buildPortraitFilters(AsyncValue<List<FiscalYearModel>> fiscalYearsAsync) {
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
        _buildFiscalYearDropdown(fiscalYearsAsync),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _onSearch,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
            ),
            child: const Text('Search'),
          ),
        ),
      ],
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$label: ${DateFormat('yyyy-MM-dd').format(date)}'),
            const SizedBox(width: 8),
            const Icon(Icons.calendar_today, size: 16),
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
          value: selectedFiscalYearID,
          decoration: const InputDecoration(
            labelText: 'Fiscal Year',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: years.map((y) => DropdownMenuItem(value: y.fiscalYearId, child: Text(y.fiscalYearName ?? ''))).toList(),
          onChanged: (val) => setState(() => selectedFiscalYearID = val),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (_, __) => const Text('Error loading fiscal years'),
    );
  }

  Widget _buildDataTable(List<dynamic> data) {
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
                // Fixed Header
                DataTable(
                  headingRowColor: WidgetStateProperty.all(AppColors.primary.withValues(alpha: 0.1)),
                  columnSpacing: 24,
                  columns: const [
                    DataColumn(label: SizedBox(width: 200, child: Text('Invoice No', style: TextStyle(fontWeight: FontWeight.bold)))),
                    DataColumn(label: SizedBox(width: 150, child: Text('Date', style: TextStyle(fontWeight: FontWeight.bold)))),
                    DataColumn(label: SizedBox(width: 150, child: Text('Customer', style: TextStyle(fontWeight: FontWeight.bold)))),
                    DataColumn(label: SizedBox(width: 40, child: Text('Table', style: TextStyle(fontWeight: FontWeight.bold)))),
                    DataColumn(label: SizedBox(width: 50, child: Text('SubTotal', style: TextStyle(fontWeight: FontWeight.bold)))),
                    DataColumn(label: SizedBox(width: 50, child: Text('Tax', style: TextStyle(fontWeight: FontWeight.bold)))),
                    DataColumn(label: SizedBox(width: 100, child: Text('Grand Total', style: TextStyle(fontWeight: FontWeight.bold)))),
                  ],
                  rows: const [], // Empty rows for header only
                ),
                // Scrollable Body
                Expanded(
                  child: SingleChildScrollView(
                    child: DataTable(
                      headingRowHeight: 0, // Hide default header
                      columnSpacing: 24,
                      columns: const [
                        DataColumn(label: SizedBox(width: 200)),
                        DataColumn(label: SizedBox(width: 150)),
                        DataColumn(label: SizedBox(width: 150)),
                        DataColumn(label: SizedBox(width: 40)),
                        DataColumn(label: SizedBox(width: 50)),
                        DataColumn(label: SizedBox(width: 50)),
                        DataColumn(label: SizedBox(width: 100)),
                      ],
                      rows: data.map((item) => DataRow(cells: [
                        DataCell(SizedBox(width: 200, child: Text(item.invoiceNo ?? '', style: const TextStyle(fontSize: 13)))),
                        DataCell(SizedBox(width: 150, child: Text(DateFormat('MMM dd, yyyy HH:mm').format(DateTime.parse(item.billingDate)), style: const TextStyle(fontSize: 13)))),
                        DataCell(SizedBox(width: 150, child: Text(item.customerName ?? '-', style: const TextStyle(fontSize: 13)))),
                        DataCell(SizedBox(width: 40, child: Text(item.tableNumber ?? '-', style: const TextStyle(fontSize: 13)))),
                        DataCell(SizedBox(width: 50, child: Text(item.subTotal.toString(), style: const TextStyle(fontSize: 13)))),
                        DataCell(SizedBox(width: 50, child: Text(item.tax.toString(), style: const TextStyle(fontSize: 13)))),
                        DataCell(SizedBox(width: 100, child: Text(item.grandTotal.toString(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.primary)))),
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
    ref.read(salesReportControllerProvider.notifier).fetchSalesReport(
      fromDate: fromDate,
      toDate: toDate,
      fiscalYearID: selectedFiscalYearID!,
    );
  }
}
