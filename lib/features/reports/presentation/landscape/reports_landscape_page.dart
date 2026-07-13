import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import '../providers/reports_controller.dart';
import '../widgets/sales_report_content.dart';
import '../widgets/product_sales_report_content.dart';
import '../widgets/customer_sales_report_content.dart';
import '../widgets/user_sales_report_content.dart';
import '../widgets/branch_sales_report_content.dart';
import '../../../menu/presentation/landscape/widgets/menu_sidebar_item.dart';

class ReportsLandscapePage extends ConsumerWidget {
  const ReportsLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedReportTabProvider);

    return Scaffold(
      body: Row(
        children: [
          // Left Section - Sidebar
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border(right: BorderSide(color: AppColors.ashGrey, width: 0.5)),
              ),
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    MenuSidebarItem(
                      icon: MaterialSymbols.bar_chart,
                      label: 'Sales Report',
                      isSelected: selectedIndex == 0,
                      onTap: () => ref.read(selectedReportTabProvider.notifier).set(0),
                    ),
                    MenuSidebarItem(
                      icon: MaterialSymbols.inventory,
                      label: 'Product Sales Report',
                      isSelected: selectedIndex == 1,
                      onTap: () => ref.read(selectedReportTabProvider.notifier).set(1),
                    ),
                    MenuSidebarItem(
                      icon: MaterialSymbols.group,
                      label: 'Customer Sales Report',
                      isSelected: selectedIndex == 2,
                      onTap: () => ref.read(selectedReportTabProvider.notifier).set(2),
                    ),
                    MenuSidebarItem(
                      icon: MaterialSymbols.person,
                      label: 'User Sales Report',
                      isSelected: selectedIndex == 3,
                      onTap: () => ref.read(selectedReportTabProvider.notifier).set(3),
                    ),
                    MenuSidebarItem(
                      icon: MaterialSymbols.store,
                      label: 'Branch Sales Report',
                      isSelected: selectedIndex == 4,
                      onTap: () => ref.read(selectedReportTabProvider.notifier).set(4),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Right Section - Content
          Expanded(
            flex: 4,
            child: Container(
              height: double.infinity,
              color: AppColors.bg,
              child: _buildMainContent(selectedIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const SalesReportContent();
      case 1:
        return const ProductSalesReportContent();
      case 2:
        return const CustomerSalesReportContent();
      case 3:
        return const UserSalesReportContent();
      case 4:
        return const BranchSalesReportContent();
      default:
        return const Center(child: Text('Select a report from the menu'));
    }
  }
}
