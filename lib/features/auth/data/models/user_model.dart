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
      token: json['token'] ?? json['Token'],
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

  UserModel copyWith({
    int? userId,
    String? username,
    String? email,
    String? fullName,
    String? phone,
    String? role,
    int? roleId,
    String? hireDate,
    String? createdAt,
    bool? isActive,
    int? companyId,
    String? companyName,
    int? branchId,
    String? branchName,
    String? token,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      roleId: roleId ?? this.roleId,
      hireDate: hireDate ?? this.hireDate,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
      companyId: companyId ?? this.companyId,
      companyName: companyName ?? this.companyName,
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      token: token ?? this.token,
    );
  }
}
