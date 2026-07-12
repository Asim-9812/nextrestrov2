// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_sales_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerSalesReportRequest _$CustomerSalesReportRequestFromJson(
  Map<String, dynamic> json,
) => _CustomerSalesReportRequest(
  fromDate: json['fromDate'] as String,
  toDate: json['toDate'] as String,
  branchID: json['branchID'] as String? ?? '3',
  fiscalYearID: (json['fiscalYearID'] as num).toInt(),
  customerID: (json['customerID'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CustomerSalesReportRequestToJson(
  _CustomerSalesReportRequest instance,
) => <String, dynamic>{
  'fromDate': instance.fromDate,
  'toDate': instance.toDate,
  'branchID': instance.branchID,
  'fiscalYearID': instance.fiscalYearID,
  'customerID': instance.customerID,
};

_CustomerSalesReportResponse _$CustomerSalesReportResponseFromJson(
  Map<String, dynamic> json,
) => _CustomerSalesReportResponse(
  succeeded: json['succeeded'] as bool? ?? false,
  messages: json['messages'] as String?,
  data: json['data'] == null
      ? null
      : CustomerSalesReportData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CustomerSalesReportResponseToJson(
  _CustomerSalesReportResponse instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'messages': instance.messages,
  'data': instance.data,
};

_CustomerSalesReportData _$CustomerSalesReportDataFromJson(
  Map<String, dynamic> json,
) => _CustomerSalesReportData(
  summary: json['summary'] == null
      ? null
      : CustomerSalesReportSummary.fromJson(
          json['summary'] as Map<String, dynamic>,
        ),
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => CustomerSalesData.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CustomerSalesReportDataToJson(
  _CustomerSalesReportData instance,
) => <String, dynamic>{'summary': instance.summary, 'data': instance.data};

_CustomerSalesReportSummary _$CustomerSalesReportSummaryFromJson(
  Map<String, dynamic> json,
) => _CustomerSalesReportSummary(
  totalBills: (json['totalBills'] as num?)?.toInt() ?? 0,
  totalQuantity: (json['totalQuantity'] as num?)?.toInt() ?? 0,
  grossAmount: (json['grossAmount'] as num?)?.toDouble() ?? 0.0,
  discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
  taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
  netAmount: (json['netAmount'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$CustomerSalesReportSummaryToJson(
  _CustomerSalesReportSummary instance,
) => <String, dynamic>{
  'totalBills': instance.totalBills,
  'totalQuantity': instance.totalQuantity,
  'grossAmount': instance.grossAmount,
  'discountAmount': instance.discountAmount,
  'taxAmount': instance.taxAmount,
  'netAmount': instance.netAmount,
};

_CustomerSalesData _$CustomerSalesDataFromJson(Map<String, dynamic> json) =>
    _CustomerSalesData(
      sn: (json['sn'] as num?)?.toInt(),
      customerID: (json['customerID'] as num?)?.toInt(),
      customerName: json['customerName'] as String?,
      totalBills: (json['totalBills'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      grossAmount: (json['grossAmount'] as num?)?.toDouble() ?? 0.0,
      discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
      taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
      netAmount: (json['netAmount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$CustomerSalesDataToJson(_CustomerSalesData instance) =>
    <String, dynamic>{
      'sn': instance.sn,
      'customerID': instance.customerID,
      'customerName': instance.customerName,
      'totalBills': instance.totalBills,
      'quantity': instance.quantity,
      'grossAmount': instance.grossAmount,
      'discountAmount': instance.discountAmount,
      'taxAmount': instance.taxAmount,
      'netAmount': instance.netAmount,
    };
