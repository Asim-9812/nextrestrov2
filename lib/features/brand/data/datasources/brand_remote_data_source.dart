import '../../../../core/network/dio_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/brand_model.dart';

abstract class BrandRemoteDataSource {
  Future<List<BrandModel>> getAllBrands();
}

class BrandRemoteDataSourceImpl implements BrandRemoteDataSource {
  final DioClient _dioClient;

  BrandRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.getAllBrands);
      if (response.data != null && response.data['data'] != null) {
        return (response.data['data'] as List)
            .map((json) => BrandModel.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
