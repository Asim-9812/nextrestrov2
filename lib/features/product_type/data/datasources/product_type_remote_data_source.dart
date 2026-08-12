import '../../../../core/network/dio_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/product_type_model.dart';

abstract class ProductTypeRemoteDataSource {
  Future<List<ProductTypeModel>> getAllProductTypes();
}

class ProductTypeRemoteDataSourceImpl implements ProductTypeRemoteDataSource {
  final DioClient _dioClient;

  ProductTypeRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<ProductTypeModel>> getAllProductTypes() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.getAllProductTypes);
      if (response.data != null && response.data['data'] != null) {
        return (response.data['data'] as List)
            .map((json) => ProductTypeModel.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
