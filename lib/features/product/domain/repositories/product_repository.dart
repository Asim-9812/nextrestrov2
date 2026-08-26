import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, List<ProductReview>>> getProductReviews(int productId);
  Future<Either<Failure, void>> createProductReview({
    required int productId,
    required int customerId,
    int? orderId,
    required int rating,
    String? reviewTitle,
    String? reviewText,
  });
}
