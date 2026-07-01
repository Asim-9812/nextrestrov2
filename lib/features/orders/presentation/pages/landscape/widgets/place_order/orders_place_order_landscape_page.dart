import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/features/orders/presentation/providers/place_order_provider.dart';
import 'widgets/menu_landscape_page.dart';
import 'widgets/table_selection_landscape_page.dart';
import 'widgets/order_summary_landscape_page.dart';

class OrdersPlaceOrderLandscapePage extends ConsumerWidget {
  const OrdersPlaceOrderLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(placeOrderProvider.select((s) => s.isExpanded));

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          // Main Content Layer
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Place Orders',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
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
              const Divider(height: 1),
              Expanded(
                child: const Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TableSelectionLandscapePage(),
                    ),
                    VerticalDivider(width: 1, thickness: 1, color: AppColors.ashGrey),
                    Expanded(
                      flex: 2,
                      child: MenuLandscapePage(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70), // Space for the bottom bar
            ],
          ),

          // Dim Overlay when expanded
          if (isExpanded)
            Positioned.fill(
              child: GestureDetector(
                onTap: () => ref.read(placeOrderProvider.notifier).toggleExpanded(),
                child: Container(
                  color: Colors.black.withValues(alpha: 0.4),
                ),
              ),
            ),

          // Floating Order Summary / Bottom Sheet
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            left: isExpanded ? 24 : 0,
            right: isExpanded ? 24 : 0,
            bottom: isExpanded ? 24 : 0,
            height: isExpanded ? MediaQuery.of(context).size.height * 0.75 : 70,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isExpanded ? 0.2 : 0.1),
                    blurRadius: isExpanded ? 20 : 10,
                    offset: const Offset(0, -2),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: const Radius.circular(24),
                  bottom: Radius.circular(isExpanded ? 24 : 0),
                ),
                child: const OrderSummaryLandscapePage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
