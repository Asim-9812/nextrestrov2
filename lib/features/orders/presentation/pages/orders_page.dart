import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/features/orders/presentation/pages/portrait/orders_portrait_page.dart';
import 'landscape/orders_landscape_page.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return const OrdersLandscapePage();
        } else {
          // For now, using landscape or a simple placeholder for portrait
          return const OrdersPortraitPage();
        }
      },
    );
  }
}
