import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../bloc/order_bloc.dart';
import '../bloc/order_event.dart';
import '../bloc/order_state.dart';
import '../widgets/order_card.dart';
import '../../domain/entities/order_entity.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _categories = [
    {'label': 'All', 'icon': Icons.grid_view_rounded},
    {'label': 'To Pay', 'icon': Icons.account_balance_wallet_outlined},
    {'label': 'Processing', 'icon': Icons.sync_rounded},
    {'label': 'Shipped', 'icon': Icons.local_shipping_outlined},
    {'label': 'Delivered', 'icon': Icons.task_alt_rounded},
    {'label': 'Cancelled', 'icon': Icons.cancel_outlined},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
    _loadOrders();
  }

  void _loadOrders() {
    final authState = context.read<AuthBloc>().state;
    if (authState is Authenticated) {
      context.read<OrderBloc>().add(FetchOrdersEvent(authState.user.userId));
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Orders',
          style: AppTextStyles.h2.copyWith(
            color: AppColors.primary, 
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: AppColors.primary, size: 28),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list_rounded, color: AppColors.primary, size: 28),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Manage and track your recent pet orders',
              style: TextStyle(
                color: Colors.black54, 
                fontSize: 13, 
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          AppSizes.gapH24,
          _buildModernTabBar(),
          AppSizes.gapH12,
          Expanded(
            child: BlocBuilder<OrderBloc, OrderState>(
              buildWhen: (previous, current) {
                return current is OrderLoading || current is OrderLoaded || current is OrderError;
              },
              builder: (context, state) {
                if (state is OrderLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is OrderLoaded) {
                  return TabBarView(
                    controller: _tabController,
                    children: [
                      _buildOrderList(state.orders), // All
                      _buildOrderList(state.orders.where((o) => o.status == OrderStatus.toPay).toList()),
                      _buildOrderList(state.orders.where((o) => o.status == OrderStatus.processing).toList()),
                      _buildOrderList(state.orders.where((o) => o.status == OrderStatus.shipped).toList()),
                      _buildOrderList(state.orders.where((o) => o.status == OrderStatus.delivered).toList()),
                      _buildOrderList(state.orders.where((o) => o.status == OrderStatus.cancelled).toList()),
                    ],
                  );
                }

                if (state is OrderError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.message, style: const TextStyle(color: Colors.red)),
                        AppSizes.gapH16,
                        ElevatedButton(onPressed: _loadOrders, child: const Text('Retry')),
                      ],
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernTabBar() {
    return Container(
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(14),
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        padding: EdgeInsets.zero,
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: const EdgeInsets.symmetric(horizontal: 16),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        labelColor: AppColors.primary,
        unselectedLabelColor: Colors.grey.shade600,
        labelStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
        tabs: _categories.map((cat) {
          return Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(cat['icon'], size: 16),
                const SizedBox(width: 8),
                Text(cat['label']),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildOrderList(List<OrderEntity> orders) {
    if (orders.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length + 1,
      itemBuilder: (context, index) {
        if (index == orders.length) {
          return _buildSupportBanner();
        }
        return OrderCard(
          order: orders[index],
          onTap: () {},
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Color(0xFFF2EEFF),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.shopping_bag_outlined, size: 60, color: AppColors.primary),
          ),
          AppSizes.gapH24,
          const Text(
            'No Orders Yet',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          AppSizes.gapH8,
          const Text(
            'Explore our products and place your first order!',
            style: TextStyle(color: Colors.grey, fontSize: 13),
            textAlign: TextAlign.center,
          ),
          AppSizes.gapH32,
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Go Shopping', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportBanner() {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F4FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.headset_mic_rounded, color: AppColors.primary),
          ),
          AppSizes.gapW16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Need help with your order?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  'We\'re here to help you 24/7',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
                ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
            child: const Text('Contact Support', style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
