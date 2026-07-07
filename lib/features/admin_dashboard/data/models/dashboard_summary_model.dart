import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_summary_model.freezed.dart';
part 'dashboard_summary_model.g.dart';

@freezed
abstract class DashboardSummaryRequest with _$DashboardSummaryRequest {
  const factory DashboardSummaryRequest({
    required String fromDate,
    required String toDate,
  }) = _DashboardSummaryRequest;

  factory DashboardSummaryRequest.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryRequestFromJson(json);
}

@freezed
abstract class DashboardSummaryModel with _$DashboardSummaryModel {
  const factory DashboardSummaryModel({
    @Default(0.0) double totalSales,
    @Default(0) int totalBills,
    @Default(0) int totalCustomers,
    @Default(0.0) double averageBill,
    @Default(0.0) double cashSales,
    @Default(0.0) double cardSales,
    @Default(0.0) double qrSales,
    @Default(0.0) double creditSales,
    @Default([]) List<TopSellingProduct> topSellingProducts,
    @Default([]) List<TopSellingCategory> topSellingCategories,
  }) = _DashboardSummaryModel;

  factory DashboardSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryModelFromJson(json);
}

@freezed
abstract class TopSellingProduct with _$TopSellingProduct {
  const factory TopSellingProduct({
    @Default(0) int productID,
    @Default('') String productName,
    @Default(0) int quantitySold,
    @Default(0.0) double totalSales,
  }) = _TopSellingProduct;

  factory TopSellingProduct.fromJson(Map<String, dynamic> json) =>
      _$TopSellingProductFromJson(json);
}

@freezed
abstract class TopSellingCategory with _$TopSellingCategory {
  const factory TopSellingCategory({
    @Default(0) int categoryID,
    @Default('') String categoryName,
    @Default(0) int quantitySold,
    @Default(0.0) double totalSales,
  }) = _TopSellingCategory;

  factory TopSellingCategory.fromJson(Map<String, dynamic> json) =>
      _$TopSellingCategoryFromJson(json);
}
