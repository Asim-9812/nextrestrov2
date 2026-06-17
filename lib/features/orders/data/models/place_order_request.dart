import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_order_request.freezed.dart';
part 'place_order_request.g.dart';

@freezed
abstract class PlaceOrderRequest with _$PlaceOrderRequest {
  const factory PlaceOrderRequest({
    required int customerId,
    required int tableId,
    required int waiterId,
    required String orderType,
    required List<PlaceOrderItem> items,
  }) = _PlaceOrderRequest;

  factory PlaceOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderRequestFromJson(json);
}

@freezed
abstract class PlaceOrderItem with _$PlaceOrderItem {
  const factory PlaceOrderItem({
    required int productId,
    required String itemName,
    required int quantity,
    required double unitPrice,
    required double subtotal,
    required String specialInstructions,
  }) = _PlaceOrderItem;

  factory PlaceOrderItem.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderItemFromJson(json);
}
