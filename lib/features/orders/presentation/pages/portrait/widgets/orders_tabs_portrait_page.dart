import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'pending/pending_orders_portrait_page.dart';
import 'confirmed/confirmed_orders_portrait_page.dart';
import 'completed/completed_orders_portrait_page.dart';

class OrdersTabsPortraitPage extends StatelessWidget {
  const OrdersTabsPortraitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: Column(
          children: [
            const TabBar(
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.grey,
              indicatorColor: AppColors.primary,
              tabs: [
                Tab(text: 'Pending'),
                Tab(text: 'Confirmed'),
                Tab(text: 'Completed'),
              ],
            ),
            Expanded(
              child: const TabBarView(
                children: [
                  PendingOrdersPortraitPage(),
                  ConfirmedOrdersPortraitPage(),
                  CompletedOrdersPortraitPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
