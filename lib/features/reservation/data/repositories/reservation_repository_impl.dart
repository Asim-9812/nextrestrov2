import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:nextrestro/core/network/api_client.dart';
import 'package:nextrestro/core/network/api_constants.dart';
import 'package:nextrestro/features/reservation/data/models/reservation_model.dart';
import 'package:nextrestro/features/reservation/domain/repositories/reservation_repository.dart';

final reservationRepositoryProvider = Provider<ReservationRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ReservationRepositoryImpl(apiClient);
});

class ReservationRepositoryImpl implements ReservationRepository {
  final ApiClient _apiClient;
  final Logger _logger = Logger();

  ReservationRepositoryImpl(this._apiClient);

  @override
  Future<void> createReservation(ReservationRequest request) async {
    try {
      _logger.i('Creating reservation for customer: ${request.customerID}');
      await _apiClient.post(
        ApiConstants.createReservationEndpoint,
        data: request.toJson(),
      );
      _logger.i('Reservation created successfully');
    } catch (e) {
      _logger.e('Failed to create reservation', error: e);
      rethrow;
    }
  }

  @override
  Future<List<ReservationListItem>> getAllReservations() async {
    try {
      _logger.i('Fetching all reservations');
      final response = await _apiClient.get(ApiConstants.getAllReservationsEndpoint);
      final dynamic data = response.data;
      
      if (data is Map<String, dynamic> && data['data'] is List) {
        final reservations = (data['data'] as List)
            .map((e) => ReservationListItem.fromJson(e as Map<String, dynamic>))
            .toList();
        _logger.i('Fetched ${reservations.length} reservations');
        return reservations;
      }
      return [];
    } catch (e) {
      _logger.e('Failed to fetch reservations', error: e);
      rethrow;
    }
  }

  @override
  Future<List<ReservationDetailItem>> getReservationDetails(int reservationId) async {
    try {
      _logger.i('Fetching details for reservation: $reservationId');
      final endpoint = ApiConstants.getReservationDetailsEndpoint
          .replaceFirst(':reservationId', reservationId.toString());
      final response = await _apiClient.get(endpoint);
      
      if (response.data is List) {
        final details = (response.data as List)
            .map((e) => ReservationDetailItem.fromJson(e as Map<String, dynamic>))
            .toList();
        _logger.i('Fetched ${details.length} detail items for reservation $reservationId');
        return details;
      }
      return [];
    } catch (e) {
      _logger.e('Failed to fetch reservation details', error: e);
      rethrow;
    }
  }

  @override
  Future<void> cancelReservation(int detailsId, int cancelledBy, String reason) async {
    try {
      _logger.i('Cancelling reservation detail: $detailsId by user: $cancelledBy');
      await _apiClient.put(
        ApiConstants.cancelReservationEndpoint,
        queryParameters: {
          'reservationDetailsId': detailsId,
          'cancelledBy': cancelledBy,
          'reason': reason,
        },
      );
      _logger.i('Reservation cancelled successfully');
    } catch (e) {
      _logger.e('Failed to cancel reservation', error: e);
      rethrow;
    }
  }
}
