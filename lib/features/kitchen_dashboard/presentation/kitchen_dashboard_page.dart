import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'portrait/kitchen_dashboard_portrait_page.dart';
import 'landscape/kitchen_dashboard_landscape_page.dart';

class KitchenDashboardPage extends ConsumerWidget {
  const KitchenDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return const KitchenDashboardLandscapePage();
        } else {
          return const KitchenDashboardPortraitPage();
        }
      },
    );
  }
}
