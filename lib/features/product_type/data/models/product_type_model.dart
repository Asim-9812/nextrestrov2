import '../../domain/entities/product_type_entity.dart';

class ProductTypeModel extends ProductTypeEntity {
  const ProductTypeModel({
    required super.productTypeId,
    required super.productTypeName,
    super.description,
    super.isActive,
  });

  factory ProductTypeModel.fromJson(Map<String, dynamic> json) {
    return ProductTypeModel(
      productTypeId: (json['productTypeId'] as num?)?.toInt() ?? 0,
      productTypeName: json['productTypeName'] ?? '',
      description: json['description'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productTypeId': productTypeId,
      'productTypeName': productTypeName,
      'description': description,
      'isActive': isActive,
    };
  }
}
