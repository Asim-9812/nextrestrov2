import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/network/api_client.dart';
import '../models/voucher_type_model.dart';

final voucherTypeRemoteDataSourceProvider = Provider<VoucherTypeRemoteDataSource>((ref) {
  return VoucherTypeRemoteDataSource(ref.read(apiClientProvider));
});

class VoucherTypeRemoteDataSource {
  final ApiClient _apiClient;

  VoucherTypeRemoteDataSource(this._apiClient);

  Future<VoucherTypeResponse> getAllVoucherTypes() async {
    final response = await _apiClient.get('/api/VoucherType');
    return VoucherTypeResponse.fromJson(response.data);
  }
}
