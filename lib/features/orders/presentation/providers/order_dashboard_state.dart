import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';

part 'order_dashboard_state.freezed.dart';

@freezed
abstract class OrderDashboardState with _$OrderDashboardState {
  const factory OrderDashboardState({
    @Default([]) List<OrderDetailModel> completedOrders,
    @Default([]) List<OrderDetailModel> pendingOrders,
    @Default([]) List<OrderDetailModel> confirmedOrders,
    @Default([]) List<OrderDetailModel> readyOrders,
    @Default([]) List<OrderDetailModel> cancelledOrders,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _OrderDashboardState;
}
