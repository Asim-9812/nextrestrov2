import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    int? userID,
    String? username,
    String? email,
    String? fullName,
    String? phone,
    String? role,
    int? companyId,
    int? branchId,
    String? hireDate,
    bool? isActive,
    String? createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
