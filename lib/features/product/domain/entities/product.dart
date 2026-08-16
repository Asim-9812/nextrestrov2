import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final int? productId;
  final String name;
  final String category;
  final String description;
  final double price;
  final double? oldPrice;
  final double rating;
  final int reviewCount;
  final List<String> images;
  final List<String> sizes;
  final bool isFavorite;
  final List<ProductFAQ> faqs;
  final List<ProductReview> reviews;
  final RatingSummary ratingSummary;
  
  // API specific fields
  final int? companyId;
  final String? productCode;
  final String? barcode;
  final int? productTypeId;
  final int? categoryId;
  final int? brandId;
  final int? petTypeId;
  final String? productTypeName;
  final String? categoryName;
  final String? petTypeName;
  
  // New e-commerce fields
  final double? salesPrice;
  final double? mrp;
  final String? sku;
  final int? productBatchId;
  final String? batchNo;
  final String? manufactureDate;
  final String? expiryDate;
  final double? purchasePriceNPR;
  final double? purchasePriceINR;
  final double? exchangeRate;

  Product({
    required this.id,
    this.productId,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    this.oldPrice,
    required this.rating,
    required this.reviewCount,
    required this.images,
    required this.sizes,
    this.isFavorite = false,
    this.faqs = const [],
    this.reviews = const [],
    required this.ratingSummary,
    this.companyId,
    this.productCode,
    this.barcode,
    this.productTypeId,
    this.categoryId,
    this.brandId,
    this.petTypeId,
    this.productTypeName,
    this.categoryName,
    this.petTypeName,
    this.salesPrice,
    this.mrp,
    this.sku,
    this.productBatchId,
    this.batchNo,
    this.manufactureDate,
    this.expiryDate,
    this.purchasePriceNPR,
    this.purchasePriceINR,
    this.exchangeRate,
  });

  @override
  List<Object?> get props => [id, name, category, productId, productCode, categoryId, petTypeId];
}

class ProductFAQ extends Equatable {
  final String question;
  final String answer;

  const ProductFAQ({
    required this.question,
    required this.answer,
  });

  @override
  List<Object?> get props => [question, answer];
}

class ProductReview extends Equatable {
  final String userName;
  final double rating;
  final String date;
  final String comment;
  final int helpfulCount;

  const ProductReview({
    required this.userName,
    required this.rating,
    required this.date,
    required this.comment,
    required this.helpfulCount,
  });

  @override
  List<Object?> get props => [userName, rating, date, comment, helpfulCount];
}

class RatingSummary extends Equatable {
  final double averageRating;
  final Map<int, double> starPercentages; 

  const RatingSummary({
    required this.averageRating,
    required this.starPercentages,
  });

  @override
  List<Object?> get props => [averageRating, starPercentages];
}
