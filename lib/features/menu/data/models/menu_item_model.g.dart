// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuItemModel _$MenuItemModelFromJson(Map<String, dynamic> json) =>
    _MenuItemModel(
      categoryID: (json['categoryID'] as num).toInt(),
      categoryName: json['categoryName'] as String,
      subCategoryID: (json['subCategoryID'] as num).toInt(),
      subCategoryName: json['subCategoryName'] as String,
      itemID: (json['itemID'] as num).toInt(),
      itemName: json['itemName'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$MenuItemModelToJson(_MenuItemModel instance) =>
    <String, dynamic>{
      'categoryID': instance.categoryID,
      'categoryName': instance.categoryName,
      'subCategoryID': instance.subCategoryID,
      'subCategoryName': instance.subCategoryName,
      'itemID': instance.itemID,
      'itemName': instance.itemName,
      'price': instance.price,
    };
