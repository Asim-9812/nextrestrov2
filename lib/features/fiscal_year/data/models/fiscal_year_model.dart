import 'package:freezed_annotation/freezed_annotation.dart';

part 'fiscal_year_model.freezed.dart';
part 'fiscal_year_model.g.dart';

@freezed
abstract class FiscalYearResponse with _$FiscalYearResponse {
  const factory FiscalYearResponse({
    @Default(false) bool succeeded,
    String? messages,
    List<FiscalYearModel>? data,
  }) = _FiscalYearResponse;

  factory FiscalYearResponse.fromJson(Map<String, dynamic> json) =>
      _$FiscalYearResponseFromJson(json);
}

@freezed
abstract class FiscalYearModel with _$FiscalYearModel {
  const factory FiscalYearModel({
    int? fiscalYearId,
    String? fromDate,
    String? toDate,
    String? fiscalYearName,
    String? shortDate,
    String? createdDate,
    int? userId,
    int? bookClose,
  }) = _FiscalYearModel;

  factory FiscalYearModel.fromJson(Map<String, dynamic> json) =>
      _$FiscalYearModelFromJson(json);
}
