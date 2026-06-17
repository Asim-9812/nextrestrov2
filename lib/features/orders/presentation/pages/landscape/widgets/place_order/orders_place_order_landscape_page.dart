import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'widgets/menu_landscape_page.dart';
import 'widgets/table_selection_landscape_page.dart';
import 'widgets/order_summary_landscape_page.dart';

class OrdersPlaceOrderLandscapePage extends ConsumerWidget {
  const OrdersPlaceOrderLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Place Orders',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Create and add orders instantly.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          const Divider(
            height: 0,
          ),
          Expanded(
            child: const Row(
              children: [

                // Middle Section: Table Selection
                Expanded(
                  flex: 1,
                  child: TableSelectionLandscapePage(),
                ),
                VerticalDivider(width: 1, thickness: 1, color: AppColors.ashGrey),
                // Left Sidebar: Menu (Categories + Products)
                Expanded(
                  flex: 2,
                  child: MenuLandscapePage(),
                ),
              ],
            ),
          ),
          // Right Section: Order Summary
          OrderSummaryLandscapePage(),
        ],
      ),
    );
  }
}
