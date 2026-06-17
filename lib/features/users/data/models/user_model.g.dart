// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  userID: (json['userID'] as num?)?.toInt(),
  username: json['username'] as String?,
  email: json['email'] as String?,
  fullName: json['fullName'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
  companyId: (json['companyId'] as num?)?.toInt(),
  branchId: (json['branchId'] as num?)?.toInt(),
  hireDate: json['hireDate'] as String?,
  isActive: json['isActive'] as bool?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'username': instance.username,
      'email': instance.email,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'role': instance.role,
      'companyId': instance.companyId,
      'branchId': instance.branchId,
      'hireDate': instance.hireDate,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt,
    };
