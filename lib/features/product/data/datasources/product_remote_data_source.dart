import '../../../../core/network/dio_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final DioClient _dioClient;

  ProductRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.getEcommerceProducts);
      if (response.data != null && response.data['data'] != null) {
        return (response.data['data'] as List)
            .map((json) => ProductModel.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
