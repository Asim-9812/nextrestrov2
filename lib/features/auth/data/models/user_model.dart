import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.userId,
    required super.username,
    required super.email,
    required super.fullName,
    required super.phone,
    super.role,
    super.roleId,
    super.hireDate,
    super.createdAt,
    super.isActive,
    super.companyId,
    super.companyName,
    super.branchId,
    super.branchName,
    super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: (json['userID'] as num? ?? json['userId'] as num? ?? 0).toInt(),
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      fullName: json['fullName'] ?? '',
      phone: json['phone'] ?? '',
      role: json['role'],
      roleId: (json['roleID'] as num? ?? json['roleId'] as num?)?.toInt(),
      hireDate: json['hireDate'],
      createdAt: json['createdAt'],
      isActive: json['isActive'],
      companyId: (json['companyID'] as num? ?? json['companyId'] as num?)?.toInt(),
      companyName: json['companyName'],
      branchId: (json['branchID'] as num? ?? json['branchId'] as num?)?.toInt(),
      branchName: json['branchName'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'fullName': fullName,
      'phone': phone,
      'role': role,
      'roleId': roleId,
      'hireDate': hireDate,
      'createdAt': createdAt,
      'isActive': isActive,
      'companyId': companyId,
      'companyName': companyName,
      'branchId': branchId,
      'branchName': branchName,
      'token': token,
    };
  }
}
