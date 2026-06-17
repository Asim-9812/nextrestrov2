import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/orders/presentation/providers/place_order_provider.dart';
import 'package:nextrestro/features/orders/presentation/pages/portrait/widgets/common/customer_selection_portrait_dialog.dart';

class OrderSummaryPortraitPage extends ConsumerWidget {
  const OrderSummaryPortraitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(placeOrderProvider);
    final notifier = ref.read(placeOrderProvider.notifier);

    // Listen for order placement status
    ref.listen(placeOrderProvider.select((s) => s.orderPlacementStatus), (previous, next) {
      next.when(
        data: (response) {
          if (response != null) {
            Toaster.success(context: context, message: response.message);
          }
        },
        error: (err, _) => Toaster.error(context: context, message: err.toString()),
        loading: () {},
      );
    });

    final itemCount = state.items.fold(0, (sum, item) => sum + item.quantity);
    final total = state.items.fold(0.0, (sum, item) => sum + item.subtotal);

    return Column(
      children: [
        // Items List
        Expanded(
          child: state.items.isEmpty
              ? _buildEmptyCart()
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.items.length,
                  separatorBuilder: (context, index) => const Divider(height: 24),
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.itemName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                              const SizedBox(height: 4),
                              TextField(
                                onChanged: (val) => notifier.updateSpecialInstruction(item.productId, val),
                                decoration: const InputDecoration(
                                  hintText: 'Add instructions...',
                                  hintStyle: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 24,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('x${item.quantity}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text('Rs. ${item.subtotal.toStringAsFixed(0)}', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    );
                  },
                ),
        ),

        // Bottom Actions
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -4))],
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTableAndCustomerInfo(context, state),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total: $itemCount items', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.grey)),
                    Text('Rs. ${total.toStringAsFixed(0)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.primary)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => notifier.clearOrder(),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.error,
                          side: const BorderSide(color: AppColors.error),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('CLEAR'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: state.orderPlacementStatus.isLoading ? null : () => notifier.placeOrder(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.success,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: state.orderPlacementStatus.isLoading 
                            ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                            : const Text('PLACE ORDER', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyCart() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_basket_outlined, size: 64, color: AppColors.lightGrey),
          SizedBox(height: 16),
          Text('Your cart is empty', style: TextStyle(color: AppColors.grey, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildTableAndCustomerInfo(BuildContext context, PlaceOrderState state) {
    return Row(
      children: [
        Expanded(
          child: _infoBadge(
            icon: Icons.table_restaurant,
            label: state.selectedTable?.tableNumber ?? 'No Table',
            color: state.selectedTable != null ? AppColors.primary : AppColors.grey,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: InkWell(
            onTap: () => showDialog(context: context, builder: (context) => const CustomerSelectionPortraitDialog()),
            child: _infoBadge(
              icon: Icons.person,
              label: state.selectedCustomer != null ? state.selectedCustomer!.firstName : 'Add Customer',
              color: state.selectedCustomer != null ? AppColors.primary : AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _infoBadge({required IconData icon, required String label, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Flexible(child: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12), overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}
