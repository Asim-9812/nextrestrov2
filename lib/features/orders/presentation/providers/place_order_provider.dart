import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nextrestro/features/orders/data/models/place_order_request.dart';
import 'package:nextrestro/features/orders/data/models/place_order_response.dart';
import 'package:nextrestro/features/orders/data/repositories/order_repository_impl.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_provider.dart';
import 'package:nextrestro/features/tables/presentation/providers/table_provider.dart';
import 'package:nextrestro/features/tables/data/models/table_model.dart';
import 'package:nextrestro/features/menu/data/models/menu_item_model.dart';
import 'package:nextrestro/features/customer/data/models/customer_model.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_order_provider.freezed.dart';
part 'place_order_provider.g.dart';

@freezed
abstract class PlaceOrderState with _$PlaceOrderState {
  const factory PlaceOrderState({
    TableModel? selectedTable,
    @Default([]) List<PlaceOrderItem> items,
    CustomerModel? selectedCustomer,
    @Default(AsyncValue.data(null)) AsyncValue<PlaceOrderResponse?> orderPlacementStatus,
    @Default(false) bool isExpanded,
  }) = _PlaceOrderState;
}

@riverpod
class PlaceOrderNotifier extends _$PlaceOrderNotifier {
  @override
  PlaceOrderState build() => const PlaceOrderState();

  void toggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }

  void selectTable(TableModel? table) {
    if (table == null) {
      state = state.copyWith(selectedTable: null);
      return;
    }

    // Check if there is an active order for this table
    final tableOrderMap = ref.read(tableOrderMapProvider);
    final activeOrder = tableOrderMap[table.tableID];

    if (activeOrder != null) {
      // Load existing items from the active order
      final items = activeOrder.items.map((item) => PlaceOrderItem(
        productId: item.productId ?? 0,
        itemName: item.productName ?? '',
        quantity: item.quantity ?? 0,
        unitPrice: 0, // Server doesn't always send unit price in details, might need adjustment
        subtotal: 0,
        specialInstructions: item.specialInstructions ?? '',
      )).toList();

      state = state.copyWith(
        selectedTable: table,
        items: items,
        // We might need to find the customer as well if possible
      );
    } else {
      // Table is available, start a new order
      state = state.copyWith(
        selectedTable: table,
        items: [],
      );
    }
  }

  void selectCustomer(CustomerModel? customer) {
    state = state.copyWith(selectedCustomer: customer);
  }

  void addItem(MenuItemModel menuItem) {
    final existingIndex = state.items.indexWhere((i) => i.productId == menuItem.itemID);
    
    if (existingIndex != -1) {
      final existingItem = state.items[existingIndex];
      final updatedItem = existingItem.copyWith(
        quantity: existingItem.quantity + 1,
        subtotal: (existingItem.quantity + 1) * existingItem.unitPrice,
      );
      final newItems = List<PlaceOrderItem>.from(state.items);
      newItems[existingIndex] = updatedItem;
      state = state.copyWith(items: newItems);
    } else {
      final newItem = PlaceOrderItem(
        productId: menuItem.itemID,
        itemName: menuItem.itemName,
        quantity: 1,
        unitPrice: menuItem.price,
        subtotal: menuItem.price,
        specialInstructions: '',
      );
      state = state.copyWith(items: [...state.items, newItem]);
    }
  }

  void updateQuantity(int productId, int delta) {
    final existingIndex = state.items.indexWhere((i) => i.productId == productId);
    if (existingIndex == -1) return;

    final existingItem = state.items[existingIndex];
    final newQuantity = existingItem.quantity + delta;

    if (newQuantity <= 0) {
      final newItems = List<PlaceOrderItem>.from(state.items);
      newItems.removeAt(existingIndex);
      state = state.copyWith(items: newItems);
    } else {
      final updatedItem = existingItem.copyWith(
        quantity: newQuantity,
        subtotal: newQuantity * existingItem.unitPrice,
      );
      final newItems = List<PlaceOrderItem>.from(state.items);
      newItems[existingIndex] = updatedItem;
      state = state.copyWith(items: newItems);
    }
  }

  void updateSpecialInstruction(int productId, String instruction) {
    final existingIndex = state.items.indexWhere((i) => i.productId == productId);
    if (existingIndex == -1) return;

    final existingItem = state.items[existingIndex];
    final updatedItem = existingItem.copyWith(specialInstructions: instruction);
    
    final newItems = List<PlaceOrderItem>.from(state.items);
    newItems[existingIndex] = updatedItem;
    state = state.copyWith(items: newItems);
  }

  void clearOrder() {
    state = const PlaceOrderState();
  }

  Future<void> placeOrder() async {
    if (state.selectedTable == null) return;
    if (state.items.isEmpty) return;

    state = state.copyWith(orderPlacementStatus: const AsyncValue.loading());

    final sessionService = ref.read(sessionServiceProvider);
    final userId = sessionService.getUser()?['userId'] ?? 0;

    final request = PlaceOrderRequest(
      customerId: state.selectedCustomer?.customerID ?? 1, // Default to 1 as requested
      tableId: state.selectedTable!.tableID,
      waiterId: userId,
      orderType: 'Dine In', // Assuming default order type
      items: state.items,
    );

    final repository = ref.read(orderRepositoryProvider);
    final result = await repository.createOrder(request);

    await result.fold(
      (failure) async {
        state = state.copyWith(orderPlacementStatus: AsyncValue.error(failure.message, StackTrace.current));
      },
      (response) async {
        // Automatically confirm the order
        final confirmResult = await repository.updateOrderStatus(response.orderId.result, 'Confirmed');
        
        confirmResult.fold(
          (failure) {
             state = state.copyWith(orderPlacementStatus: AsyncValue.error('Order created but confirmation failed: ${failure.message}', StackTrace.current));
          },
          (_) async {
             // Refresh order list and wait for it
             final dashboardNotifier = ref.read(orderDashboardProvider.notifier);
             await dashboardNotifier.refresh();
             await ref.read(orderDashboardProvider.future);

             state = state.copyWith(orderPlacementStatus: AsyncValue.data(response));
             ref.invalidate(tablesStreamProvider); // Refresh table list to show updated status
             clearOrder(); // Clear after success
          },
        );
      },
    );
  }
}
