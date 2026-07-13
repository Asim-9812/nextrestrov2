import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import '../providers/reports_controller.dart';
import '../widgets/sales_report_content.dart';
import '../widgets/product_sales_report_content.dart';
import '../widgets/customer_sales_report_content.dart';
import '../widgets/user_sales_report_content.dart';
import '../widgets/branch_sales_report_content.dart';

class ReportsPortraitPage extends ConsumerWidget {
  const ReportsPortraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedReportTabProvider);

    return Scaffold(
      body: _buildMainContent(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => ref.read(selectedReportTabProvider.notifier).set(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Sales',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Customer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Branch',
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
      case 2:
        return const CustomerSalesReportContent(isPortrait: true);
      case 3:
        return const UserSalesReportContent(isPortrait: true);
      case 4:
        return const BranchSalesReportContent(isPortrait: true);
      default:
        return const Center(child: Text('Select a report'));
    }
  }
}
