// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_selling_products_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopSellingProductsReportRequest _$TopSellingProductsReportRequestFromJson(
  Map<String, dynamic> json,
) => _TopSellingProductsReportRequest(
  fromDate: json['fromDate'] as String,
  toDate: json['toDate'] as String,
  branchID: json['branchID'] as String? ?? '0',
  fiscalYearID: (json['fiscalYearID'] as num).toInt(),
  categoryID: (json['categoryID'] as num?)?.toInt() ?? 0,
  productID: (json['productID'] as num?)?.toInt() ?? 0,
  top: (json['top'] as num?)?.toInt() ?? 10,
);

Map<String, dynamic> _$TopSellingProductsReportRequestToJson(
  _TopSellingProductsReportRequest instance,
) => <String, dynamic>{
  'fromDate': instance.fromDate,
  'toDate': instance.toDate,
  'branchID': instance.branchID,
  'fiscalYearID': instance.fiscalYearID,
  'categoryID': instance.categoryID,
  'productID': instance.productID,
  'top': instance.top,
};

_TopSellingProductsReportResponse _$TopSellingProductsReportResponseFromJson(
  Map<String, dynamic> json,
) => _TopSellingProductsReportResponse(
  succeeded: json['succeeded'] as bool? ?? false,
  messages: json['messages'] as String?,
  data: json['data'] == null
      ? null
      : TopSellingProductsReportData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$TopSellingProductsReportResponseToJson(
  _TopSellingProductsReportResponse instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'messages': instance.messages,
  'data': instance.data,
};

_TopSellingProductsReportData _$TopSellingProductsReportDataFromJson(
  Map<String, dynamic> json,
) => _TopSellingProductsReportData(
  summary: json['summary'] == null
      ? null
      : TopSellingProductsReportSummary.fromJson(
          json['summary'] as Map<String, dynamic>,
        ),
  data:
      (json['data'] as List<dynamic>?)
          ?.map(
            (e) => TopSellingProductData.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$TopSellingProductsReportDataToJson(
  _TopSellingProductsReportData instance,
) => <String, dynamic>{'summary': instance.summary, 'data': instance.data};

_TopSellingProductsReportSummary _$TopSellingProductsReportSummaryFromJson(
  Map<String, dynamic> json,
) => _TopSellingProductsReportSummary(
  totalBills: (json['totalBills'] as num?)?.toInt() ?? 0,
  totalQuantity: (json['totalQuantity'] as num?)?.toDouble() ?? 0.0,
  grossAmount: (json['grossAmount'] as num?)?.toDouble() ?? 0.0,
  discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
  taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
  netAmount: (json['netAmount'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$TopSellingProductsReportSummaryToJson(
  _TopSellingProductsReportSummary instance,
) => <String, dynamic>{
  'totalBills': instance.totalBills,
  'totalQuantity': instance.totalQuantity,
  'grossAmount': instance.grossAmount,
  'discountAmount': instance.discountAmount,
  'taxAmount': instance.taxAmount,
  'netAmount': instance.netAmount,
};

_TopSellingProductData _$TopSellingProductDataFromJson(
  Map<String, dynamic> json,
) => _TopSellingProductData(
  sn: (json['sn'] as num?)?.toInt(),
  productID: (json['productID'] as num?)?.toInt(),
  productName: json['productName'] as String?,
  categoryName: json['categoryName'] as String?,
  quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
  totalSales: (json['totalSales'] as num?)?.toDouble() ?? 0.0,
  averagePrice: (json['averagePrice'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$TopSellingProductDataToJson(
  _TopSellingProductData instance,
) => <String, dynamic>{
  'sn': instance.sn,
  'productID': instance.productID,
  'productName': instance.productName,
  'categoryName': instance.categoryName,
  'quantity': instance.quantity,
  'totalSales': instance.totalSales,
  'averagePrice': instance.averagePrice,
};
