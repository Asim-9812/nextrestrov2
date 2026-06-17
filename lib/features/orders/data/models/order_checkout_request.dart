import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_checkout_request.freezed.dart';
part 'order_checkout_request.g.dart';

@freezed
abstract class OrderCheckoutRequest with _$OrderCheckoutRequest {
  const factory OrderCheckoutRequest({
    required int orderId,
    required int paymentMethod,
    required double discount,
    List<SplitPayment>? splitPayments,
  }) = _OrderCheckoutRequest;

  factory OrderCheckoutRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderCheckoutRequestFromJson(json);
}

@freezed
abstract class SplitPayment with _$SplitPayment {
  const factory SplitPayment({
    required int paymentMethod,
    required double amount,
  }) = _SplitPayment;

  factory SplitPayment.fromJson(Map<String, dynamic> json) =>
      _$SplitPaymentFromJson(json);
}
