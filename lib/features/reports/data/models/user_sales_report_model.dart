import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_sales_report_model.freezed.dart';
part 'user_sales_report_model.g.dart';

@freezed
abstract class UserSalesReportRequest with _$UserSalesReportRequest {
  const factory UserSalesReportRequest({
    required String fromDate,
    required String toDate,
    @Default(0) int userID,
    @Default('3') String branchID,
    required int fiscalYearID,
  }) = _UserSalesReportRequest;

  factory UserSalesReportRequest.fromJson(Map<String, dynamic> json) =>
      _$UserSalesReportRequestFromJson(json);
}

@freezed
abstract class UserSalesReportResponse with _$UserSalesReportResponse {
  const factory UserSalesReportResponse({
    @Default(false) bool succeeded,
    String? messages,
    UserSalesReportData? data,
  }) = _UserSalesReportResponse;

  factory UserSalesReportResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSalesReportResponseFromJson(json);
}

@freezed
abstract class UserSalesReportData with _$UserSalesReportData {
  const factory UserSalesReportData({
    UserSalesReportSummary? summary,
    @Default([]) List<UserSalesData> data,
  }) = _UserSalesReportData;

  factory UserSalesReportData.fromJson(Map<String, dynamic> json) =>
      _$UserSalesReportDataFromJson(json);
}

@freezed
abstract class UserSalesReportSummary with _$UserSalesReportSummary {
  const factory UserSalesReportSummary({
    @Default(0) int totalBills,
    @Default(0) int totalQuantity,
    @Default(0.0) double grossAmount,
    @Default(0.0) double discountAmount,
    @Default(0.0) double taxAmount,
    @Default(0.0) double netAmount,
  }) = _UserSalesReportSummary;

  factory UserSalesReportSummary.fromJson(Map<String, dynamic> json) =>
      _$UserSalesReportSummaryFromJson(json);
}

@freezed
abstract class UserSalesData with _$UserSalesData {
  const factory UserSalesData({
    int? sn,
    int? userID,
    String? userName,
    @Default(0) int totalBills,
    @Default(0) int quantity,
    @Default(0.0) double grossAmount,
    @Default(0.0) double discountAmount,
    @Default(0.0) double taxAmount,
    @Default(0.0) double netAmount,
  }) = _UserSalesData;

  factory UserSalesData.fromJson(Map<String, dynamic> json) =>
      _$UserSalesDataFromJson(json);
}
