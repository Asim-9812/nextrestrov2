import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_provider.dart';
import 'package:nextrestro/features/orders/presentation/pages/portrait/widgets/manage_orders/manage_orders_portrait_page.dart';
import 'widgets/dashboard/orders_dashboard_portrait_page.dart';
import 'widgets/place_order/orders_place_order_portrait_page.dart';

class OrdersPortraitPage extends ConsumerStatefulWidget {
  const OrdersPortraitPage({super.key});

  @override
  ConsumerState<OrdersPortraitPage> createState() => _OrdersPortraitPageState();
}

class _OrdersPortraitPageState extends ConsumerState<OrdersPortraitPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const OrdersDashboardPortraitPage(),
    const OrdersPlaceOrderPortraitPage(),
    const ManageOrdersPortraitPage(),
  ];

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

          return IndexedStack(
            index: _selectedIndex,
            children: _pages,
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      bottomNavigationBar: _selectedIndex < _pages.length ? BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_outlined),
            activeIcon: Icon(Icons.add_shopping_cart),
            label: 'Place Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            activeIcon: Icon(Icons.receipt_long),
            label: 'Orders',
          ),
        ],
      ) : null,
    );
  }

  Widget _buildNoActiveShift() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_clock, size: 80, color: AppColors.grey),
            const SizedBox(height: 24),
            const Text(
              'No Active Shift Found',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Please open a shift from the Dashboard to manage orders.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Go to Dashboard'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
