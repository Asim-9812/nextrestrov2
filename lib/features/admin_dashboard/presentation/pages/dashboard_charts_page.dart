import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/providers/dashboard_chart_controller.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/providers/dashboard_chart_state.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardChartsPage extends ConsumerStatefulWidget {
  final String metricName;

  const DashboardChartsPage({
    super.key,
    required this.metricName,
  });

  @override
  ConsumerState<DashboardChartsPage> createState() => _DashboardChartsPageState();
}

class _DashboardChartsPageState extends ConsumerState<DashboardChartsPage> {
  String _selectedType = 'Week';
  int _selectedYear = DateTime.now().year;
  DateTime _selectedDate = DateTime.now();
  int _startYear = 2020;
  int _endYear = 2026;
  
  // Custom range state
  DateTimeRange? _customRange;
  CustomAggregation _customAggregation = CustomAggregation.daily;

  @override
  Widget build(BuildContext context) {
    final chartState = ref.watch(dashboardChartControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('Analytics Dashboard'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _refreshData(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildTypeSelector(),
            const SizedBox(height: 16),
            _buildContextualSelectors(),
            const SizedBox(height: 24),
            Expanded(
              child: chartState.when(
                data: (state) => _buildChart(state),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _refreshData() {
    switch (_selectedType) {
      case 'Week':
        ref.read(dashboardChartControllerProvider.notifier).setWeeklyInterval(_selectedDate);
        break;
      case 'Month':
        ref.read(dashboardChartControllerProvider.notifier).setMonthlyInterval(_selectedYear);
        break;
      case 'Year':
        ref.read(dashboardChartControllerProvider.notifier).setYearlyInterval(_startYear, _endYear);
        break;
      case 'Custom':
        if (_customRange != null) {
          ref.read(dashboardChartControllerProvider.notifier).setCustomInterval(
            _customRange!.start,
            _customRange!.end,
            aggregation: _customAggregation,
          );
        }
        break;
    }
  }

  Widget _buildTypeSelector() {
    return SegmentedButton<String>(
      segments: const [
        ButtonSegment(value: 'Week', label: Text('Week'), icon: Icon(Icons.calendar_view_week)),
        ButtonSegment(value: 'Month', label: Text('Month'), icon: Icon(Icons.calendar_view_month)),
        ButtonSegment(value: 'Year', label: Text('Year'), icon: Icon(Icons.calendar_today)),
        ButtonSegment(value: 'Custom', label: Text('Custom'), icon: Icon(Icons.date_range)),
      ],
      selected: {_selectedType},
      onSelectionChanged: (val) {
        setState(() => _selectedType = val.first);
        if (_selectedType != 'Custom') {
          _refreshData();
        }
      },
    );
  }

  Widget _buildContextualSelectors() {
    if (_selectedType == 'Week') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Start of Week: ', style: TextStyle(fontWeight: FontWeight.bold)),
          TextButton.icon(
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: _selectedDate,
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                setState(() => _selectedDate = picked);
                _refreshData();
              }
            },
            icon: const Icon(Icons.calendar_today, size: 18),
            label: Text(DateFormat('MMM dd, yyyy').format(_selectedDate)),
          ),
          const SizedBox(width: 16),
          const Text('(Sun to Sat)', style: TextStyle(color: AppColors.grey, fontSize: 12)),
        ],
      );
    }

    if (_selectedType == 'Month') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Select Year: ', style: TextStyle(fontWeight: FontWeight.bold)),
          DropdownButton<int>(
            value: _selectedYear,
            items: List.generate(11, (index) => 2020 + index).map((year) {
              return DropdownMenuItem(value: year, child: Text(year.toString()));
            }).toList(),
            onChanged: (val) {
              if (val != null) {
                setState(() => _selectedYear = val);
                _refreshData();
              }
            },
          ),
          const SizedBox(width: 16),
          const Text('(Jan to Dec)', style: TextStyle(color: AppColors.grey, fontSize: 12)),
        ],
      );
    }

    if (_selectedType == 'Year') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Range: ', style: TextStyle(fontWeight: FontWeight.bold)),
          DropdownButton<int>(
            value: _startYear,
            items: List.generate(7, (index) => 2020 + index).map((year) {
              return DropdownMenuItem(value: year, child: Text(year.toString()));
            }).toList(),
            onChanged: (val) {
              if (val != null) {
                setState(() => _startYear = val);
                _refreshData();
              }
            },
          ),
          const Text(' to '),
          DropdownButton<int>(
            value: _endYear,
            items: List.generate(7, (index) => 2020 + index).map((year) {
              return DropdownMenuItem(value: year, child: Text(year.toString()));
            }).toList(),
            onChanged: (val) {
              if (val != null) {
                setState(() => _endYear = val);
                _refreshData();
              }
            },
          ),
        ],
      );
    }
    
    if (_selectedType == 'Custom') {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () async {
                  final picked = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                    initialDateRange: _customRange,
                  );
                  if (picked != null) {
                    setState(() {
                      _customRange = picked;
                      // Validate and auto-switch aggregation based on new range
                      final days = _customRange!.end.difference(_customRange!.start).inDays + 1;
                      if (days > 365) {
                        _customAggregation = CustomAggregation.yearly;
                      } else if (days > 30) {
                        if (_customAggregation == CustomAggregation.daily) {
                          _customAggregation = CustomAggregation.monthly;
                        }
                      }
                    });
                    _refreshData();
                  }
                },
                icon: const Icon(Icons.date_range),
                label: Text(_customRange == null 
                  ? 'Select Date Range' 
                  : '${DateFormat('MM/dd/yy').format(_customRange!.start)} - ${DateFormat('MM/dd/yy').format(_customRange!.end)}'),
              ),
              const SizedBox(width: 24),
              const Text('Aggregation: ', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton<CustomAggregation>(
                value: _customAggregation,
                items: CustomAggregation.values.where((agg) {
                  if (_customRange == null) return true;
                  final days = _customRange!.end.difference(_customRange!.start).inDays + 1;
                  if (agg == CustomAggregation.daily && days > 30) return false;
                  if (agg == CustomAggregation.monthly && days > 365) return false;
                  return true;
                }).map((agg) {
                  return DropdownMenuItem(
                    value: agg,
                    child: Text(agg.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) {
                    setState(() => _customAggregation = val);
                    _refreshData();
                  }
                },
              ),
            ],
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildChart(DashboardChartState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        tooltipBehavior: TooltipBehavior(enable: true, shared: true),
        legend: const Legend(isVisible: true, position: LegendPosition.bottom, overflowMode: LegendItemOverflowMode.wrap),
        series: <CartesianSeries<ChartDataPoint, String>>[
          _lineSeries(state.dataPoints, (p) => p.summary.totalSales, 'Total Sales', Colors.blue),
          _lineSeries(state.dataPoints, (p) => p.summary.totalBills.toDouble(), 'Total Bills', Colors.orange),
          _lineSeries(state.dataPoints, (p) => p.summary.totalCustomers.toDouble(), 'Total Customers', Colors.purple),
          _lineSeries(state.dataPoints, (p) => p.summary.averageBill, 'Avg. Bill', Colors.teal),
          _lineSeries(state.dataPoints, (p) => p.summary.cashSales, 'Cash Sales', Colors.green),
          _lineSeries(state.dataPoints, (p) => p.summary.cardSales, 'Card Sales', Colors.amber),
          _lineSeries(state.dataPoints, (p) => p.summary.qrSales, 'QR Sales', Colors.cyan),
          _lineSeries(state.dataPoints, (p) => p.summary.creditSales, 'Credit Sales', Colors.red),
        ],
      ),
    );
  }

  LineSeries<ChartDataPoint, String> _lineSeries(
    List<ChartDataPoint> data,
    double Function(ChartDataPoint) valueMapper,
    String name,
    Color color,
  ) {
    return LineSeries<ChartDataPoint, String>(
      dataSource: data,
      xValueMapper: (ChartDataPoint p, _) => p.label,
      yValueMapper: (ChartDataPoint p, _) => valueMapper(p),
      name: name,
      color: color,
      markerSettings: const MarkerSettings(isVisible: true),
      dataLabelSettings: const DataLabelSettings(isVisible: false),
    );
  }
}
