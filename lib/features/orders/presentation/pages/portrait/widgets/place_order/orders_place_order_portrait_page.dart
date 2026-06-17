import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'widgets/menu_portrait_page.dart';
import 'widgets/table_selection_portrait_page.dart';
import 'widgets/order_summary_portrait_page.dart';

class OrdersPlaceOrderPortraitPage extends ConsumerStatefulWidget {
  const OrdersPlaceOrderPortraitPage({super.key});

  @override
  ConsumerState<OrdersPlaceOrderPortraitPage> createState() => _OrdersPlaceOrderPortraitPageState();
}

class _OrdersPlaceOrderPortraitPageState extends ConsumerState<OrdersPlaceOrderPortraitPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.grey,
            indicatorColor: AppColors.primary,
            tabs: const [
              Tab(text: 'Tables'),
              Tab(text: 'Menu'),
              Tab(text: 'Summary'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                TableSelectionPortraitPage(),
                MenuPortraitPage(),
                OrderSummaryPortraitPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
