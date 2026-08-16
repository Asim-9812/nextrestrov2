import '../../../../core/network/dio_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> getAllOrders(int customerId);
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
}
