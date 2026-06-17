import 'dart:async';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/features/orders/data/repositories/order_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_provider.g.dart';

@riverpod
class OrderController extends _$OrderController {
  @override
  FutureOr<List<GroupedOrder>> build() async {
    // Set up auto-refresh every 5 minutes
    final timer = Timer.periodic(const Duration(minutes: 5), (_) {
      refresh();
    });

    ref.onDispose(() => timer.cancel());

    return _fetchAllGroupedOrders();
  }

  Future<List<GroupedOrder>> _fetchAllGroupedOrders() async {
    final repository = ref.read(orderRepositoryProvider);
    final result = await repository.getAllOrdersGrouped();
    return result.fold(
      (failure) => throw failure.message,
      (orders) => orders,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
