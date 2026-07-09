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
    
    // Check if the response is a raw list
    if (response.data is List) {
      return FiscalYearResponse(
        succeeded: true,
        messages: 'Success',
        data: (response.data as List)
            .map((e) => FiscalYearModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    }

    return FiscalYearResponse.fromJson(response.data);
  }
}
