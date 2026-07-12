import 'package:flutter/material.dart';
import 'package:nextrestro/features/admin_dashboard/data/models/dashboard_summary_model.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/providers/dashboard_state.dart';
import '../../widgets/dashboard_summary_card.dart';

class PortraitSummaryBentoBox extends StatelessWidget {
  final DashboardSummaryModel current;
  final DashboardSummaryModel? previous;
  final Function(String metric) onShowChart;
  final DashboardDateRange selectedRange;

  const PortraitSummaryBentoBox({
    super.key,
    required this.current,
    this.previous,
    required this.onShowChart,
    required this.selectedRange,
  });

  double _calculateChange(double currentVal, double previousVal) {
    if (previousVal == 0) return currentVal > 0 ? 100 : 0;
    return ((currentVal - previousVal) / previousVal) * 100;
  }

  String _getComparisonLabel() {
    switch (selectedRange) {
      case DashboardDateRange.today:
        return 'vs yesterday';
      case DashboardDateRange.week:
        return 'vs last week';
      case DashboardDateRange.month:
        return 'vs last month';
      case DashboardDateRange.year:
        return 'vs last year';
      case DashboardDateRange.custom:
        return 'vs prev. period';
    }
  }

  @override
  Widget build(BuildContext context) {
    final comparisonLabel = _getComparisonLabel();

    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        children: [
          _buildCard(
            'Total Sales', 
            'Rs. ${current.totalSales.toStringAsFixed(2)}', 
            current.totalSales, 
            previous?.totalSales ?? 0, 
            Icons.payments_outlined, 
            Colors.blue, 
            comparisonLabel
          ),
          _buildCard(
            'Total Bills', 
            '${current.totalBills}', 
            current.totalBills.toDouble(), 
            previous?.totalBills.toDouble() ?? 0, 
            Icons.receipt_long_outlined, 
            Colors.orange, 
            comparisonLabel
          ),
          _buildCard(
            'Total Customers', 
            '${current.totalCustomers}', 
            current.totalCustomers.toDouble(), 
            previous?.totalCustomers.toDouble() ?? 0, 
            Icons.people_outline, 
            Colors.purple, 
            comparisonLabel
          ),
          _buildCard(
            'Avg. Bill', 
            'Rs. ${current.averageBill.toStringAsFixed(2)}', 
            current.averageBill, 
            previous?.averageBill ?? 0, 
            Icons.analytics_outlined, 
            Colors.teal, 
            comparisonLabel
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    String title, 
    String value, 
    double currentVal, 
    double previousVal, 
    IconData icon, 
    Color color, 
    String comparisonLabel
  ) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 16),
      child: DashboardSummaryCard(
        title: title,
        value: value,
        percentageChange: _calculateChange(currentVal, previousVal),
        comparisonLabel: comparisonLabel,
        icon: icon,
        color: color,
        onShowChart: () => onShowChart(title),
      ),
    );
  }
}
