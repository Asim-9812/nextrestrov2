import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_report_model.freezed.dart';
part 'sales_report_model.g.dart';

@freezed
abstract class SalesReportRequest with _$SalesReportRequest {
  const factory SalesReportRequest({
    required String fromDate,
    required String toDate,
    @Default(0) int customerID,
    @Default(0) int tableID,
    @Default(0) int paymentMethod,
    @Default('') String invoiceNo,
    @Default(0) int branchID,
    required int fiscalYearID,
  }) = _SalesReportRequest;

  factory SalesReportRequest.fromJson(Map<String, dynamic> json) =>
      _$SalesReportRequestFromJson(json);
}

@freezed
abstract class SalesReportResponse with _$SalesReportResponse {
  const factory SalesReportResponse({
    @Default(false) bool succeeded,
    String? messages,
    SalesReportData? data,
  }) = _SalesReportResponse;

  factory SalesReportResponse.fromJson(Map<String, dynamic> json) =>
      _$SalesReportResponseFromJson(json);
}

@freezed
abstract class SalesReportData with _$SalesReportData {
  const factory SalesReportData({
    SalesReportSummary? summary,
    @Default([]) List<SalesInvoiceData> data,
  }) = _SalesReportData;

  factory SalesReportData.fromJson(Map<String, dynamic> json) =>
      _$SalesReportDataFromJson(json);
}

@freezed
abstract class SalesReportSummary with _$SalesReportSummary {
  const factory SalesReportSummary({
    @Default(0) int totalBills,
    @Default(0.0) double subTotal,
    @Default(0.0) double discount,
    @Default(0.0) double tax,
    @Default(0.0) double grandTotal,
    @Default(0) int totalItems,
  }) = _SalesReportSummary;

  factory SalesReportSummary.fromJson(Map<String, dynamic> json) =>
      _$SalesReportSummaryFromJson(json);
}

@freezed
abstract class SalesInvoiceData with _$SalesInvoiceData {
  const factory SalesInvoiceData({
    int? billingMasterID,
    String? invoiceNo,
    String? billingDate,
    String? customerName,
    String? tableNumber,
    String? paymentMethodName,
    @Default(0.0) double subTotal,
    @Default(0.0) double discount,
    @Default(0.0) double tax,
    @Default(0.0) double grandTotal,
  }) = _SalesInvoiceData;

  factory SalesInvoiceData.fromJson(Map<String, dynamic> json) =>
      _$SalesInvoiceDataFromJson(json);
}
