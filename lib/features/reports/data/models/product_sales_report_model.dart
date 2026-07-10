import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_sales_report_model.freezed.dart';
part 'product_sales_report_model.g.dart';

@freezed
abstract class ProductSalesReportRequest with _$ProductSalesReportRequest {
  const factory ProductSalesReportRequest({
    required String fromDate,
    required String toDate,
    @Default('3') String branchID,
    required int fiscalYearID,
    @Default(0) int categoryID,
    @Default(0) int productID,
    @Default(0) int customerID,
  }) = _ProductSalesReportRequest;

  factory ProductSalesReportRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductSalesReportRequestFromJson(json);
}

@freezed
abstract class ProductSalesReportResponse with _$ProductSalesReportResponse {
  const factory ProductSalesReportResponse({
    @Default(false) bool succeeded,
    String? messages,
    ProductSalesReportData? data,
  }) = _ProductSalesReportResponse;

  factory ProductSalesReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductSalesReportResponseFromJson(json);
}

@freezed
abstract class ProductSalesReportData with _$ProductSalesReportData {
  const factory ProductSalesReportData({
    ProductSalesReportSummary? summary,
    @Default([]) List<ProductSalesData> data,
  }) = _ProductSalesReportData;

  factory ProductSalesReportData.fromJson(Map<String, dynamic> json) =>
      _$ProductSalesReportDataFromJson(json);
}

@freezed
abstract class ProductSalesReportSummary with _$ProductSalesReportSummary {
  const factory ProductSalesReportSummary({
    @Default(0) int totalBills,
    @Default(0.0) double totalQuantity,
    @Default(0.0) double grossAmount,
    @Default(0.0) double discountAmount,
    @Default(0.0) double taxAmount,
    @Default(0.0) double netAmount,
  }) = _ProductSalesReportSummary;

  factory ProductSalesReportSummary.fromJson(Map<String, dynamic> json) =>
      _$ProductSalesReportSummaryFromJson(json);
}

@freezed
abstract class ProductSalesData with _$ProductSalesData {
  const factory ProductSalesData({
    int? sn,
    String? billingDate,
    String? invoiceNo,
    int? branchID,
    String? branchName,
    int? categoryID,
    @JsonKey(name: 'catrgoryName') String? categoryName,
    int? productID,
    String? productName,
    @Default(0.0) double quantity,
    @Default(0.0) double unitPrice,
    @Default(0.0) double subTotal,
    @Default(0.0) double billDiscountAmount,
    @Default(0.0) double tax,
    @Default(0.0) double total,
    int? customerID,
    String? customerName,
  }) = _ProductSalesData;

  factory ProductSalesData.fromJson(Map<String, dynamic> json) =>
      _$ProductSalesDataFromJson(json);
}
