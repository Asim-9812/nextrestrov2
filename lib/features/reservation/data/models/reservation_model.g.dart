// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReservationRequest _$ReservationRequestFromJson(Map<String, dynamic> json) =>
    _ReservationRequest(
      customerID: (json['customerID'] as num).toInt(),
      reservationDate: DateTime.parse(json['reservationDate'] as String),
      specialRequest: json['specialRequest'] as String,
      advanceAmount: (json['advanceAmount'] as num).toDouble(),
      createdBy: (json['createdBy'] as num).toInt(),
      reservationDetails: (json['reservationDetails'] as List<dynamic>)
          .map((e) => ReservationDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReservationRequestToJson(_ReservationRequest instance) =>
    <String, dynamic>{
      'customerID': instance.customerID,
      'reservationDate': instance.reservationDate.toIso8601String(),
      'specialRequest': instance.specialRequest,
      'advanceAmount': instance.advanceAmount,
      'createdBy': instance.createdBy,
      'reservationDetails': instance.reservationDetails,
    };

_ReservationDetail _$ReservationDetailFromJson(Map<String, dynamic> json) =>
    _ReservationDetail(
      tableID: (json['tableID'] as num).toInt(),
      noOfPersons: (json['noOfPersons'] as num).toInt(),
      reservationStatus: (json['reservationStatus'] as num).toInt(),
      remarks: json['remarks'] as String,
    );

Map<String, dynamic> _$ReservationDetailToJson(_ReservationDetail instance) =>
    <String, dynamic>{
      'tableID': instance.tableID,
      'noOfPersons': instance.noOfPersons,
      'reservationStatus': instance.reservationStatus,
      'remarks': instance.remarks,
    };

_ReservationListItem _$ReservationListItemFromJson(Map<String, dynamic> json) =>
    _ReservationListItem(
      reservationID: (json['reservationID'] as num).toInt(),
      customerID: (json['customerID'] as num).toInt(),
      reservationDate: DateTime.parse(json['reservationDate'] as String),
      advanceAmount: (json['advanceAmount'] as num).toDouble(),
      specialRequest: json['specialRequest'] as String,
    );

Map<String, dynamic> _$ReservationListItemToJson(
  _ReservationListItem instance,
) => <String, dynamic>{
  'reservationID': instance.reservationID,
  'customerID': instance.customerID,
  'reservationDate': instance.reservationDate.toIso8601String(),
  'advanceAmount': instance.advanceAmount,
  'specialRequest': instance.specialRequest,
};

_ReservationDetailItem _$ReservationDetailItemFromJson(
  Map<String, dynamic> json,
) => _ReservationDetailItem(
  reservationDetailsID: (json['reservationDetailsID'] as num).toInt(),
  reservationID: (json['reservationID'] as num).toInt(),
  tableID: (json['tableID'] as num).toInt(),
  tableNumber: json['tableNumber'] as String,
  noOfPersons: (json['noOfPersons'] as num).toInt(),
  reservationStatus: (json['reservationStatus'] as num).toInt(),
  remarks: json['remarks'] as String,
);

Map<String, dynamic> _$ReservationDetailItemToJson(
  _ReservationDetailItem instance,
) => <String, dynamic>{
  'reservationDetailsID': instance.reservationDetailsID,
  'reservationID': instance.reservationID,
  'tableID': instance.tableID,
  'tableNumber': instance.tableNumber,
  'noOfPersons': instance.noOfPersons,
  'reservationStatus': instance.reservationStatus,
  'remarks': instance.remarks,
};
