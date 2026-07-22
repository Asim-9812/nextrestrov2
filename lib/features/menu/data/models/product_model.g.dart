// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      productId: (json['productId'] as num).toInt(),
      productName: json['productName'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      categoryId: (json['categoryId'] as num).toInt(),
      subCategoryId: (json['subCategoryId'] as num).toInt(),
      isTaxable: json['isTaxable'] as bool,
      imageUrl: json['imageUrl'] as String?,
      image: json['image'] as String?,
      createdBy: (json['createdBy'] as num?)?.toInt(),
      isActive: (json['isActive'] as num).toInt(),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'description': instance.description,
      'price': instance.price,
      'categoryId': instance.categoryId,
      'subCategoryId': instance.subCategoryId,
      'isTaxable': instance.isTaxable,
      'imageUrl': instance.imageUrl,
      'image': instance.image,
      'createdBy': instance.createdBy,
      'isActive': instance.isActive,
    };
