import '../../../../core/network/dio_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/cod_order_response_model.dart';
import '../models/order_detail_model.dart';
import '../models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> getAllOrders(int customerId);
  Future<OrderDetailModel> getOrderById(int orderId);
  Future<CODOrderResponseModel> createCODOrder({
    required int customerId,
    required int voucherTypeId,
    int? createdBy,
    String? remarks,
    required Map<String, dynamic> delivery,
    required List<Map<String, dynamic>> details,
  });
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final DioClient _dioClient;

  OrderRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<OrderModel>> getAllOrders(int customerId) async {
    try {
      final response = await _dioClient.get(
        ApiEndpoints.getAllOrders,
        queryParameters: {'customerId': customerId},
      );
      if (response.data != null && response.data['data'] != null) {
        return (response.data['data'] as List)
            .map((json) => OrderModel.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OrderDetailModel> getOrderById(int orderId) async {
    try {
      final response = await _dioClient.get(
        ApiEndpoints.getOrderById,
        queryParameters: {'orderId': orderId},
      );
      if (response.data != null && response.data['data'] != null) {
        return OrderDetailModel.fromJson(response.data['data']);
      }
      throw Exception('Order not found');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CODOrderResponseModel> createCODOrder({
    required int customerId,
    required int voucherTypeId,
    int? createdBy,
    String? remarks,
    required Map<String, dynamic> delivery,
    required List<Map<String, dynamic>> details,
  }) async {
    try {
      final response = await _dioClient.post(
        ApiEndpoints.createCODOrder,
        data: {
          'customerId': customerId,
          'voucherTypeId': voucherTypeId,
          'createdBy': createdBy,
          'remarks': remarks,
          'delivery': delivery,
          'details': details,
        },
      );
      if (response.data != null && response.data['data'] != null) {
        return CODOrderResponseModel.fromJson(response.data['data']);
      }
      throw Exception('Failed to create COD order');
    } catch (e) {
      rethrow;
    }
  }
}
