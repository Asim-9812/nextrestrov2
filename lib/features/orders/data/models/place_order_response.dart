import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_order_response.freezed.dart';
part 'place_order_response.g.dart';

@freezed
abstract class PlaceOrderResponse with _$PlaceOrderResponse {
  const factory PlaceOrderResponse({
    required String message,
    required OrderIdResult orderId,
  }) = _PlaceOrderResponse;

  factory PlaceOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderResponseFromJson(json);
}

@freezed
abstract class OrderIdResult with _$OrderIdResult {
  const factory OrderIdResult({
    required int result,
    required int id,
    String? exception,
    required int status,
    required bool isCanceled,
    required bool isCompleted,
    required bool isCompletedSuccessfully,
    required int creationOptions,
    String? asyncState,
    required bool isFaulted,
  }) = _OrderIdResult;

  factory OrderIdResult.fromJson(Map<String, dynamic> json) =>
      _$OrderIdResultFromJson(json);
}
