// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prefix_suffix_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrefixSuffixResponse _$PrefixSuffixResponseFromJson(
  Map<String, dynamic> json,
) => _PrefixSuffixResponse(
  succeeded: json['succeeded'] as bool? ?? false,
  messages: json['messages'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => PrefixSuffixModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PrefixSuffixResponseToJson(
  _PrefixSuffixResponse instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'messages': instance.messages,
  'data': instance.data,
};

_PrefixSuffixModel _$PrefixSuffixModelFromJson(Map<String, dynamic> json) =>
    _PrefixSuffixModel(
      prefixSuffixID: (json['prefixSuffixID'] as num?)?.toInt(),
      voucherTypeID: (json['voucherTypeID'] as num?)?.toInt(),
      financialYearID: (json['financialYearID'] as num?)?.toInt(),
      startIndex: (json['startIndex'] as num?)?.toDouble(),
      updatedIndex: (json['updatedIndex'] as num?)?.toDouble(),
      prefix: json['prefix'] as String?,
      suffix: json['suffix'] as String?,
      narration: json['narration'] as String?,
      status: json['status'] as bool?,
      createdBy: (json['createdBy'] as num?)?.toInt(),
      createdDate: json['createdDate'] as String?,
      extra1: json['extra1'] as String?,
      extra2: json['extra2'] as String?,
    );

Map<String, dynamic> _$PrefixSuffixModelToJson(_PrefixSuffixModel instance) =>
    <String, dynamic>{
      'prefixSuffixID': instance.prefixSuffixID,
      'voucherTypeID': instance.voucherTypeID,
      'financialYearID': instance.financialYearID,
      'startIndex': instance.startIndex,
      'updatedIndex': instance.updatedIndex,
      'prefix': instance.prefix,
      'suffix': instance.suffix,
      'narration': instance.narration,
      'status': instance.status,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'extra1': instance.extra1,
      'extra2': instance.extra2,
    };
