import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/product_repository.dart';
import 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  final ProductRepository productRepository;

  ReviewCubit({required this.productRepository}) : super(ReviewInitial());

  Future<void> getProductReviews(int productId) async {
    emit(ReviewLoading());
    final result = await productRepository.getProductReviews(productId);
    result.fold(
      (failure) => emit(ReviewError(failure.message)),
      (reviews) => emit(ReviewLoaded(reviews)),
    );
  }

  Future<void> createProductReview({
    required int productId,
    required int customerId,
    int? orderId,
    required int rating,
    String? reviewTitle,
    String? reviewText,
  }) async {
    emit(ReviewActionLoading());
    final result = await productRepository.createProductReview(
      productId: productId,
      customerId: customerId,
      orderId: orderId,
      rating: rating,
      reviewTitle: reviewTitle,
      reviewText: reviewText,
    );

    result.fold(
      (failure) => emit(ReviewError(failure.message)),
      (_) {
        emit(const ReviewActionSuccess('Review submitted successfully!'));
        // Refresh reviews after successful creation
        getProductReviews(productId);
      },
    );
  }
}
