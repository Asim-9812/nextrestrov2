import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_model.freezed.dart';
part 'table_model.g.dart';

@freezed
abstract class TableModel with _$TableModel {
  const factory TableModel({
    required int tableID,
    required String tableNumber,
    required int capacity,
    required int floorID,
    required String floorName,
    required String status,
    required bool isActive,
    String? qrToken,
  }) = _TableModel;

  factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);
}
