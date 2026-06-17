import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
abstract class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    required int customerID,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String address,
    required int loyaltyPoints,
    required bool isMember,
    String? gender,
    DateTime? dob,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
