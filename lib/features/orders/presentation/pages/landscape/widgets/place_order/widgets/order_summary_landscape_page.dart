import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/orders/presentation/providers/place_order_provider.dart';
import 'package:nextrestro/features/orders/presentation/pages/landscape/widgets/common/customer_selection_landscape_dialog.dart';

class OrderSummaryLandscapePage extends ConsumerWidget {
  const OrderSummaryLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(placeOrderProvider);
    final notifier = ref.read(placeOrderProvider.notifier);

    // Listen for order placement status
    ref.listen(placeOrderProvider.select((s) => s.orderPlacementStatus), (previous, next) {
      next.when(
        data: (response) {
          if (response != null) {
            Toaster.success(context: context, message: response.message, isLandscape: true);
          }
        },
        error: (err, _) => Toaster.error(context: context, message: err.toString(), isLandscape: true),
        loading: () {},
      );
    });

    return Material(
      color: Colors.white,
      child: Stack(
        children: [
          state.isExpanded 
            ? _buildExpandedView(context, ref, state, notifier)
            : _buildCollapsedView(context, ref, state, notifier),
          
          // Expansion Toggle Button at Top Right
          Positioned(
            right: 8,
            top: 8,
            child: IconButton(
              onPressed: () => notifier.toggleExpanded(),
              icon: Icon(
                state.isExpanded ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded,
                color: AppColors.primary,
              ),
              tooltip: state.isExpanded ? 'Collapse' : 'Expand Details',
              style: IconButton.styleFrom(
                backgroundColor: AppColors.primary.withValues(alpha: 0.1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsedView(BuildContext context, WidgetRef ref, PlaceOrderState state, PlaceOrderNotifier notifier) {
    final itemCount = state.items.fold(0, (sum, item) => sum + item.quantity);
    final total = state.items.fold(0.0, (sum, item) => sum + item.subtotal);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        children: [
          // Table Name
          Row(
            children: [
              const Icon(Icons.table_restaurant_outlined, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                state.selectedTable?.tableNumber ?? 'No Table',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          
          const SizedBox(width: 24),
          const Icon(Icons.chevron_right_rounded, color: AppColors.ashGrey),
          const SizedBox(width: 24),

          // Items count
          Row(
            children: [
              const Icon(Icons.shopping_basket_outlined, color: AppColors.grey, size: 20),
              const SizedBox(width: 8),
              Text(
                '$itemCount Items',
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ],
          ),

          const SizedBox(width: 24),
          const Icon(Icons.chevron_right_rounded, color: AppColors.ashGrey),
          const SizedBox(width: 24),

          // Total Price
          Text(
            'Rs. ${total.toStringAsFixed(0)}',
            style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w900, fontSize: 18),
          ),

          const Spacer(),

          // Customer Tab / Contact
          InkWell(
            onTap: () {
               showDialog(
                context: context,
                builder: (context) => const CustomerSelectionLandscapeDialog(),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    state.selectedCustomer != null ? Icons.person : Icons.person_add_alt_1,
                    size: 18,
                    color: state.selectedCustomer != null ? AppColors.primary : AppColors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    state.selectedCustomer != null 
                      ? state.selectedCustomer!.firstName
                      : 'Add Customer',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: state.selectedCustomer != null ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Action Buttons
          IconButton(
            onPressed: () => _showConfirmDialog(
              context, 
              'Clear Order', 
              'Reset the current selection?', 
              () => notifier.clearOrder()
            ),
            icon: const Icon(Icons.delete_outline_rounded, color: AppColors.error),
            tooltip: 'Clear Details',
          ),

          const SizedBox(width: 8),

          ElevatedButton.icon(
            onPressed: state.orderPlacementStatus.isLoading ? null : () {
              if (state.selectedTable == null || state.items.isEmpty) {
                String message = '';
                if (state.selectedTable == null && state.items.isEmpty) {
                  message = 'Please select a table and add items first.';
                } else if (state.selectedTable == null) {
                  message = 'Please select a table first.';
                } else {
                  message = 'Please add at least one item first.';
                }
                Toaster.error(context: context, message: message, isLandscape: true);
                return;
              }
              _showConfirmDialog(
                context, 
                'Place Order', 
                'Confirm kitchen order?', 
                () => notifier.placeOrder()
              );
            },
            icon: state.orderPlacementStatus.isLoading 
              ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
              : const Icon(Icons.check_circle_outline, size: 18),
            label: const Text('PLACE ORDER', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: (state.selectedTable == null || state.items.isEmpty) ? AppColors.grey : AppColors.success,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          
          const SizedBox(width: 48), // Padding for expansion button
        ],
      ),
    );
  }

  Widget _buildExpandedView(BuildContext context, WidgetRef ref, PlaceOrderState state, PlaceOrderNotifier notifier) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: Table Info, Customer Details, and Actions
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: _buildEnhancedTableDetails(state.selectedTable),
              ),
              const Divider(height: 1, indent: 20, endIndent: 20),
              Expanded(
                flex: 6,
                child: _buildEnhancedActions(context, ref, state),
              ),
            ],
          ),
        ),
        
        const VerticalDivider(width: 1, color: AppColors.ashGrey),

        // Right Column: Order Items
        Expanded(
          flex: 3,
          child: _buildModernOrderList(state.items, notifier),
        ),
      ],
    );
  }

  Widget _buildEnhancedTableDetails(dynamic table) {
    if (table == null) {
      return const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.table_restaurant_outlined, size: 40, color: AppColors.ashGrey),
              SizedBox(height: 8),
              Text('No Table', style: TextStyle(color: AppColors.grey, fontSize: 12)),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.chair_alt_outlined, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 12),
              const Text('Table Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Manrope')),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _detailTile(Icons.tag, 'Number', table.tableNumber)),
              Expanded(child: _detailTile(Icons.groups_outlined, 'Capacity', '${table.capacity}')),
            ],
          ),
          _detailTile(Icons.layers_outlined, 'Floor', table.floorName),
        ],
      ),
    );
  }

  Widget _detailTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.grey),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: AppColors.grey, fontSize: 11)),
              Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildModernOrderList(List<dynamic> items, PlaceOrderNotifier notifier) {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_basket_outlined, size: 48, color: AppColors.grey.withValues(alpha: 0.5)),
            const SizedBox(height: 12),
            const Text('Your cart is empty', style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.w500)),
          ],
        ),
      );
    }

    double total = items.fold(0, (sum, item) => sum + item.subtotal);

    return Column(
      children: [
        const SizedBox(height: 16,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Order Items', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Manrope')),
            ],
          ),
        ),
        const SizedBox(height: 16,),
        const Divider(height: 1),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 4),
            itemCount: items.length,
            separatorBuilder: (context, index) => const Divider(height: 1, indent: 16, endIndent: 16),
            itemBuilder: (context, index) {
              final item = items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.bg,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text('${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.itemName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 32,
                            child: TextField(
                              onChanged: (val) => notifier.updateSpecialInstruction(item.productId, val),
                              style: const TextStyle(fontSize: 10),
                              decoration: InputDecoration(
                                hintText: 'Add special request...',
                                border: InputBorder.none,
                                isDense: true,
                                hintStyle: TextStyle(color: AppColors.grey.withValues(alpha: 0.5), fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Qty: ${item.quantity}', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                        Text('Rs. ${item.subtotal.toStringAsFixed(0)}', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          color: AppColors.bg.withValues(alpha: 0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Order Total', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text('Rs. ${total.toStringAsFixed(0)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.primary)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEnhancedActions(BuildContext context, WidgetRef ref, PlaceOrderState state) {
    final selectedCustomer = state.selectedCustomer;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Customer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Manrope')),
          const SizedBox(height: 12),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const CustomerSelectionLandscapeDialog(),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: selectedCustomer != null ? AppColors.primary : AppColors.ashGrey, width: 1),
                boxShadow: [
                  if (selectedCustomer != null)
                    BoxShadow(color: AppColors.primary.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2))
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: (selectedCustomer != null ? AppColors.primary : AppColors.grey).withValues(alpha: 0.1),
                    radius: 16,
                    child: Icon(
                      selectedCustomer != null ? Icons.person : Icons.person_add_alt_1,
                      color: selectedCustomer != null ? AppColors.primary : AppColors.grey,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      selectedCustomer != null 
                        ? '${selectedCustomer.firstName} ${selectedCustomer.lastName}' 
                        : 'Select Customer',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: selectedCustomer != null ? Colors.black : AppColors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.grey, size: 18),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _actionButton(
            label: 'CLEAR ORDER',
            icon: Icons.delete_outline_rounded,
            color: AppColors.error,
            isOutlined: true,
            onPressed: () => _showConfirmDialog(
              context, 
              'Clear Order', 
              'Reset selection?', 
              () => ref.read(placeOrderProvider.notifier).clearOrder(),
            ),
          ),
          const SizedBox(height: 12),
          _actionButton(
            label: 'PLACE ORDER',
            icon: Icons.shopping_cart_checkout_rounded,
            color: (state.selectedTable == null || state.items.isEmpty) ? AppColors.grey : AppColors.success,
            isLoading: state.orderPlacementStatus.isLoading,
            onPressed: () {
               if (state.selectedTable == null || state.items.isEmpty) {
                String message = '';
                if (state.selectedTable == null && state.items.isEmpty) {
                  message = 'Please select a table and add items first.';
                } else if (state.selectedTable == null) {
                  message = 'Please select a table first.';
                } else {
                  message = 'Please add at least one item first.';
                }
                Toaster.error(context: context, message: message, isLandscape: true);
                return;
              }
              _showConfirmDialog(
                context, 
                'Place Order', 
                'Confirm kitchen order?', 
                () => ref.read(placeOrderProvider.notifier).placeOrder(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
    bool isOutlined = false,
    bool isLoading = false,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: isOutlined
          ? OutlinedButton.icon(
              onPressed: isLoading ? null : onPressed,
              icon: Icon(icon, size: 20),
              label: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5)),
              style: OutlinedButton.styleFrom(
                foregroundColor: color,
                side: BorderSide(color: color.withValues(alpha: 0.5), width: 1.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            )
          : ElevatedButton.icon(
              onPressed: isLoading ? null : onPressed,
              icon: isLoading 
                ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5))
                : Icon(icon, size: 20),
              label: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5)),
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                elevation: 4,
                shadowColor: color.withValues(alpha: 0.3),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
    );
  }

  void _showConfirmDialog(BuildContext context, String title, String message, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Text(message),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Text('CANCEL', style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onConfirm();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: title.contains('Clear') ? AppColors.error : AppColors.primary,
              foregroundColor: Colors.white,
            ),
            child: const Text('CONFIRM', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
