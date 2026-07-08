import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/network/api_client.dart';
import '../models/prefix_suffix_model.dart';

final prefixSuffixRemoteDataSourceProvider = Provider<PrefixSuffixRemoteDataSource>((ref) {
  return PrefixSuffixRemoteDataSource(ref.read(apiClientProvider));
});

class PrefixSuffixRemoteDataSource {
  final ApiClient _apiClient;

  PrefixSuffixRemoteDataSource(this._apiClient);

  Future<PrefixSuffixResponse> getAllPrefixSuffixes() async {
    final response = await _apiClient.get('/api/PrefixSuffix');
    return PrefixSuffixResponse.fromJson(response.data);
  }
}
