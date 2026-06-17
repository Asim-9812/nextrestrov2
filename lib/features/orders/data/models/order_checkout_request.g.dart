// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_checkout_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderCheckoutRequest _$OrderCheckoutRequestFromJson(
  Map<String, dynamic> json,
) => _OrderCheckoutRequest(
  orderId: (json['orderId'] as num).toInt(),
  paymentMethod: (json['paymentMethod'] as num).toInt(),
  discount: (json['discount'] as num).toDouble(),
  splitPayments: (json['splitPayments'] as List<dynamic>?)
      ?.map((e) => SplitPayment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OrderCheckoutRequestToJson(
  _OrderCheckoutRequest instance,
) => <String, dynamic>{
  'orderId': instance.orderId,
  'paymentMethod': instance.paymentMethod,
  'discount': instance.discount,
  'splitPayments': instance.splitPayments,
};

_SplitPayment _$SplitPaymentFromJson(Map<String, dynamic> json) =>
    _SplitPayment(
      paymentMethod: (json['paymentMethod'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$SplitPaymentToJson(_SplitPayment instance) =>
    <String, dynamic>{
      'paymentMethod': instance.paymentMethod,
      'amount': instance.amount,
    };
