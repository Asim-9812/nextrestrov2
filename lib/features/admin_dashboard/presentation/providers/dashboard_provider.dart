import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/features/orders/data/repositories/order_repository_impl.dart';
import 'package:nextrestro/features/shift/data/repositories/shift_repository_impl.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_provider.freezed.dart';
part 'dashboard_provider.g.dart';

@freezed
abstract class OrderStats with _$OrderStats {
  const factory OrderStats({
    @Default(0) int currentShiftOrders,
    @Default(0) int lastShiftOrders,
  }) = _OrderStats;
}

@riverpod
Future<OrderStats> orderStats(Ref ref) async {
  // Set up auto-refresh every 5 minutes
  final timer = Timer.periodic(const Duration(minutes: 5), (_) {
    ref.invalidateSelf();
  });
  ref.onDispose(() => timer.cancel());

  final shiftData = await ref.watch(shiftControllerProvider.future);
  final activeShift = shiftData.$1;
  
  if (activeShift == null) return const OrderStats();

  final orderRepo = ref.read(orderRepositoryProvider);
  final shiftRepo = ref.read(shiftRepositoryProvider);

  // Get completed orders
  final result = await orderRepo.getOrdersByStatus("Completed");
  final allCompletedOrders = result.fold((_) => <OrderDetailModel>[], (list) => list);

  // Filter current shift orders
  final activeShiftStartTime = DateTime.tryParse(activeShift.openingTime ?? '') ?? DateTime(0);
  final Set<int> currentShiftOrderIds = {};
  for (final order in allCompletedOrders) {
    final orderTime = DateTime.tryParse(order.orderDate ?? '') ?? DateTime(0);
    if (orderTime.isAfter(activeShiftStartTime) && order.orderID != null) {
      currentShiftOrderIds.add(order.orderID!);
    }
  }

  // Get last closed shift
  final lastShiftResult = await shiftRepo.getLastClosedShift();
  final lastShift = lastShiftResult.fold((_) => null, (s) => s);

  int lastShiftOrderCount = 0;
  if (lastShift != null) {
    final lastShiftStartTime = DateTime.tryParse(lastShift.openingTime ?? '') ?? DateTime(0);
    final lastShiftEndTime = DateTime.tryParse(lastShift.closingTime ?? '') ?? DateTime.now();
    
    final Set<int> lastShiftOrderIds = {};
    for (final order in allCompletedOrders) {
      final orderTime = DateTime.tryParse(order.orderDate ?? '') ?? DateTime(0);
      if (orderTime.isAfter(lastShiftStartTime) && 
          orderTime.isBefore(lastShiftEndTime) && 
          order.orderID != null) {
        lastShiftOrderIds.add(order.orderID!);
      }
    }
    lastShiftOrderCount = lastShiftOrderIds.length;
  }

  return OrderStats(
    currentShiftOrders: currentShiftOrderIds.length,
    lastShiftOrders: lastShiftOrderCount,
  );
}
