// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_sales_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductSalesReportRequest _$ProductSalesReportRequestFromJson(
  Map<String, dynamic> json,
) => _ProductSalesReportRequest(
  fromDate: json['fromDate'] as String,
  toDate: json['toDate'] as String,
  branchID: json['branchID'] as String? ?? '3',
  fiscalYearID: (json['fiscalYearID'] as num).toInt(),
  categoryID: (json['categoryID'] as num?)?.toInt() ?? 0,
  productID: (json['productID'] as num?)?.toInt() ?? 0,
  customerID: (json['customerID'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ProductSalesReportRequestToJson(
  _ProductSalesReportRequest instance,
) => <String, dynamic>{
  'fromDate': instance.fromDate,
  'toDate': instance.toDate,
  'branchID': instance.branchID,
  'fiscalYearID': instance.fiscalYearID,
  'categoryID': instance.categoryID,
  'productID': instance.productID,
  'customerID': instance.customerID,
};

_ProductSalesReportResponse _$ProductSalesReportResponseFromJson(
  Map<String, dynamic> json,
) => _ProductSalesReportResponse(
  succeeded: json['succeeded'] as bool? ?? false,
  messages: json['messages'] as String?,
  data: json['data'] == null
      ? null
      : ProductSalesReportData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductSalesReportResponseToJson(
  _ProductSalesReportResponse instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'messages': instance.messages,
  'data': instance.data,
};

_ProductSalesReportData _$ProductSalesReportDataFromJson(
  Map<String, dynamic> json,
) => _ProductSalesReportData(
  summary: json['summary'] == null
      ? null
      : ProductSalesReportSummary.fromJson(
          json['summary'] as Map<String, dynamic>,
        ),
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => ProductSalesData.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ProductSalesReportDataToJson(
  _ProductSalesReportData instance,
) => <String, dynamic>{'summary': instance.summary, 'data': instance.data};

_ProductSalesReportSummary _$ProductSalesReportSummaryFromJson(
  Map<String, dynamic> json,
) => _ProductSalesReportSummary(
  totalBills: (json['totalBills'] as num?)?.toInt() ?? 0,
  totalQuantity: (json['totalQuantity'] as num?)?.toDouble() ?? 0.0,
  grossAmount: (json['grossAmount'] as num?)?.toDouble() ?? 0.0,
  discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
  taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
  netAmount: (json['netAmount'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$ProductSalesReportSummaryToJson(
  _ProductSalesReportSummary instance,
) => <String, dynamic>{
  'totalBills': instance.totalBills,
  'totalQuantity': instance.totalQuantity,
  'grossAmount': instance.grossAmount,
  'discountAmount': instance.discountAmount,
  'taxAmount': instance.taxAmount,
  'netAmount': instance.netAmount,
};

_ProductSalesData _$ProductSalesDataFromJson(Map<String, dynamic> json) =>
    _ProductSalesData(
      sn: (json['sn'] as num?)?.toInt(),
      billingDate: json['billingDate'] as String?,
      invoiceNo: json['invoiceNo'] as String?,
      branchID: (json['branchID'] as num?)?.toInt(),
      branchName: json['branchName'] as String?,
      categoryID: (json['categoryID'] as num?)?.toInt(),
      categoryName: json['catrgoryName'] as String?,
      productID: (json['productID'] as num?)?.toInt(),
      productName: json['productName'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0.0,
      subTotal: (json['subTotal'] as num?)?.toDouble() ?? 0.0,
      billDiscountAmount:
          (json['billDiscountAmount'] as num?)?.toDouble() ?? 0.0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      customerID: (json['customerID'] as num?)?.toInt(),
      customerName: json['customerName'] as String?,
    );

Map<String, dynamic> _$ProductSalesDataToJson(_ProductSalesData instance) =>
    <String, dynamic>{
      'sn': instance.sn,
      'billingDate': instance.billingDate,
      'invoiceNo': instance.invoiceNo,
      'branchID': instance.branchID,
      'branchName': instance.branchName,
      'categoryID': instance.categoryID,
      'catrgoryName': instance.categoryName,
      'productID': instance.productID,
      'productName': instance.productName,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'subTotal': instance.subTotal,
      'billDiscountAmount': instance.billDiscountAmount,
      'tax': instance.tax,
      'total': instance.total,
      'customerID': instance.customerID,
      'customerName': instance.customerName,
    };
