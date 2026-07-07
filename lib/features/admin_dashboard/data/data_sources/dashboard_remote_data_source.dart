import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/network/api_client.dart';
import 'package:nextrestro/core/network/api_constants.dart';
import 'package:nextrestro/features/admin_dashboard/data/models/dashboard_summary_model.dart';

final dashboardRemoteDataSourceProvider = Provider<DashboardRemoteDataSource>((ref) {
  return DashboardRemoteDataSourceImpl(ref.read(apiClientProvider));
});

abstract class DashboardRemoteDataSource {
  Future<DashboardSummaryModel> getDashboardSummary(DashboardSummaryRequest request);
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final ApiClient _apiClient;

  DashboardRemoteDataSourceImpl(this._apiClient);

  @override
  Future<DashboardSummaryModel> getDashboardSummary(DashboardSummaryRequest request) async {
    final response = await _apiClient.post(
      ApiConstants.getDashboardSummaryEndpoint,
      data: request.toJson(),
    );

    if (response.data != null && response.data['succeeded'] == true) {
      return DashboardSummaryModel.fromJson(response.data['data']);
    } else {
      throw Exception(response.data['messages'] ?? 'Failed to fetch dashboard summary');
    }
  }
}
