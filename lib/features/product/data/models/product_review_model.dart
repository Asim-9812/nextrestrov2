import '../../domain/entities/product.dart';

class ProductReviewModel extends ProductReview {
  const ProductReviewModel({
    required super.reviewId,
    required super.productId,
    required super.customerId,
    super.orderId,
    required super.rating,
    super.reviewTitle,
    super.reviewText,
    super.isActive,
    required super.createdDate,
    super.updatedDate,
    super.updatedBy,
    super.productName,
    super.customerName,
  });

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) {
    return ProductReviewModel(
      reviewId: (json['reviewId'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      customerId: (json['customerId'] as num).toInt(),
      orderId: (json['orderId'] as num?)?.toInt(),
      rating: (json['rating'] as num).toDouble(),
      reviewTitle: json['reviewTitle'],
      reviewText: json['reviewText'],
      isActive: json['isActive'] ?? true,
      createdDate: json['createdDate'],
      updatedDate: json['updatedDate'],
      updatedBy: (json['updatedBy'] as num?)?.toInt(),
      productName: json['productName'],
      customerName: json['customerName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reviewId': reviewId,
      'productId': productId,
      'customerId': customerId,
      'orderId': orderId,
      'rating': rating,
      'reviewTitle': reviewTitle,
      'reviewText': reviewText,
      'isActive': isActive,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'updatedBy': updatedBy,
      'productName': productName,
      'customerName': customerName,
    };
  }
}
