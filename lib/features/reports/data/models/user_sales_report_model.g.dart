// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sales_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSalesReportRequest _$UserSalesReportRequestFromJson(
  Map<String, dynamic> json,
) => _UserSalesReportRequest(
  fromDate: json['fromDate'] as String,
  toDate: json['toDate'] as String,
  userID: (json['userID'] as num?)?.toInt() ?? 0,
  branchID: json['branchID'] as String? ?? '3',
  fiscalYearID: (json['fiscalYearID'] as num).toInt(),
);

Map<String, dynamic> _$UserSalesReportRequestToJson(
  _UserSalesReportRequest instance,
) => <String, dynamic>{
  'fromDate': instance.fromDate,
  'toDate': instance.toDate,
  'userID': instance.userID,
  'branchID': instance.branchID,
  'fiscalYearID': instance.fiscalYearID,
};

_UserSalesReportResponse _$UserSalesReportResponseFromJson(
  Map<String, dynamic> json,
) => _UserSalesReportResponse(
  succeeded: json['succeeded'] as bool? ?? false,
  messages: json['messages'] as String?,
  data: json['data'] == null
      ? null
      : UserSalesReportData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserSalesReportResponseToJson(
  _UserSalesReportResponse instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'messages': instance.messages,
  'data': instance.data,
};

_UserSalesReportData _$UserSalesReportDataFromJson(Map<String, dynamic> json) =>
    _UserSalesReportData(
      summary: json['summary'] == null
          ? null
          : UserSalesReportSummary.fromJson(
              json['summary'] as Map<String, dynamic>,
            ),
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => UserSalesData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserSalesReportDataToJson(
  _UserSalesReportData instance,
) => <String, dynamic>{'summary': instance.summary, 'data': instance.data};

_UserSalesReportSummary _$UserSalesReportSummaryFromJson(
  Map<String, dynamic> json,
) => _UserSalesReportSummary(
  totalBills: (json['totalBills'] as num?)?.toInt() ?? 0,
  totalQuantity: (json['totalQuantity'] as num?)?.toInt() ?? 0,
  grossAmount: (json['grossAmount'] as num?)?.toDouble() ?? 0.0,
  discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
  taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
  netAmount: (json['netAmount'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$UserSalesReportSummaryToJson(
  _UserSalesReportSummary instance,
) => <String, dynamic>{
  'totalBills': instance.totalBills,
  'totalQuantity': instance.totalQuantity,
  'grossAmount': instance.grossAmount,
  'discountAmount': instance.discountAmount,
  'taxAmount': instance.taxAmount,
  'netAmount': instance.netAmount,
};

_UserSalesData _$UserSalesDataFromJson(Map<String, dynamic> json) =>
    _UserSalesData(
      sn: (json['sn'] as num?)?.toInt(),
      userID: (json['userID'] as num?)?.toInt(),
      userName: json['userName'] as String?,
      totalBills: (json['totalBills'] as num?)?.toInt() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      grossAmount: (json['grossAmount'] as num?)?.toDouble() ?? 0.0,
      discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
      taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
      netAmount: (json['netAmount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$UserSalesDataToJson(_UserSalesData instance) =>
    <String, dynamic>{
      'sn': instance.sn,
      'userID': instance.userID,
      'userName': instance.userName,
      'totalBills': instance.totalBills,
      'quantity': instance.quantity,
      'grossAmount': instance.grossAmount,
      'discountAmount': instance.discountAmount,
      'taxAmount': instance.taxAmount,
      'netAmount': instance.netAmount,
    };
