import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/network/api_client.dart';
import 'package:nextrestro/core/network/api_constants.dart';
import '../models/sales_report_model.dart';
import '../models/product_sales_report_model.dart';
import '../models/customer_sales_report_model.dart';
import '../models/user_sales_report_model.dart';

final reportsRemoteDataSourceProvider = Provider<ReportsRemoteDataSource>((ref) {
  return ReportsRemoteDataSource(ref.read(apiClientProvider));
});

class ReportsRemoteDataSource {
  final ApiClient _apiClient;

  ReportsRemoteDataSource(this._apiClient);

  Future<SalesReportResponse> getSalesReport(SalesReportRequest request) async {
    final response = await _apiClient.post(
      ApiConstants.getSalesReportEndpoint,
      data: request.toJson(),
    );
    return SalesReportResponse.fromJson(response.data);
  }

  Future<ProductSalesReportResponse> getProductSalesReport(ProductSalesReportRequest request) async {
    final response = await _apiClient.post(
      ApiConstants.getProductSalesReportEndpoint,
      data: request.toJson(),
    );
    return ProductSalesReportResponse.fromJson(response.data);
  }

  Future<CustomerSalesReportResponse> getCustomerSalesReport(CustomerSalesReportRequest request) async {
    final response = await _apiClient.post(
      ApiConstants.getCustomerSalesReportEndpoint,
      data: request.toJson(),
    );
    return CustomerSalesReportResponse.fromJson(response.data);
  }

  Future<UserSalesReportResponse> getUserSalesReport(UserSalesReportRequest request) async {
    final response = await _apiClient.post(
      ApiConstants.getUserSalesReportEndpoint,
      data: request.toJson(),
    );
    return UserSalesReportResponse.fromJson(response.data);
  }
}
