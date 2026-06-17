import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/features/orders/data/models/place_order_request.dart';
import 'package:nextrestro/features/orders/data/models/place_order_response.dart';
import 'package:nextrestro/features/orders/data/models/order_preview_response.dart';
import 'package:nextrestro/features/orders/data/models/order_checkout_request.dart';

import '../../presentation/providers/order_dashboard_state.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderDetailModel>>> getOrdersByStatus(String status);
  Future<Either<Failure, List<GroupedOrder>>> getAllOrdersGrouped();
  Stream<Either<Failure, OrderDashboardState>> getOrderDashboardStream();
  Future<Either<Failure, PlaceOrderResponse>> createOrder(PlaceOrderRequest request);
  Future<Either<Failure, void>> updateOrderStatus(int orderId, String status);
  Future<Either<Failure, void>> updateOrderItemStatus(int orderItemId, int orderId, String status);
  Future<Either<Failure, List<OrderDetailModel>>> getOrderById(int orderId);
  Future<Either<Failure, OrderPreviewResponse>> getOrderPreview(int orderId, double discount);
  Future<Either<Failure, void>> checkoutOrder(OrderCheckoutRequest request);
}
