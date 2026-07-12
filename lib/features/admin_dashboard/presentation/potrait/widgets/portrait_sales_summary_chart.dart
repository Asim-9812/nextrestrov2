import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:nextrestro/features/admin_dashboard/data/models/dashboard_summary_model.dart';

class PortraitSalesSummaryChart extends StatelessWidget {
  final DashboardSummaryModel summary;

  const PortraitSalesSummaryChart({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    final List<_ChartData> chartData = [
      _ChartData('Cash', summary.cashSales, Colors.green),
      _ChartData('Card', summary.cardSales, Colors.blue),
      _ChartData('UPI / QR', summary.qrSales, Colors.purple),
      _ChartData('Credit', summary.creditSales, Colors.orange),
    ];

    final visibleData = chartData.where((data) => data.y > 0).toList();
    if (visibleData.isEmpty) {
      visibleData.add(_ChartData('No Sales', 1, AppColors.ashGrey));
    }

    final total = summary.totalSales;

    return Container(
      // IMPORTANT: Use specific padding and no infinite height
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ExcludeSemantics(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Sales Summary',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Chart Area with FIXED HEIGHT
            SizedBox(
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SfCircularChart(
                    margin: EdgeInsets.zero,
                    series: <CircularSeries>[
                      DoughnutSeries<_ChartData, String>(
                        dataSource: visibleData,
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y,
                        pointColorMapper: (_ChartData data, _) => data.color,
                        innerRadius: '70%',
                        radius: '100%',
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Rs.',
                        style: TextStyle(fontSize: 10, color: AppColors.grey),
                      ),
                      FittedBox(
                        child: Text(
                          total.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Legend Area
            Column(
              children: chartData.map((data) => _buildLegendItem(data, total)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(_ChartData data, double total) {
    final percentage = total > 0 ? (data.y / total) * 100 : 0.0;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: data.color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              data.x,
              style: const TextStyle(fontSize: 12, color: AppColors.blackGrey),
            ),
          ),
          Text(
            '${percentage.toStringAsFixed(1)}%',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
