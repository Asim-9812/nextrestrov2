import '../../domain/entities/brand_entity.dart';

class BrandModel extends BrandEntity {
  const BrandModel({
    required super.brandId,
    required super.brandName,
    super.description,
    super.isActive,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      brandId: (json['brandId'] as num?)?.toInt() ?? 0,
      brandName: json['brandName'] ?? '',
      description: json['description'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brandId': brandId,
      'brandName': brandName,
      'description': description,
      'isActive': isActive,
    };
  }
}
