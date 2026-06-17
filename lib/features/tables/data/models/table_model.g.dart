// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TableModel _$TableModelFromJson(Map<String, dynamic> json) => _TableModel(
  tableID: (json['tableID'] as num).toInt(),
  tableNumber: json['tableNumber'] as String,
  capacity: (json['capacity'] as num).toInt(),
  floorID: (json['floorID'] as num).toInt(),
  floorName: json['floorName'] as String,
  status: json['status'] as String,
  isActive: json['isActive'] as bool,
  qrToken: json['qrToken'] as String?,
);

Map<String, dynamic> _$TableModelToJson(_TableModel instance) =>
    <String, dynamic>{
      'tableID': instance.tableID,
      'tableNumber': instance.tableNumber,
      'capacity': instance.capacity,
      'floorID': instance.floorID,
      'floorName': instance.floorName,
      'status': instance.status,
      'isActive': instance.isActive,
      'qrToken': instance.qrToken,
    };
