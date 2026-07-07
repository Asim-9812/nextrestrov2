import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/admin_dashboard/data/models/dashboard_summary_model.dart';
import 'dashboard_summary_card.dart';

class SummaryBentoBox extends StatelessWidget {
  final DashboardSummaryModel current;
  final DashboardSummaryModel? previous;
  final Function(String metric) onShowChart;

  const SummaryBentoBox({
    super.key,
    required this.current,
    this.previous,
    required this.onShowChart,
  });

  double _calculateChange(double currentVal, double previousVal) {
    if (previousVal == 0) return currentVal > 0 ? 100 : 0;
    return ((currentVal - previousVal) / previousVal) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 900 ? 4 : (constraints.maxWidth > 600 ? 2 : 2);
        
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: [
            DashboardSummaryCard(
              title: 'Total Sales',
              value: 'Rs. ${current.totalSales.toStringAsFixed(2)}',
              percentageChange: _calculateChange(current.totalSales, previous?.totalSales ?? 0),
              icon: Icons.payments_outlined,
              color: Colors.blue,
              onShowChart: () => onShowChart('Total Sales'),
            ),
            DashboardSummaryCard(
              title: 'Total Bills',
              value: '${current.totalBills}',
              percentageChange: _calculateChange(current.totalBills.toDouble(), previous?.totalBills.toDouble() ?? 0),
              icon: Icons.receipt_long_outlined,
              color: Colors.orange,
              onShowChart: () => onShowChart('Total Bills'),
            ),
            DashboardSummaryCard(
              title: 'Total Customers',
              value: '${current.totalCustomers}',
              percentageChange: _calculateChange(current.totalCustomers.toDouble(), previous?.totalCustomers.toDouble() ?? 0),
              icon: Icons.people_outline,
              color: Colors.purple,
              onShowChart: () => onShowChart('Total Customers'),
            ),
            DashboardSummaryCard(
              title: 'Avg. Bill',
              value: 'Rs. ${current.averageBill.toStringAsFixed(2)}',
              percentageChange: _calculateChange(current.averageBill, previous?.averageBill ?? 0),
              icon: Icons.analytics_outlined,
              color: Colors.teal,
              onShowChart: () => onShowChart('Average Bill'),
            ),
          ],
        );
      },
    );
  }
}
