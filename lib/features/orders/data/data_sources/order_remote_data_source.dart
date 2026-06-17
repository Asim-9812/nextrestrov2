import 'package:nextrestro/core/network/api_client.dart';
import 'package:nextrestro/core/network/api_constants.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/features/orders/data/models/place_order_request.dart';
import 'package:nextrestro/features/orders/data/models/place_order_response.dart';
import 'package:nextrestro/features/orders/data/models/order_preview_response.dart';
import 'package:nextrestro/features/orders/data/models/order_checkout_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderRemoteDataSourceProvider = Provider<OrderRemoteDataSource>((ref) {
  return OrderRemoteDataSourceImpl(ref.read(apiClientProvider));
});

abstract class OrderRemoteDataSource {
  Future<List<OrderDetailModel>> getOrderDetails(String status);
  Future<PlaceOrderResponse> createOrder(PlaceOrderRequest request);
  Future<void> updateOrderStatus(int orderId, String status);
  Future<void> updateOrderItemStatus(int orderItemId, int orderId, String status);
  Future<List<OrderDetailModel>> getOrderById(int orderId);
  Future<OrderPreviewResponse> getOrderPreview(int orderId, double discount);
  Future<void> checkoutOrder(OrderCheckoutRequest request);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final ApiClient _apiClient;

  OrderRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<OrderDetailModel>> getOrderDetails(String status) async {
    final response = await _apiClient.get(
      ApiConstants.getOrderDetailsEndpoint,
      queryParameters: {'status': status},
    );

    if (response.data != null && response.data is List) {
      return (response.data as List)
          .map((json) => OrderDetailModel.fromJson(json))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Future<PlaceOrderResponse> createOrder(PlaceOrderRequest request) async {
    final response = await _apiClient.post(
      ApiConstants.createOrderEndpoint,
      data: request.toJson(),
    );
    return PlaceOrderResponse.fromJson(response.data);
  }

  @override
  Future<void> updateOrderStatus(int orderId, String status) async {
    await _apiClient.put(
      ApiConstants.updateOrderStatusEndpoint,
      data: {
        'orderId': orderId,
        'status': status,
      },
    );
  }

  @override
  Future<void> updateOrderItemStatus(int orderItemId, int orderId, String status) async {
    await _apiClient.put(
      ApiConstants.updateOrderItemStatusEndpoint,
      data: {
        'orderItemId': orderItemId,
        'orderId': orderId,
        'status': status,
      },
    );
  }

  @override
  Future<List<OrderDetailModel>> getOrderById(int orderId) async {
    final response = await _apiClient.get(
      ApiConstants.getOrderByIdEndpoint.replaceAll(':orderId', orderId.toString()),
    );
    if (response.data != null && response.data is List) {
      return (response.data as List)
          .map((json) => OrderDetailModel.fromJson(json))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Future<OrderPreviewResponse> getOrderPreview(int orderId, double discount) async {
    final response = await _apiClient.get(
      ApiConstants.getOrderPreviewEndpoint.replaceAll(':orderId', orderId.toString()),
      queryParameters: {'discount': discount},
    );
    return OrderPreviewResponse.fromJson(response.data);
  }

  @override
  Future<void> checkoutOrder(OrderCheckoutRequest request) async {
    await _apiClient.post(
      ApiConstants.orderCheckoutEndpoint,
      data: request.toJson(),
    );
  }
}
