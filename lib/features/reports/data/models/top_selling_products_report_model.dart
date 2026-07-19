import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_selling_products_report_model.freezed.dart';
part 'top_selling_products_report_model.g.dart';

@freezed
abstract class TopSellingProductsReportRequest with _$TopSellingProductsReportRequest {
  const factory TopSellingProductsReportRequest({
    required String fromDate,
    required String toDate,
    @Default('0') String branchID,
    required int fiscalYearID,
    @Default(0) int categoryID,
    @Default(0) int productID,
    @Default(10) int top,
  }) = _TopSellingProductsReportRequest;

  factory TopSellingProductsReportRequest.fromJson(Map<String, dynamic> json) =>
      _$TopSellingProductsReportRequestFromJson(json);
}

@freezed
abstract class TopSellingProductsReportResponse with _$TopSellingProductsReportResponse {
  const factory TopSellingProductsReportResponse({
    @Default(false) bool succeeded,
    String? messages,
    TopSellingProductsReportData? data,
  }) = _TopSellingProductsReportResponse;

  factory TopSellingProductsReportResponse.fromJson(Map<String, dynamic> json) =>
      _$TopSellingProductsReportResponseFromJson(json);
}

@freezed
abstract class TopSellingProductsReportData with _$TopSellingProductsReportData {
  const factory TopSellingProductsReportData({
    TopSellingProductsReportSummary? summary,
    @Default([]) List<TopSellingProductData> data,
  }) = _TopSellingProductsReportData;

  factory TopSellingProductsReportData.fromJson(Map<String, dynamic> json) =>
      _$TopSellingProductsReportDataFromJson(json);
}

@freezed
abstract class TopSellingProductsReportSummary with _$TopSellingProductsReportSummary {
  const factory TopSellingProductsReportSummary({
    @Default(0) int totalBills,
    @Default(0.0) double totalQuantity,
    @Default(0.0) double grossAmount,
    @Default(0.0) double discountAmount,
    @Default(0.0) double taxAmount,
    @Default(0.0) double netAmount,
  }) = _TopSellingProductsReportSummary;

  factory TopSellingProductsReportSummary.fromJson(Map<String, dynamic> json) =>
      _$TopSellingProductsReportSummaryFromJson(json);
}

@freezed
abstract class TopSellingProductData with _$TopSellingProductData {
  const factory TopSellingProductData({
    int? sn,
    int? productID,
    String? productName,
    String? categoryName,
    @Default(0.0) double quantity,
    @Default(0.0) double totalSales,
    @Default(0.0) double averagePrice,
  }) = _TopSellingProductData;

  factory TopSellingProductData.fromJson(Map<String, dynamic> json) =>
      _$TopSellingProductDataFromJson(json);
}
