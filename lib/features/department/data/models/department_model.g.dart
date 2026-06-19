// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DepartmentModel _$DepartmentModelFromJson(Map<String, dynamic> json) =>
    _DepartmentModel(
      departmentID: (json['departmentID'] as num).toInt(),
      departmentName: json['departmentName'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$DepartmentModelToJson(_DepartmentModel instance) =>
    <String, dynamic>{
      'departmentID': instance.departmentID,
      'departmentName': instance.departmentName,
      'status': instance.status,
    };
