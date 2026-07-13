import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_sales_report_model.freezed.dart';
part 'branch_sales_report_model.g.dart';

@freezed
abstract class BranchSalesReportRequest with _$BranchSalesReportRequest {
  const factory BranchSalesReportRequest({
    required String fromDate,
    required String toDate,
    @Default('0') String branchID,
    required int fiscalYearID,
  }) = _BranchSalesReportRequest;

  factory BranchSalesReportRequest.fromJson(Map<String, dynamic> json) =>
      _$BranchSalesReportRequestFromJson(json);
}

@freezed
abstract class BranchSalesReportResponse with _$BranchSalesReportResponse {
  const factory BranchSalesReportResponse({
    @Default(false) bool succeeded,
    String? messages,
    BranchSalesReportData? data,
  }) = _BranchSalesReportResponse;

  factory BranchSalesReportResponse.fromJson(Map<String, dynamic> json) =>
      _$BranchSalesReportResponseFromJson(json);
}

@freezed
abstract class BranchSalesReportData with _$BranchSalesReportData {
  const factory BranchSalesReportData({
    BranchSalesReportSummary? summary,
    @Default([]) List<BranchSalesData> data,
  }) = _BranchSalesReportData;

  factory BranchSalesReportData.fromJson(Map<String, dynamic> json) =>
      _$BranchSalesReportDataFromJson(json);
}

@freezed
abstract class BranchSalesReportSummary with _$BranchSalesReportSummary {
  const factory BranchSalesReportSummary({
    @Default(0) int totalBills,
    @Default(0) int totalQuantity,
    @Default(0.0) double grossAmount,
    @Default(0.0) double discountAmount,
    @Default(0.0) double taxAmount,
    @Default(0.0) double netAmount,
  }) = _BranchSalesReportSummary;

  factory BranchSalesReportSummary.fromJson(Map<String, dynamic> json) =>
      _$BranchSalesReportSummaryFromJson(json);
}

@freezed
abstract class BranchSalesData with _$BranchSalesData {
  const factory BranchSalesData({
    int? sn,
    int? branchID,
    String? branchName,
    @Default(0) int totalBills,
    @Default(0) int quantity,
    @Default(0.0) double grossAmount,
    @Default(0.0) double discountAmount,
    @Default(0.0) double taxAmount,
    @Default(0.0) double netAmount,
  }) = _BranchSalesData;

  factory BranchSalesData.fromJson(Map<String, dynamic> json) =>
      _$BranchSalesDataFromJson(json);
}
