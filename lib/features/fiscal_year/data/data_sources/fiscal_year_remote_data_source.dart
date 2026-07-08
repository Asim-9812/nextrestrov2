import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/network/api_client.dart';
import '../models/fiscal_year_model.dart';

final fiscalYearRemoteDataSourceProvider = Provider<FiscalYearRemoteDataSource>((ref) {
  return FiscalYearRemoteDataSource(ref.read(apiClientProvider));
});

class FiscalYearRemoteDataSource {
  final ApiClient _apiClient;

  FiscalYearRemoteDataSource(this._apiClient);

  Future<FiscalYearResponse> getAllFiscalYears() async {
    final response = await _apiClient.get('/api/FiscalYear');
    return FiscalYearResponse.fromJson(response.data);
  }
}
