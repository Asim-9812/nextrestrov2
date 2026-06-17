import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_model.freezed.dart';
part 'menu_item_model.g.dart';

@freezed
abstract class MenuItemModel with _$MenuItemModel {
  const factory MenuItemModel({
    required int categoryID,
    required String categoryName,
    required int subCategoryID,
    required String subCategoryName,
    required int itemID,
    required String itemName,
    required double price,
  }) = _MenuItemModel;

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);
}
