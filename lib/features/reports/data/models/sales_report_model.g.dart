// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesReportRequest _$SalesReportRequestFromJson(Map<String, dynamic> json) =>
    _SalesReportRequest(
      fromDate: json['fromDate'] as String,
      toDate: json['toDate'] as String,
      customerID: (json['customerID'] as num?)?.toInt() ?? 0,
      tableID: (json['tableID'] as num?)?.toInt() ?? 0,
      paymentMethod: (json['paymentMethod'] as num?)?.toInt() ?? 0,
      invoiceNo: json['invoiceNo'] as String? ?? '',
      branchID: (json['branchID'] as num?)?.toInt() ?? 0,
      fiscalYearID: (json['fiscalYearID'] as num).toInt(),
    );

Map<String, dynamic> _$SalesReportRequestToJson(_SalesReportRequest instance) =>
    <String, dynamic>{
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'customerID': instance.customerID,
      'tableID': instance.tableID,
      'paymentMethod': instance.paymentMethod,
      'invoiceNo': instance.invoiceNo,
      'branchID': instance.branchID,
      'fiscalYearID': instance.fiscalYearID,
    };

_SalesReportResponse _$SalesReportResponseFromJson(Map<String, dynamic> json) =>
    _SalesReportResponse(
      succeeded: json['succeeded'] as bool? ?? false,
      messages: json['messages'] as String?,
      data: json['data'] == null
          ? null
          : SalesReportData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SalesReportResponseToJson(
  _SalesReportResponse instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'messages': instance.messages,
  'data': instance.data,
};

_SalesReportData _$SalesReportDataFromJson(Map<String, dynamic> json) =>
    _SalesReportData(
      summary: json['summary'] == null
          ? null
          : SalesReportSummary.fromJson(
              json['summary'] as Map<String, dynamic>,
            ),
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => SalesInvoiceData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SalesReportDataToJson(_SalesReportData instance) =>
    <String, dynamic>{'summary': instance.summary, 'data': instance.data};

_SalesReportSummary _$SalesReportSummaryFromJson(Map<String, dynamic> json) =>
    _SalesReportSummary(
      totalBills: (json['totalBills'] as num?)?.toInt() ?? 0,
      subTotal: (json['subTotal'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      grandTotal: (json['grandTotal'] as num?)?.toDouble() ?? 0.0,
      totalItems: (json['totalItems'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SalesReportSummaryToJson(_SalesReportSummary instance) =>
    <String, dynamic>{
      'totalBills': instance.totalBills,
      'subTotal': instance.subTotal,
      'discount': instance.discount,
      'tax': instance.tax,
      'grandTotal': instance.grandTotal,
      'totalItems': instance.totalItems,
    };

_SalesInvoiceData _$SalesInvoiceDataFromJson(Map<String, dynamic> json) =>
    _SalesInvoiceData(
      billingMasterID: (json['billingMasterID'] as num?)?.toInt(),
      invoiceNo: json['invoiceNo'] as String?,
      billingDate: json['billingDate'] as String?,
      customerName: json['customerName'] as String?,
      tableNumber: json['tableNumber'] as String?,
      paymentMethodName: json['paymentMethodName'] as String?,
      subTotal: (json['subTotal'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      grandTotal: (json['grandTotal'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$SalesInvoiceDataToJson(_SalesInvoiceData instance) =>
    <String, dynamic>{
      'billingMasterID': instance.billingMasterID,
      'invoiceNo': instance.invoiceNo,
      'billingDate': instance.billingDate,
      'customerName': instance.customerName,
      'tableNumber': instance.tableNumber,
      'paymentMethodName': instance.paymentMethodName,
      'subTotal': instance.subTotal,
      'discount': instance.discount,
      'tax': instance.tax,
      'grandTotal': instance.grandTotal,
    };
