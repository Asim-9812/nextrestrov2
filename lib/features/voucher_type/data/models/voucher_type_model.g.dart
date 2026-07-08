// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VoucherTypeResponse _$VoucherTypeResponseFromJson(Map<String, dynamic> json) =>
    _VoucherTypeResponse(
      succeeded: json['succeeded'] as bool? ?? false,
      messages: json['messages'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => VoucherTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VoucherTypeResponseToJson(
  _VoucherTypeResponse instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'messages': instance.messages,
  'data': instance.data,
};

_VoucherTypeModel _$VoucherTypeModelFromJson(Map<String, dynamic> json) =>
    _VoucherTypeModel(
      voucherTypeId: (json['voucherTypeId'] as num?)?.toInt(),
      voucherTypeName: json['voucherTypeName'] as String?,
      isTax: json['isTax'] as bool?,
      narration: json['narration'] as String?,
      entryDate: json['entryDate'] as String?,
      isActive: json['isActive'] as bool?,
      extra1: json['extra1'] as String?,
      extra2: json['extra2'] as String?,
    );

Map<String, dynamic> _$VoucherTypeModelToJson(_VoucherTypeModel instance) =>
    <String, dynamic>{
      'voucherTypeId': instance.voucherTypeId,
      'voucherTypeName': instance.voucherTypeName,
      'isTax': instance.isTax,
      'narration': instance.narration,
      'entryDate': instance.entryDate,
      'isActive': instance.isActive,
      'extra1': instance.extra1,
      'extra2': instance.extra2,
    };
