// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_sales_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BranchSalesReportRequest _$BranchSalesReportRequestFromJson(
  Map<String, dynamic> json,
) => _BranchSalesReportRequest(
  fromDate: json['fromDate'] as String,
  toDate: json['toDate'] as String,
  branchID: json['branchID'] as String? ?? '0',
  fiscalYearID: (json['fiscalYearID'] as num).toInt(),
);

Map<String, dynamic> _$BranchSalesReportRequestToJson(
  _BranchSalesReportRequest instance,
) => <String, dynamic>{
  'fromDate': instance.fromDate,
  'toDate': instance.toDate,
  'branchID': instance.branchID,
  'fiscalYearID': instance.fiscalYearID,
};

_BranchSalesReportResponse _$BranchSalesReportResponseFromJson(
  Map<String, dynamic> json,
) => _BranchSalesReportResponse(
  succeeded: json['succeeded'] as bool? ?? false,
  messages: json['messages'] as String?,
  data: json['data'] == null
      ? null
      : BranchSalesReportData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BranchSalesReportResponseToJson(
  _BranchSalesReportResponse instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'messages': instance.messages,
  'data': instance.data,
};

_BranchSalesReportData _$BranchSalesReportDataFromJson(
  Map<String, dynamic> json,
) => _BranchSalesReportData(
  summary: json['summary'] == null
      ? null
      : BranchSalesReportSummary.fromJson(
          json['summary'] as Map<String, dynamic>,
        ),
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => BranchSalesData.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$BranchSalesReportDataToJson(
  _BranchSalesReportData instance,
) => <String, dynamic>{'summary': instance.summary, 'data': instance.data};

_BranchSalesReportSummary _$BranchSalesReportSummaryFromJson(
  Map<String, dynamic> json,
) => _BranchSalesReportSummary(
  totalBills: (json['totalBills'] as num?)?.toInt() ?? 0,
  totalQuantity: (json['totalQuantity'] as num?)?.toInt() ?? 0,
  grossAmount: (json['grossAmount'] as num?)?.toDouble() ?? 0.0,
  discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
  taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
  netAmount: (json['netAmount'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$BranchSalesReportSummaryToJson(
  _BranchSalesReportSummary instance,
) => <String, dynamic>{
  'totalBills': instance.totalBills,
  'totalQuantity': instance.totalQuantity,
  'grossAmount': instance.grossAmount,
  'discountAmount': instance.discountAmount,
  'taxAmount': instance.taxAmount,
  'netAmount': instance.netAmount,
};

_BranchSalesData _$BranchSalesDataFromJson(Map<String, dynamic> json) =>
    _BranchSalesData(
      sn: (json['sn'] as num?)?.toInt(),
      branchID: (json['branchID'] as num?)?.toInt(),
      branchName: json['branchName'] as String?,
      totalBills: (json['totalBills'] as num?)?.toInt() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      grossAmount: (json['grossAmount'] as num?)?.toDouble() ?? 0.0,
      discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
      taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
      netAmount: (json['netAmount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$BranchSalesDataToJson(_BranchSalesData instance) =>
    <String, dynamic>{
      'sn': instance.sn,
      'branchID': instance.branchID,
      'branchName': instance.branchName,
      'totalBills': instance.totalBills,
      'quantity': instance.quantity,
      'grossAmount': instance.grossAmount,
      'discountAmount': instance.discountAmount,
      'taxAmount': instance.taxAmount,
      'netAmount': instance.netAmount,
    };
