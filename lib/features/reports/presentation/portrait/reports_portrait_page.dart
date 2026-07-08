import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/reports_controller.dart';
import '../widgets/sales_report_content.dart';

class ReportsPortraitPage extends ConsumerWidget {
  const ReportsPortraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedReportTabProvider);

    return Scaffold(
      body: _buildMainContent(selectedIndex),
    );
  }

  Widget _buildMainContent(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const SalesReportContent(isPortrait: true);
      default:
        return const Center(child: Text('Select a report'));
    }
  }
}
