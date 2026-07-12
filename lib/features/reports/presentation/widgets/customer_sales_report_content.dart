import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/fiscal_year/presentation/providers/fiscal_year_provider.dart';
import '../providers/reports_controller.dart';
import '../../../fiscal_year/data/models/fiscal_year_model.dart';
import '../../data/models/customer_sales_report_model.dart';

class CustomerSalesReportContent extends ConsumerStatefulWidget {
  final bool isPortrait;
  const CustomerSalesReportContent({super.key, this.isPortrait = false});

  @override
  ConsumerState<CustomerSalesReportContent> createState() => _CustomerSalesReportContentState();
}

class _CustomerSalesReportContentState extends ConsumerState<CustomerSalesReportContent> {
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
    final reportState = ref.watch(customerSalesReportControllerProvider);
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
                'Customer Sales Report Filters',
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
                return (item.customerName?.toLowerCase().contains(query) ?? false) ||
                       (item.sn?.toString().contains(query) ?? false);
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

  Widget _buildSummaryCards(CustomerSalesReportSummary summary) {
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
                    Expanded(child: _summaryCard('Total Qty', summary.totalQuantity.toString())),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: _summaryCard('Gross Amount', 'Rs. ${summary.grossAmount}')),
                    const SizedBox(width: 8),
                    Expanded(child: _summaryCard('Net Amount', 'Rs. ${summary.netAmount}')),
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
                Expanded(child: _summaryCard('Gross Amt', 'Rs. ${summary.grossAmount}')),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Discount', 'Rs. ${summary.discountAmount}')),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Tax', 'Rs. ${summary.taxAmount}')),
                const SizedBox(width: 12),
                Expanded(child: _summaryCard('Net Amt', 'Rs. ${summary.netAmount}')),
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

  Widget _buildDataTable(List<CustomerSalesData> data) {
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
                    DataColumn(label: SizedBox(width: 50, child: Text('S.N.', style: TextStyle(fontWeight: FontWeight.bold)))),
                    DataColumn(label: SizedBox(width: 250, child: Text('Customer Name', style: TextStyle(fontWeight: FontWeight.bold)))),
                    DataColumn(label: SizedBox(width: 100, child: Text('Total Bills', style: TextStyle(fontWeight: FontWeight.bold)))),
                    DataColumn(label: SizedBox(width: 100, child: Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)))),
                    DataColumn(label: SizedBox(width: 120, child: Text('Gross Amount', style: TextStyle(fontWeight: FontWeight.bold)))),
                    DataColumn(label: SizedBox(width: 120, child: Text('Tax Amount', style: TextStyle(fontWeight: FontWeight.bold)))),
                    DataColumn(label: SizedBox(width: 120, child: Text('Net Amount', style: TextStyle(fontWeight: FontWeight.bold)))),
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
                        DataColumn(label: SizedBox(width: 50)),
                        DataColumn(label: SizedBox(width: 250)),
                        DataColumn(label: SizedBox(width: 100)),
                        DataColumn(label: SizedBox(width: 100)),
                        DataColumn(label: SizedBox(width: 120)),
                        DataColumn(label: SizedBox(width: 120)),
                        DataColumn(label: SizedBox(width: 120)),
                      ],
                      rows: data.map((item) => DataRow(cells: [
                        DataCell(SizedBox(width: 50, child: Text(item.sn?.toString() ?? '', style: const TextStyle(fontSize: 13)))),
                        DataCell(SizedBox(width: 250, child: Text(item.customerName ?? '', style: const TextStyle(fontSize: 13)))),
                        DataCell(SizedBox(width: 100, child: Text(item.totalBills.toString(), style: const TextStyle(fontSize: 13)))),
                        DataCell(SizedBox(width: 100, child: Text(item.quantity.toString(), style: const TextStyle(fontSize: 13)))),
                        DataCell(SizedBox(width: 120, child: Text('Rs. ${item.grossAmount}', style: const TextStyle(fontSize: 13)))),
                        DataCell(SizedBox(width: 120, child: Text('Rs. ${item.taxAmount}', style: const TextStyle(fontSize: 13)))),
                        DataCell(SizedBox(width: 120, child: Text('Rs. ${item.netAmount}', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.primary)))),
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
    ref.read(customerSalesReportControllerProvider.notifier).fetchCustomerSalesReport(
      fromDate: fromDate,
      toDate: toDate,
      fiscalYearID: selectedFiscalYearID!,
    );
  }
}
