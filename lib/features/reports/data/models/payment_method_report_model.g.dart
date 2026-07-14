// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentMethodReportRequest _$PaymentMethodReportRequestFromJson(
  Map<String, dynamic> json,
) => _PaymentMethodReportRequest(
  fromDate: json['fromDate'] as String,
  toDate: json['toDate'] as String,
  branchID: json['branchID'] as String? ?? '0',
  fiscalYearID: (json['fiscalYearID'] as num).toInt(),
  paymentMethod: json['paymentMethod'] as String? ?? '1',
);

Map<String, dynamic> _$PaymentMethodReportRequestToJson(
  _PaymentMethodReportRequest instance,
) => <String, dynamic>{
  'fromDate': instance.fromDate,
  'toDate': instance.toDate,
  'branchID': instance.branchID,
  'fiscalYearID': instance.fiscalYearID,
  'paymentMethod': instance.paymentMethod,
};

_PaymentMethodReportResponse _$PaymentMethodReportResponseFromJson(
  Map<String, dynamic> json,
) => _PaymentMethodReportResponse(
  succeeded: json['succeeded'] as bool? ?? false,
  messages: json['messages'] as String?,
  data: json['data'] == null
      ? null
      : PaymentMethodReportData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PaymentMethodReportResponseToJson(
  _PaymentMethodReportResponse instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'messages': instance.messages,
  'data': instance.data,
};

_PaymentMethodReportData _$PaymentMethodReportDataFromJson(
  Map<String, dynamic> json,
) => _PaymentMethodReportData(
  summary: json['summary'] == null
      ? null
      : PaymentMethodReportSummary.fromJson(
          json['summary'] as Map<String, dynamic>,
        ),
  data:
      (json['data'] as List<dynamic>?)
          ?.map(
            (e) => PaymentMethodItemData.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$PaymentMethodReportDataToJson(
  _PaymentMethodReportData instance,
) => <String, dynamic>{'summary': instance.summary, 'data': instance.data};

_PaymentMethodReportSummary _$PaymentMethodReportSummaryFromJson(
  Map<String, dynamic> json,
) => _PaymentMethodReportSummary(
  totalBills: (json['totalBills'] as num?)?.toInt() ?? 0,
  totalQuantity: (json['totalQuantity'] as num?)?.toInt() ?? 0,
  grossAmount: (json['grossAmount'] as num?)?.toDouble() ?? 0.0,
  discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
  taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
  netAmount: (json['netAmount'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$PaymentMethodReportSummaryToJson(
  _PaymentMethodReportSummary instance,
) => <String, dynamic>{
  'totalBills': instance.totalBills,
  'totalQuantity': instance.totalQuantity,
  'grossAmount': instance.grossAmount,
  'discountAmount': instance.discountAmount,
  'taxAmount': instance.taxAmount,
  'netAmount': instance.netAmount,
};

_PaymentMethodItemData _$PaymentMethodItemDataFromJson(
  Map<String, dynamic> json,
) => _PaymentMethodItemData(
  sn: (json['sn'] as num?)?.toInt(),
  paymentMethod: json['paymentMethod'] as String?,
  totalBills: (json['totalBills'] as num?)?.toInt() ?? 0,
  quantity: (json['quantity'] as num?)?.toInt() ?? 0,
  grossAmount: (json['grossAmount'] as num?)?.toDouble() ?? 0.0,
  discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
  taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
  netAmount: (json['netAmount'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$PaymentMethodItemDataToJson(
  _PaymentMethodItemData instance,
) => <String, dynamic>{
  'sn': instance.sn,
  'paymentMethod': instance.paymentMethod,
  'totalBills': instance.totalBills,
  'quantity': instance.quantity,
  'grossAmount': instance.grossAmount,
  'discountAmount': instance.discountAmount,
  'taxAmount': instance.taxAmount,
  'netAmount': instance.netAmount,
};
