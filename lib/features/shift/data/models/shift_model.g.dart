// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShiftResponse _$ShiftResponseFromJson(Map<String, dynamic> json) =>
    _ShiftResponse(
      succeeded: json['succeeded'] as bool? ?? false,
      messages: json['messages'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ShiftModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShiftResponseToJson(_ShiftResponse instance) =>
    <String, dynamic>{
      'succeeded': instance.succeeded,
      'messages': instance.messages,
      'data': instance.data,
    };

_ShiftModel _$ShiftModelFromJson(Map<String, dynamic> json) => _ShiftModel(
  shiftID: (json['shiftID'] as num?)?.toInt(),
  shiftName: json['shiftName'] as String?,
  openedByUserID: (json['openedByUserID'] as num?)?.toInt(),
  openingAmount: (json['openingAmount'] as num?)?.toDouble(),
  openingTime: json['openingTime'] as String?,
  closedByUserID: (json['closedByUserID'] as num?)?.toInt(),
  closingAmount: (json['closingAmount'] as num?)?.toDouble(),
  closingTime: json['closingTime'] as String?,
  totalSales: (json['totalSales'] as num?)?.toDouble() ?? 0.0,
  cashSales: (json['cashSales'] as num?)?.toDouble() ?? 0.0,
  cardSales: (json['cardSales'] as num?)?.toDouble() ?? 0.0,
  qrSales: (json['qrSales'] as num?)?.toDouble() ?? 0.0,
  creditSales: (json['creditSales'] as num?)?.toDouble() ?? 0.0,
  shiftStatus: (json['shiftStatus'] as num?)?.toInt(),
);

Map<String, dynamic> _$ShiftModelToJson(_ShiftModel instance) =>
    <String, dynamic>{
      'shiftID': instance.shiftID,
      'shiftName': instance.shiftName,
      'openedByUserID': instance.openedByUserID,
      'openingAmount': instance.openingAmount,
      'openingTime': instance.openingTime,
      'closedByUserID': instance.closedByUserID,
      'closingAmount': instance.closingAmount,
      'closingTime': instance.closingTime,
      'totalSales': instance.totalSales,
      'cashSales': instance.cashSales,
      'cardSales': instance.cardSales,
      'qrSales': instance.qrSales,
      'creditSales': instance.creditSales,
      'shiftStatus': instance.shiftStatus,
    };
