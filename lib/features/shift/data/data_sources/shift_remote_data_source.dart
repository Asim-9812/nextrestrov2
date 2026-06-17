import 'package:nextrestro/core/network/api_client.dart';
import 'package:nextrestro/core/network/api_constants.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shiftRemoteDataSourceProvider = Provider<ShiftRemoteDataSource>((ref) {
  return ShiftRemoteDataSourceImpl(ref.read(apiClientProvider));
});

abstract class ShiftRemoteDataSource {
  Future<ShiftResponse> getAllShifts();
  Future<bool> closeShift(ShiftModel shift);
  Future<bool> openShift(ShiftModel shift);
}

class ShiftRemoteDataSourceImpl implements ShiftRemoteDataSource {
  final ApiClient _apiClient;

  ShiftRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ShiftResponse> getAllShifts() async {
    final response = await _apiClient.get(
      ApiConstants.getAllShiftsEndpoint,
    );

    if (response.data != null) {
      return ShiftResponse.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch shifts: Empty response');
    }
  }

  @override
  Future<bool> closeShift(ShiftModel shift) async {
    final response = await _apiClient.put(
      ApiConstants.closeShiftEndpoint,
      data: shift.toJson(),
    );

    if (response.data != null && response.data['succeeded'] == true) {
      return true;
    } else {
      throw Exception(response.data?['messages'] ?? 'Failed to close shift');
    }
  }

  @override
  Future<bool> openShift(ShiftModel shift) async {
    final response = await _apiClient.post(
      ApiConstants.openShiftEndpoint,
      data: shift.toJson(),
    );

    if (response.data != null && response.data['succeeded'] == true) {
      return true;
    } else {
      throw Exception(response.data?['messages'] ?? 'Failed to open shift');
    }
  }
}
