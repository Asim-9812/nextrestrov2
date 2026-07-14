import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/core/utils/time_formatter.dart';
import 'package:nextrestro/features/orders/presentation/providers/place_order_provider.dart';
import 'package:nextrestro/features/orders/presentation/pages/landscape/widgets/common/customer_selection_landscape_dialog.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';

class CurrentOrderSection extends ConsumerWidget {
  const CurrentOrderSection({super.key});

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

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Row(
            children: [
              const Icon(Icons.chair_alt_outlined, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              const Text(
                'Current Order',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Manrope'),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  state.selectedTable?.tableNumber ?? 'No Table',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Table Info Grid
          _buildTableInfoGrid(state, ref),
          const SizedBox(height: 16),
          
          // Customer Section
          _buildCustomerSection(context, state),
          const SizedBox(height: 16),
          
          // Order Items Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Items (${state.items.length})',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // Order Items List
          Expanded(
            child: state.items.isEmpty 
              ? _buildEmptyState() 
              : _buildOrderList(state, notifier),
          ),
          
          const Divider(),
          
          // Total
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Order Total',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackGrey,
                  ),
                ),
                Text(
                  'Rs. ${state.items.fold(0.0, (sum, item) => sum + item.subtotal).toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
          
          // Actions
          Row(
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    final isOccupied = state.selectedTable?.status.toLowerCase() == 'occupied';
                    final buttonLabel = isOccupied ? 'Update Order' : 'Place Order';
                    final buttonColor = isOccupied ? AppColors.primary : AppColors.success;
                    
                    return ElevatedButton.icon(
                      onPressed: state.orderPlacementStatus.isLoading ? null : () => _handlePlaceOrder(context, state, notifier, buttonLabel),
                      icon: state.orderPlacementStatus.isLoading 
                        ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : const Icon(Icons.check_circle_outline, size: 18),
                      label: Text(buttonLabel, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (state.selectedTable == null || state.items.isEmpty) ? AppColors.grey : buttonColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => _showConfirmDialog(context, 'Clear Order', 'Reset the current selection?', () => notifier.clearOrder()),
            icon: const Icon(Icons.delete_outline_rounded, size: 18),
            label: const Text('Clear Order', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.error,
              side: const BorderSide(color: AppColors.error),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableInfoGrid(PlaceOrderState state, WidgetRef ref) {
    final tableOrders = ref.watch(tableOrderMapProvider);
    final activeOrder = state.selectedTable != null ? tableOrders[state.selectedTable!.tableID] : null;
    
    String orderTime = '-';
    String duration = '00:00';
    
    if (activeOrder != null) {
      orderTime = TimeFormatter.formatTimeOnly(activeOrder.date.toIso8601String());
      duration = TimeFormatter.formatDuration(activeOrder.date.toIso8601String());
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.bg.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _infoTile(Icons.groups_outlined, 'Capacity', '${state.selectedTable?.capacity ?? '-'} Seats'),
              const Spacer(),
              _infoTile(Icons.layers_outlined, 'Floor', state.selectedTable?.floorName ?? '-'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _infoTile(Icons.schedule_outlined, 'Order Time', orderTime),
              const Spacer(),
              _infoTile(Icons.timer_outlined, 'Duration', duration),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: AppColors.grey),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 10, color: AppColors.grey)),
            Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildCustomerSection(BuildContext context, PlaceOrderState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Customer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.grey)),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const CustomerSelectionLandscapeDialog(),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.ashGrey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.person_outline, size: 18, color: AppColors.grey),
                const SizedBox(width: 8),
                Text(
                  state.selectedCustomer != null 
                    ? '${state.selectedCustomer!.firstName} ${state.selectedCustomer!.lastName}' 
                    : 'Select Customer',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: state.selectedCustomer != null ? FontWeight.bold : FontWeight.normal,
                    color: state.selectedCustomer != null ? Colors.black : AppColors.grey,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.edit_outlined, size: 16, color: AppColors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_basket_outlined, size: 40, color: AppColors.ashGrey),
          const SizedBox(height: 8),
          const Text('No items added', style: TextStyle(color: AppColors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildOrderList(PlaceOrderState state, PlaceOrderNotifier notifier) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: state.items.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final item = state.items[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.ashGrey.withValues(alpha: 0.5)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.orange.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item.itemName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'Manrope',
                            ),
                          ),
                        ),
                        Text(
                          'Qty: ${item.quantity}',
                          style: const TextStyle(fontSize: 12, color: AppColors.grey),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Rs. ${item.subtotal.toStringAsFixed(0)}',
                          style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => _showSpecialRequestDialog(context, item, notifier),
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.bg,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColors.ashGrey.withValues(alpha: 0.3)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.specialInstructions.isEmpty ? 'No special request' : item.specialInstructions,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: item.specialInstructions.isEmpty 
                                            ? AppColors.grey.withValues(alpha: 0.6)
                                            : AppColors.blackGrey,
                                        fontStyle: item.specialInstructions.isEmpty ? FontStyle.italic : FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                  const Icon(Icons.edit_outlined, size: 16, color: AppColors.grey),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () => notifier.updateQuantity(item.productId, -item.quantity),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.red.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.delete_outline, size: 18, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Add Item', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.grey,
            minimumSize: const Size(double.infinity, 44),
            side: BorderSide(color: AppColors.ashGrey.withValues(alpha: 0.5), style: BorderStyle.solid),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: AppColors.bg.withValues(alpha: 0.3),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  void _handlePlaceOrder(BuildContext context, PlaceOrderState state, PlaceOrderNotifier notifier, String buttonLabel) {
    if (state.selectedTable == null || state.items.isEmpty) {
      String message = state.selectedTable == null ? 'Please select a table first.' : 'Please add at least one item first.';
      Toaster.error(context: context, message: message, isLandscape: true);
      return;
    }
    _showConfirmDialog(context, buttonLabel, 'Confirm kitchen order?', () => notifier.placeOrder());
  }

  void _showConfirmDialog(BuildContext context, String title, String message, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('CANCEL')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onConfirm();
            },
            style: ElevatedButton.styleFrom(backgroundColor: title.contains('Clear') ? AppColors.error : AppColors.primary, foregroundColor: Colors.white),
            child: const Text('CONFIRM'),
          ),
        ],
      ),
    );
  }

  void _showSpecialRequestDialog(BuildContext context, dynamic item, PlaceOrderNotifier notifier) {
    final controller = TextEditingController(text: item.specialInstructions);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Request for ${item.itemName}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        content: TextField(
          controller: controller,
          maxLines: 3,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'e.g. Extra spicy, No onions...',
            hintStyle: TextStyle(fontSize: 14, color: AppColors.grey.withValues(alpha: 0.5)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: AppColors.bg,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          ElevatedButton(
            onPressed: () {
              notifier.updateSpecialInstruction(item.productId, controller.text);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
            child: const Text('SAVE'),
          ),
        ],
      ),
    );
  }
}
