// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubCategoryResponse _$SubCategoryResponseFromJson(Map<String, dynamic> json) =>
    _SubCategoryResponse(
      succeeded: json['succeeded'] as bool,
      messages: json['messages'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => SubCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubCategoryResponseToJson(
  _SubCategoryResponse instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'messages': instance.messages,
  'data': instance.data,
};

_SubCategoryModel _$SubCategoryModelFromJson(Map<String, dynamic> json) =>
    _SubCategoryModel(
      subCategoryId: (json['subCategoryId'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      subCategoryName: json['subCategoryName'] as String,
      categoryName: json['categoryName'] as String?,
    );

Map<String, dynamic> _$SubCategoryModelToJson(_SubCategoryModel instance) =>
    <String, dynamic>{
      'subCategoryId': instance.subCategoryId,
      'categoryId': instance.categoryId,
      'subCategoryName': instance.subCategoryName,
      'categoryName': instance.categoryName,
    };
