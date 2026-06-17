import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_model.freezed.dart';
part 'reservation_model.g.dart';

@freezed
abstract class ReservationRequest with _$ReservationRequest {
  const factory ReservationRequest({
    required int customerID,
    required DateTime reservationDate,
    required String specialRequest,
    required double advanceAmount,
    required int createdBy,
    required List<ReservationDetail> reservationDetails,
  }) = _ReservationRequest;

  factory ReservationRequest.fromJson(Map<String, dynamic> json) =>
      _$ReservationRequestFromJson(json);
}

@freezed
abstract class ReservationDetail with _$ReservationDetail {
  const factory ReservationDetail({
    required int tableID,
    required int noOfPersons,
    required int reservationStatus,
    required String remarks,
  }) = _ReservationDetail;

  factory ReservationDetail.fromJson(Map<String, dynamic> json) =>
      _$ReservationDetailFromJson(json);
}

@freezed
abstract class ReservationListItem with _$ReservationListItem {
  const factory ReservationListItem({
    required int reservationID,
    required int customerID,
    required DateTime reservationDate,
    required double advanceAmount,
    required String specialRequest,
  }) = _ReservationListItem;

  factory ReservationListItem.fromJson(Map<String, dynamic> json) =>
      _$ReservationListItemFromJson(json);
}

@freezed
abstract class ReservationDetailItem with _$ReservationDetailItem {
  const factory ReservationDetailItem({
    required int reservationDetailsID,
    required int reservationID,
    required int tableID,
    required String tableNumber,
    required int noOfPersons,
    required int reservationStatus,
    required String remarks,
  }) = _ReservationDetailItem;

  factory ReservationDetailItem.fromJson(Map<String, dynamic> json) =>
      _$ReservationDetailItemFromJson(json);
}
