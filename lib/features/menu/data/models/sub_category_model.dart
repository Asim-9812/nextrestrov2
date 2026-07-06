import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_category_model.freezed.dart';
part 'sub_category_model.g.dart';

@freezed
abstract class SubCategoryResponse with _$SubCategoryResponse {
  const factory SubCategoryResponse({
    required bool succeeded,
    required String messages,
    required List<SubCategoryModel> data,
  }) = _SubCategoryResponse;

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryResponseFromJson(json);
}

@freezed
abstract class SubCategoryModel with _$SubCategoryModel {
  const factory SubCategoryModel({
    required int subCategoryId,
    required int categoryId,
    required String subCategoryName,
    String? categoryName, // Optional, might be useful for UI
  }) = _SubCategoryModel;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);
}
