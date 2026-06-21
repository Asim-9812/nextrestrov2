import 'package:flutter/material.dart';
import 'landscape/waiter_dashboard_landscape_page.dart';
import 'potrait/waiter_dashboard_potrait_page.dart';

class WaiterDashboardPage extends StatelessWidget {
  const WaiterDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return const WaiterDashboardLandscapePage();
        } else {
          return const WaiterDashboardPotraitPage();
        }
      },
    );
  }
}
