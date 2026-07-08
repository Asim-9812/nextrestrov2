import 'package:flutter/material.dart';
import '../landscape/reports_landscape_page.dart';
import '../portrait/reports_portrait_page.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return const ReportsLandscapePage();
        } else {
          return const ReportsPortraitPage();
        }
      },
    );
  }
}
