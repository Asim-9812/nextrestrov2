import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    super.productId,
    required super.name,
    required super.category,
    required super.description,
    required super.price,
    super.oldPrice,
    required super.rating,
    required super.reviewCount,
    required super.images,
    required super.sizes,
    super.isFavorite,
    super.faqs,
    super.reviews,
    required super.ratingSummary,
    super.companyId,
    super.productCode,
    super.barcode,
    super.productTypeId,
    super.categoryId,
    super.brandId,
    super.petTypeId,
    super.productTypeName,
    super.categoryName,
    super.petTypeName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final idInt = (json['productId'] as num?)?.toInt() ?? 0;
    
    return ProductModel(
      id: idInt.toString(),
      productId: idInt,
      name: json['productName'] ?? 'Product $idInt',
      category: json['categoryName'] ?? 'Uncategorized',
      description: json['description'] ?? 'No description available.',
      price: (json['price'] as num? ?? 1200.0).toDouble(),
      oldPrice: (json['oldPrice'] as num? ?? 1500.0).toDouble(),
      rating: (json['rating'] as num? ?? 4.5).toDouble(),
      reviewCount: (json['reviewCount'] as num? ?? 120).toInt(),
      images: [
        'assets/images/dashboard_assets/sample_product.png',
      ],
      sizes: const ['S', 'M', 'L'],
      ratingSummary: const RatingSummary(
        averageRating: 4.5,
        starPercentages: {5: 0.7, 4: 0.2, 3: 0.05, 2: 0.03, 1: 0.02},
      ),
      companyId: (json['companyId'] as num?)?.toInt(),
      productCode: json['productCode'],
      barcode: json['barcode'],
      productTypeId: (json['productTypeId'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      brandId: (json['brandId'] as num?)?.toInt(),
      petTypeId: (json['petTypeId'] as num?)?.toInt(),
      productTypeName: json['productTypeName'],
      categoryName: json['categoryName'],
      petTypeName: json['petTypeName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': name,
      'categoryName': category,
      'description': description,
    };
  }
}
