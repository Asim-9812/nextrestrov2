// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardSummaryRequest _$DashboardSummaryRequestFromJson(
  Map<String, dynamic> json,
) => _DashboardSummaryRequest(
  fromDate: json['fromDate'] as String,
  toDate: json['toDate'] as String,
);

Map<String, dynamic> _$DashboardSummaryRequestToJson(
  _DashboardSummaryRequest instance,
) => <String, dynamic>{
  'fromDate': instance.fromDate,
  'toDate': instance.toDate,
};

_DashboardSummaryModel _$DashboardSummaryModelFromJson(
  Map<String, dynamic> json,
) => _DashboardSummaryModel(
  totalSales: (json['totalSales'] as num?)?.toDouble() ?? 0.0,
  totalBills: (json['totalBills'] as num?)?.toInt() ?? 0,
  totalCustomers: (json['totalCustomers'] as num?)?.toInt() ?? 0,
  averageBill: (json['averageBill'] as num?)?.toDouble() ?? 0.0,
  cashSales: (json['cashSales'] as num?)?.toDouble() ?? 0.0,
  cardSales: (json['cardSales'] as num?)?.toDouble() ?? 0.0,
  qrSales: (json['qrSales'] as num?)?.toDouble() ?? 0.0,
  creditSales: (json['creditSales'] as num?)?.toDouble() ?? 0.0,
  topSellingProducts:
      (json['topSellingProducts'] as List<dynamic>?)
          ?.map((e) => TopSellingProduct.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  topSellingCategories:
      (json['topSellingCategories'] as List<dynamic>?)
          ?.map((e) => TopSellingCategory.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$DashboardSummaryModelToJson(
  _DashboardSummaryModel instance,
) => <String, dynamic>{
  'totalSales': instance.totalSales,
  'totalBills': instance.totalBills,
  'totalCustomers': instance.totalCustomers,
  'averageBill': instance.averageBill,
  'cashSales': instance.cashSales,
  'cardSales': instance.cardSales,
  'qrSales': instance.qrSales,
  'creditSales': instance.creditSales,
  'topSellingProducts': instance.topSellingProducts,
  'topSellingCategories': instance.topSellingCategories,
};

_TopSellingProduct _$TopSellingProductFromJson(Map<String, dynamic> json) =>
    _TopSellingProduct(
      productID: (json['productID'] as num?)?.toInt() ?? 0,
      productName: json['productName'] as String? ?? '',
      quantitySold: (json['quantitySold'] as num?)?.toInt() ?? 0,
      totalSales: (json['totalSales'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$TopSellingProductToJson(_TopSellingProduct instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'productName': instance.productName,
      'quantitySold': instance.quantitySold,
      'totalSales': instance.totalSales,
    };

_TopSellingCategory _$TopSellingCategoryFromJson(Map<String, dynamic> json) =>
    _TopSellingCategory(
      categoryID: (json['categoryID'] as num?)?.toInt() ?? 0,
      categoryName: json['categoryName'] as String? ?? '',
      quantitySold: (json['quantitySold'] as num?)?.toInt() ?? 0,
      totalSales: (json['totalSales'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$TopSellingCategoryToJson(_TopSellingCategory instance) =>
    <String, dynamic>{
      'categoryID': instance.categoryID,
      'categoryName': instance.categoryName,
      'quantitySold': instance.quantitySold,
      'totalSales': instance.totalSales,
    };
