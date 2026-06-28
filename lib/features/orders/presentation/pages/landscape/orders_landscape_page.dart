import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/pages/landscape/widgets/dashboard/orders_dashboard_landscape_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/landscape/widgets/place_order/orders_place_order_landscape_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/landscape/widgets/pending/pending_orders_landscape_page.dart';
import 'package:nextrestro/features/orders/presentation/pages/landscape/widgets/orders_sidebar.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_provider.dart';
import 'package:nextrestro/features/orders/presentation/pages/landscape/widgets/manage_orders/manage_orders_landscape_page.dart';

class OrdersLandscapePage extends ConsumerStatefulWidget {
  const OrdersLandscapePage({super.key});

  @override
  ConsumerState<OrdersLandscapePage> createState() => _OrdersLandscapePageState();
}

class _OrdersLandscapePageState extends ConsumerState<OrdersLandscapePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final shiftState = ref.watch(shiftControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: shiftState.when(
        data: (data) {
          final activeShift = data.$1;
          if (activeShift == null || activeShift.shiftStatus != 1) {
            return _buildNoActiveShift();
          }

          return Row(
            children: [
              OrdersSidebar(
                selectedIndex: _selectedIndex,
                onItemSelected: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: IndexedStack(
                        index: _selectedIndex.clamp(0, 3),
                        children: const [
                          OrdersDashboardLandscapePage(),
                          OrdersPlaceOrderLandscapePage(),
                          PendingOrdersLandscapePage(),
                          ManageOrdersLandscapePage(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildNoActiveShift() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.lock_clock, size: 80, color: AppColors.grey),
          const SizedBox(height: 24),
          const Text(
            'No Active Shift Found',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Please open a shift from the Dashboard to manage orders.',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              // Navigate back or to dashboard
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text('Go to Dashboard'),
          ),
        ],
      ),
    );
  }
}
