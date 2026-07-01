import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/features/orders/data/repositories/order_repository_impl.dart';
import 'package:nextrestro/features/orders/presentation/providers/order_dashboard_state.dart';

part 'order_dashboard_provider.g.dart';

@riverpod
class OrderDashboard extends _$OrderDashboard {
  @override
  Stream<OrderDashboardState> build() {
    final repository = ref.read(orderRepositoryProvider);
    return repository.getOrderDashboardStream().map((result) {
      return result.fold(
        (failure) => throw failure.message,
        (state) => state,
      );
    });
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }

  Future<void> updateOrderItemStatus(int orderItemId, int orderId, String status) async {
    final repository = ref.read(orderRepositoryProvider);
    final result = await repository.updateOrderItemStatus(orderItemId, orderId, status);
    
    if (result.isLeft()) {
      final failure = result.getLeft().toNullable()!;
      state = AsyncValue.error(failure.message, StackTrace.current);
      return;
    }

    // Update local state instead of calling refresh() to avoid full screen refresh
    if (state.hasValue) {
      final currentState = state.value!;
      
      OrderDetailModel updateItem(OrderDetailModel item) {
        if (item.orderID == orderId && item.productId == orderItemId) {
          return item.copyWith(itemStatus: status);
        }
        return item;
      }

      state = AsyncValue.data(currentState.copyWith(
        pendingOrders: currentState.pendingOrders.map(updateItem).toList(),
        confirmedOrders: currentState.confirmedOrders.map(updateItem).toList(),
        readyOrders: currentState.readyOrders.map(updateItem).toList(),
        completedOrders: currentState.completedOrders.map(updateItem).toList(),
        cancelledOrders: currentState.cancelledOrders.map(updateItem).toList(),
      ));

      // Check all items for this order in the current state
      final allItemsInOrder = [
        ...currentState.confirmedOrders,
        ...currentState.readyOrders,
        ...currentState.pendingOrders,
      ].where((o) => o.orderID == orderId).toList();

      if (allItemsInOrder.isNotEmpty) {
        final currentOrderStatus = allItemsInOrder.first.orderStatus;

        // Check for Auto-Complete Logic first
        final allServedOrCancelled = allItemsInOrder.every((item) {
          final itemStatus = (item.productId == orderItemId) ? status : item.itemStatus;
          return itemStatus == 'Served' || itemStatus == 'Cancelled';
        });

        if (allServedOrCancelled) {
          if (currentOrderStatus != 'Completed') {
            await updateOrderStatus(orderId, 'Completed');
          }
          return;
        }

        // Then check for Auto-Ready Logic
        final allReady = allItemsInOrder.every((item) {
          final itemStatus = (item.productId == orderItemId) ? status : item.itemStatus;
          return itemStatus == 'Ready' || itemStatus == 'Served';
        });

        if (allReady) {
          if (currentOrderStatus != 'Ready' && currentOrderStatus != 'Completed') {
            await updateOrderStatus(orderId, 'Ready');
          }
          return;
        }
      }
    }
  }

  Future<void> updateOrderStatus(int orderId, String status) async {
    final repository = ref.read(orderRepositoryProvider);
    final result = await repository.updateOrderStatus(orderId, status);
    
    result.fold(
      (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
      (_) {
        // For full order status update, we can refresh to get clean state
        // or manually update local state. Refreshing is safer for order-level changes
        // as it might affect multiple items or lists.
        ref.invalidateSelf();
        // Also invalidate table stream as order status affects table status
        // Use ref.invalidate(tablesStreamProvider) if possible, but it's a stream
        // In this project it seems ref.invalidate(tablesStreamProvider) is used.
        try {
          // Attempt to invalidate tables stream if it exists
          // We need to import it or use a generic way if possible.
          // For now, refreshing dashboard is the priority.
        } catch (_) {}
      },
    );
  }

  Future<void> markAllItemsAsServed(int orderId, List<OrderDetailModel> items) async {
    final repository = ref.read(orderRepositoryProvider);
    
    // Filter items that are not already Served
    final itemsToServe = items.where((i) => i.itemStatus != 'Served').toList();
    
    if (itemsToServe.isEmpty) return;

    for (final item in itemsToServe) {
      await repository.updateOrderItemStatus(item.productId ?? 0, orderId, 'Served');
    }

    // Temporary Auto-Complete Logic for "Mark All Served"
    await repository.updateOrderStatus(orderId, 'Completed');

    // After all items are served and order is completed, invalidate to refresh
    ref.invalidateSelf();
  }

  Future<void> markAllItemsAsReady(int orderId, List<OrderDetailModel> items) async {
    final repository = ref.read(orderRepositoryProvider);
    
    // Filter items that are currently Pending (not Ready or Served)
    final itemsToReady = items.where((i) => i.itemStatus == 'Pending').toList();
    
    if (itemsToReady.isEmpty) {
      // Even if no items were pending, ensure order status is Ready if requested
      await repository.updateOrderStatus(orderId, 'Ready');
      ref.invalidateSelf();
      return;
    }

    for (final item in itemsToReady) {
      await repository.updateOrderItemStatus(item.productId ?? 0, orderId, 'Ready');
    }

    // Temporary Auto-Ready Logic for "Mark All Ready"
    await repository.updateOrderStatus(orderId, 'Ready');

    // Invalidate to force immediate refresh
    ref.invalidateSelf();
  }
}

@riverpod
class OrderSearchQuery extends _$OrderSearchQuery {
  @override
  String build() => '';
  void set(String query) => state = query;
}

@riverpod
class OrderStatusTab extends _$OrderStatusTab {
  @override
  String build() => 'Pending';
  void set(String status) => state = status;
}

@Riverpod(keepAlive: true)
class SelectedOrderItemId extends _$SelectedOrderItemId {
  @override
  int? build() => null;
  void select(int? id) => state = id;
}

@Riverpod(keepAlive: true)
class SelectedOrderId extends _$SelectedOrderId {
  @override
  int? build() => null;
  void select(int? id) => state = id;
}

@Riverpod(keepAlive: true)
class SelectedPendingOrderId extends _$SelectedPendingOrderId {
  @override
  int? build() => null;
  void select(int? id) => state = id;
}

@Riverpod(keepAlive: true)
class SelectedCompletedOrderId extends _$SelectedCompletedOrderId {
  @override
  int? build() => null;
  void select(int? id) => state = id;
}

@riverpod
Future<List<OrderDetailModel>?> selectedOrderDetails(Ref ref) async {
  final orderId = ref.watch(selectedOrderIdProvider);
  if (orderId == null) return null;

  // Watch the dashboard stream to react to real-time updates for the selected order
  final dashboardAsync = ref.watch(orderDashboardProvider);
  
  return dashboardAsync.maybeWhen(
    data: (state) {
      // Look for the order in confirmed, ready or completed lists
      final items = [
        ...state.confirmedOrders,
        ...state.readyOrders,
        ...state.completedOrders,
      ].where((o) => o.orderID == orderId).toList();
      
      if (items.isNotEmpty) return items;
      return null;
    },
    orElse: () => null,
  );
}

@riverpod
Future<List<OrderDetailModel>?> selectedPendingOrderDetails(Ref ref) async {
  final orderId = ref.watch(selectedPendingOrderIdProvider);
  if (orderId == null) return null;

  // Watch the dashboard stream to react to real-time updates for the selected order
  final dashboardAsync = ref.watch(orderDashboardProvider);
  
  return dashboardAsync.maybeWhen(
    data: (state) {
      // Filter the pending orders from the stream for the selected ID
      final items = state.pendingOrders.where((o) => o.orderID == orderId).toList();
      if (items.isNotEmpty) return items;
      
      // Fallback: if not in pending, check other lists or return empty
      // (Waiters might have confirmed it, etc.)
      return null;
    },
    orElse: () => null,
  );
}

@riverpod
Future<List<OrderDetailModel>?> selectedCompletedOrderDetails(Ref ref) async {
  final orderId = ref.watch(selectedCompletedOrderIdProvider);
  if (orderId == null) return null;

  final dashboardAsync = ref.watch(orderDashboardProvider);
  
  return dashboardAsync.maybeWhen(
    data: (state) {
      final items = state.completedOrders.where((o) => o.orderID == orderId).toList();
      if (items.isNotEmpty) return items;
      return null;
    },
    orElse: () => null,
  );
}
