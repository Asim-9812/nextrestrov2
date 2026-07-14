import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method_report_model.freezed.dart';
part 'payment_method_report_model.g.dart';

@freezed
abstract class PaymentMethodReportRequest with _$PaymentMethodReportRequest {
  const factory PaymentMethodReportRequest({
    required String fromDate,
    required String toDate,
    @Default('0') String branchID,
    required int fiscalYearID,
    @Default('1') String paymentMethod,
  }) = _PaymentMethodReportRequest;

  factory PaymentMethodReportRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodReportRequestFromJson(json);
}

@freezed
abstract class PaymentMethodReportResponse with _$PaymentMethodReportResponse {
  const factory PaymentMethodReportResponse({
    @Default(false) bool succeeded,
    String? messages,
    PaymentMethodReportData? data,
  }) = _PaymentMethodReportResponse;

  factory PaymentMethodReportResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodReportResponseFromJson(json);
}

@freezed
abstract class PaymentMethodReportData with _$PaymentMethodReportData {
  const factory PaymentMethodReportData({
    PaymentMethodReportSummary? summary,
    @Default([]) List<PaymentMethodItemData> data,
  }) = _PaymentMethodReportData;

  factory PaymentMethodReportData.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodReportDataFromJson(json);
}

@freezed
abstract class PaymentMethodReportSummary with _$PaymentMethodReportSummary {
  const factory PaymentMethodReportSummary({
    @Default(0) int totalBills,
    @Default(0) int totalQuantity,
    @Default(0.0) double grossAmount,
    @Default(0.0) double discountAmount,
    @Default(0.0) double taxAmount,
    @Default(0.0) double netAmount,
  }) = _PaymentMethodReportSummary;

  factory PaymentMethodReportSummary.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodReportSummaryFromJson(json);
}

@freezed
abstract class PaymentMethodItemData with _$PaymentMethodItemData {
  const factory PaymentMethodItemData({
    int? sn,
    String? paymentMethod,
    @Default(0) int totalBills,
    @Default(0) int quantity,
    @Default(0.0) double grossAmount,
    @Default(0.0) double discountAmount,
    @Default(0.0) double taxAmount,
    @Default(0.0) double netAmount,
  }) = _PaymentMethodItemData;

  factory PaymentMethodItemData.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodItemDataFromJson(json);
}
