import '../../../../core/network/dio_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/product_model.dart';
import '../models/product_review_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductReviewModel>> getProductReviews(int productId);
  Future<void> createProductReview(Map<String, dynamic> reviewData);
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

  @override
  Future<List<ProductReviewModel>> getProductReviews(int productId) async {
    try {
      final response = await _dioClient.get(
        ApiEndpoints.getProductReviewByProduct,
        queryParameters: {'productId': productId},
      );
      if (response.data != null && response.data['data'] != null) {
        return (response.data['data'] as List)
            .map((json) => ProductReviewModel.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createProductReview(Map<String, dynamic> reviewData) async {
    try {
      await _dioClient.post(
        ApiEndpoints.createProductReview,
        data: reviewData,
      );
    } catch (e) {
      rethrow;
    }
  }
}
