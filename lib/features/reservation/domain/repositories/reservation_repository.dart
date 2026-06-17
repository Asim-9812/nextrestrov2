import 'package:nextrestro/features/reservation/data/models/reservation_model.dart';

abstract class ReservationRepository {
  Future<void> createReservation(ReservationRequest request);
  Future<List<ReservationListItem>> getAllReservations();
  Future<List<ReservationDetailItem>> getReservationDetails(int reservationId);
  Future<void> cancelReservation(int detailsId, int cancelledBy, String reason);
}
