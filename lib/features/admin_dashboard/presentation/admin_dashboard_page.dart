import 'package:flutter/material.dart';
import 'landscape/admin_dashboard_landscape_page.dart';
import 'potrait/admin_dashboard_potrait_page.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return orientation == Orientation.landscape
        ? const AdminDashboardLandscapePage()
        : const AdminDashboardPotraitPage();
  }
}
