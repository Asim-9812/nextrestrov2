import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import '../providers/reports_controller.dart';
import '../widgets/sales_report_content.dart';
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
      default:
        return const Center(child: Text('Select a report from the menu'));
    }
  }
}
