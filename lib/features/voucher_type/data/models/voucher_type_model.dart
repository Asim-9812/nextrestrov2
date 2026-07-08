import 'package:freezed_annotation/freezed_annotation.dart';

part 'voucher_type_model.freezed.dart';
part 'voucher_type_model.g.dart';

@freezed
abstract class VoucherTypeResponse with _$VoucherTypeResponse {
  const factory VoucherTypeResponse({
    @Default(false) bool succeeded,
    String? messages,
    List<VoucherTypeModel>? data,
  }) = _VoucherTypeResponse;

  factory VoucherTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$VoucherTypeResponseFromJson(json);
}

@freezed
abstract class VoucherTypeModel with _$VoucherTypeModel {
  const factory VoucherTypeModel({
    int? voucherTypeId,
    String? voucherTypeName,
    bool? isTax,
    String? narration,
    String? entryDate,
    bool? isActive,
    String? extra1,
    String? extra2,
  }) = _VoucherTypeModel;

  factory VoucherTypeModel.fromJson(Map<String, dynamic> json) =>
      _$VoucherTypeModelFromJson(json);
}
