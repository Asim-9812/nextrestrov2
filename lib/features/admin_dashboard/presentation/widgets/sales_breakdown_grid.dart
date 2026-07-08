import 'package:flutter/material.dart';
import 'package:nextrestro/features/admin_dashboard/data/models/dashboard_summary_model.dart';
import 'dashboard_summary_card.dart';

class SalesBreakdownGrid extends StatelessWidget {
  final DashboardSummaryModel current;
  final DashboardSummaryModel? previous;
  final bool isPortrait;

  const SalesBreakdownGrid({
    super.key,
    required this.current,
    this.previous,
    this.isPortrait = false,
  });

  double _calculateChange(double currentVal, double previousVal) {
    if (previousVal == 0) return currentVal > 0 ? 100 : 0;
    return ((currentVal - previousVal) / previousVal) * 100;
  }

  @override
  Widget build(BuildContext context) {
    if (isPortrait) {
      return SizedBox(
        height: 140,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          children: [
            _buildCard('Cash Sales', current.cashSales, previous?.cashSales ?? 0, Icons.money, Colors.green),
            _buildCard('Card Sales', current.cardSales, previous?.cardSales ?? 0, Icons.credit_card, Colors.indigo),
            _buildCard('QR Sales', current.qrSales, previous?.qrSales ?? 0, Icons.qr_code_scanner, Colors.cyan),
            _buildCard('Credit Sales', current.creditSales, previous?.creditSales ?? 0, Icons.timer_outlined, Colors.brown),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 900 ? 4 : (constraints.maxWidth > 600 ? 2 : 2);
        
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 2,
          children: [
            DashboardSummaryCard(
              title: 'Cash Sales',
              value: 'Rs. ${current.cashSales.toStringAsFixed(2)}',
              percentageChange: _calculateChange(current.cashSales, previous?.cashSales ?? 0),
              icon: Icons.money,
              color: Colors.green,
              isSmall: true,
            ),
            DashboardSummaryCard(
              title: 'Card Sales',
              value: 'Rs. ${current.cardSales.toStringAsFixed(2)}',
              percentageChange: _calculateChange(current.cardSales, previous?.cardSales ?? 0),
              icon: Icons.credit_card,
              color: Colors.indigo,
              isSmall: true,
            ),
            DashboardSummaryCard(
              title: 'QR Sales',
              value: 'Rs. ${current.qrSales.toStringAsFixed(2)}',
              percentageChange: _calculateChange(current.qrSales, previous?.qrSales ?? 0),
              icon: Icons.qr_code_scanner,
              color: Colors.cyan,
              isSmall: true,
            ),
            DashboardSummaryCard(
              title: 'Credit Sales',
              value: 'Rs. ${current.creditSales.toStringAsFixed(2)}',
              percentageChange: _calculateChange(current.creditSales, previous?.creditSales ?? 0),
              icon: Icons.timer_outlined,
              color: Colors.brown,
              isSmall: true,
            ),
          ],
        );
      },
    );
  }

  Widget _buildCard(String title, double currentVal, double previousVal, IconData icon, Color color) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: DashboardSummaryCard(
        title: title,
        value: 'Rs. ${currentVal.toStringAsFixed(2)}',
        percentageChange: _calculateChange(currentVal, previousVal),
        icon: icon,
        color: color,
        isSmall: true,
      ),
    );
  }
}
