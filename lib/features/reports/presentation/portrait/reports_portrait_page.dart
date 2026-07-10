import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import '../providers/reports_controller.dart';
import '../widgets/sales_report_content.dart';
import '../widgets/product_sales_report_content.dart';

class ReportsPortraitPage extends ConsumerWidget {
  const ReportsPortraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedReportTabProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: _buildMainContent(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.primary,
        onTap: (index) => ref.read(selectedReportTabProvider.notifier).set(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Sales',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Product Sales',
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const SalesReportContent(isPortrait: true);
      case 1:
        return const ProductSalesReportContent(isPortrait: true);
      default:
        return const Center(child: Text('Select a report'));
    }
  }
}
