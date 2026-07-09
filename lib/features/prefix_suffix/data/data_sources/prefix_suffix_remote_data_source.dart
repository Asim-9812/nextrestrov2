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
    
    if (response.data is List) {
      return PrefixSuffixResponse(
        succeeded: true,
        messages: 'Success',
        data: (response.data as List)
            .map((e) => PrefixSuffixModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    }

    return PrefixSuffixResponse.fromJson(response.data);
  }
}
