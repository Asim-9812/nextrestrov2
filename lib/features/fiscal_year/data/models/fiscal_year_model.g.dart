// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiscal_year_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FiscalYearResponse _$FiscalYearResponseFromJson(Map<String, dynamic> json) =>
    _FiscalYearResponse(
      succeeded: json['succeeded'] as bool? ?? false,
      messages: json['messages'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FiscalYearModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FiscalYearResponseToJson(_FiscalYearResponse instance) =>
    <String, dynamic>{
      'succeeded': instance.succeeded,
      'messages': instance.messages,
      'data': instance.data,
    };

_FiscalYearModel _$FiscalYearModelFromJson(Map<String, dynamic> json) =>
    _FiscalYearModel(
      fiscalYearId: (json['fiscalYearId'] as num?)?.toInt(),
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      fiscalYearName: json['fiscalYearName'] as String?,
      shortDate: json['shortDate'] as String?,
      createdDate: json['createdDate'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      bookClose: (json['bookClose'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FiscalYearModelToJson(_FiscalYearModel instance) =>
    <String, dynamic>{
      'fiscalYearId': instance.fiscalYearId,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'fiscalYearName': instance.fiscalYearName,
      'shortDate': instance.shortDate,
      'createdDate': instance.createdDate,
      'userId': instance.userId,
      'bookClose': instance.bookClose,
    };
