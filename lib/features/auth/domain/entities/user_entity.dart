import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int userId;
  final String username;
  final String email;
  final String fullName;
  final String phone;
  final String? role;
  final int? roleId;
  final String? hireDate;
  final String? createdAt;
  final bool? isActive;
  final int? companyId;
  final String? companyName;
  final int? branchId;
  final String? branchName;
  final String? token;

  const UserEntity({
    required this.userId,
    required this.username,
    required this.email,
    required this.fullName,
    required this.phone,
    this.role,
    this.roleId,
    this.hireDate,
    this.createdAt,
    this.isActive,
    this.companyId,
    this.companyName,
    this.branchId,
    this.branchName,
    this.token,
  });

  @override
  List<Object?> get props => [
        userId,
        username,
        email,
        fullName,
        phone,
        role,
        roleId,
        hireDate,
        createdAt,
        isActive,
        companyId,
        companyName,
        branchId,
        branchName,
        token,
      ];
}
