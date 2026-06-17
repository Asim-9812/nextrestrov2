// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceOrderResponse _$PlaceOrderResponseFromJson(Map<String, dynamic> json) =>
    _PlaceOrderResponse(
      message: json['message'] as String,
      orderId: OrderIdResult.fromJson(json['orderId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceOrderResponseToJson(_PlaceOrderResponse instance) =>
    <String, dynamic>{'message': instance.message, 'orderId': instance.orderId};

_OrderIdResult _$OrderIdResultFromJson(Map<String, dynamic> json) =>
    _OrderIdResult(
      result: (json['result'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      exception: json['exception'] as String?,
      status: (json['status'] as num).toInt(),
      isCanceled: json['isCanceled'] as bool,
      isCompleted: json['isCompleted'] as bool,
      isCompletedSuccessfully: json['isCompletedSuccessfully'] as bool,
      creationOptions: (json['creationOptions'] as num).toInt(),
      asyncState: json['asyncState'] as String?,
      isFaulted: json['isFaulted'] as bool,
    );

Map<String, dynamic> _$OrderIdResultToJson(_OrderIdResult instance) =>
    <String, dynamic>{
      'result': instance.result,
      'id': instance.id,
      'exception': instance.exception,
      'status': instance.status,
      'isCanceled': instance.isCanceled,
      'isCompleted': instance.isCompleted,
      'isCompletedSuccessfully': instance.isCompletedSuccessfully,
      'creationOptions': instance.creationOptions,
      'asyncState': instance.asyncState,
      'isFaulted': instance.isFaulted,
    };
