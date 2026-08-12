import '../../../../core/network/dio_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getAllCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final DioClient _dioClient;

  CategoryRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.getAllCategories);
      if (response.data != null && response.data['data'] != null) {
        return (response.data['data'] as List)
            .map((json) => CategoryModel.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
