import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_sales_report_model.freezed.dart';
part 'customer_sales_report_model.g.dart';

@freezed
abstract class CustomerSalesReportRequest with _$CustomerSalesReportRequest {
  const factory CustomerSalesReportRequest({
    required String fromDate,
    required String toDate,
    @Default('3') String branchID,
    required int fiscalYearID,
    @Default(0) int customerID,
  }) = _CustomerSalesReportRequest;

  factory CustomerSalesReportRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerSalesReportRequestFromJson(json);
}

@freezed
abstract class CustomerSalesReportResponse with _$CustomerSalesReportResponse {
  const factory CustomerSalesReportResponse({
    @Default(false) bool succeeded,
    String? messages,
    CustomerSalesReportData? data,
  }) = _CustomerSalesReportResponse;

  factory CustomerSalesReportResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerSalesReportResponseFromJson(json);
}

@freezed
abstract class CustomerSalesReportData with _$CustomerSalesReportData {
  const factory CustomerSalesReportData({
    CustomerSalesReportSummary? summary,
    @Default([]) List<CustomerSalesData> data,
  }) = _CustomerSalesReportData;

  factory CustomerSalesReportData.fromJson(Map<String, dynamic> json) =>
      _$CustomerSalesReportDataFromJson(json);
}

@freezed
abstract class CustomerSalesReportSummary with _$CustomerSalesReportSummary {
  const factory CustomerSalesReportSummary({
    @Default(0) int totalBills,
    @Default(0) int totalQuantity,
    @Default(0.0) double grossAmount,
    @Default(0.0) double discountAmount,
    @Default(0.0) double taxAmount,
    @Default(0.0) double netAmount,
  }) = _CustomerSalesReportSummary;

  factory CustomerSalesReportSummary.fromJson(Map<String, dynamic> json) =>
      _$CustomerSalesReportSummaryFromJson(json);
}

@freezed
abstract class CustomerSalesData with _$CustomerSalesData {
  const factory CustomerSalesData({
    int? sn,
    int? customerID,
    String? customerName,
    int? totalBills,
    int? quantity,
    @Default(0.0) double grossAmount,
    @Default(0.0) double discountAmount,
    @Default(0.0) double taxAmount,
    @Default(0.0) double netAmount,
  }) = _CustomerSalesData;

  factory CustomerSalesData.fromJson(Map<String, dynamic> json) =>
      _$CustomerSalesDataFromJson(json);
}
