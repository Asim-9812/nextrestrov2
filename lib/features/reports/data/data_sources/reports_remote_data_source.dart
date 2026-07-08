import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/network/api_client.dart';
import '../models/sales_report_model.dart';

final reportsRemoteDataSourceProvider = Provider<ReportsRemoteDataSource>((ref) {
  return ReportsRemoteDataSource(ref.read(apiClientProvider));
});

class ReportsRemoteDataSource {
  final ApiClient _apiClient;

  ReportsRemoteDataSource(this._apiClient);

  Future<SalesReportResponse> getSalesReport(SalesReportRequest request) async {
    final response = await _apiClient.post(
      '/api/reports/sales',
      data: request.toJson(),
    );
    return SalesReportResponse.fromJson(response.data);
  }
}
