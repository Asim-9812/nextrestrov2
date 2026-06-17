import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_model.freezed.dart';
part 'shift_model.g.dart';

@freezed
abstract class ShiftResponse with _$ShiftResponse {
  const factory ShiftResponse({
    @Default(false) bool succeeded,
    String? messages,
    List<ShiftModel>? data,
  }) = _ShiftResponse;

  factory ShiftResponse.fromJson(Map<String, dynamic> json) =>
      _$ShiftResponseFromJson(json);
}

@freezed
abstract class ShiftModel with _$ShiftModel {
  const factory ShiftModel({
    int? shiftID,
    String? shiftName,
    int? openedByUserID,
    double? openingAmount,
    String? openingTime,
    int? closedByUserID,
    double? closingAmount,
    String? closingTime,
    @Default(0.0) double totalSales,
    @Default(0.0) double cashSales,
    @Default(0.0) double cardSales,
    @Default(0.0) double qrSales,
    @Default(0.0) double creditSales,
    int? shiftStatus,
  }) = _ShiftModel;

  factory ShiftModel.fromJson(Map<String, dynamic> json) =>
      _$ShiftModelFromJson(json);
}
