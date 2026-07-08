// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => _BranchModel(
  branchID: (json['branchID'] as num?)?.toInt(),
  companyID: (json['companyID'] as num).toInt(),
  branchName: json['branchName'] as String,
  address: json['address'] as String,
  phoneNumber: json['phoneNumber'] as String,
  extra1: json['extra1'] as String?,
  extra2: json['extra2'] as String?,
);

Map<String, dynamic> _$BranchModelToJson(_BranchModel instance) =>
    <String, dynamic>{
      'branchID': instance.branchID,
      'companyID': instance.companyID,
      'branchName': instance.branchName,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'extra1': instance.extra1,
      'extra2': instance.extra2,
    };
