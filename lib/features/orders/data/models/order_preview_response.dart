import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_preview_response.freezed.dart';
part 'order_preview_response.g.dart';

@freezed
abstract class OrderPreviewResponse with _$OrderPreviewResponse {
  const factory OrderPreviewResponse({
    required List<PreviewItem> items,
    required OrderSummary summary,
  }) = _OrderPreviewResponse;

  factory OrderPreviewResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderPreviewResponseFromJson(json);
}

@freezed
abstract class PreviewItem with _$PreviewItem {
  const factory PreviewItem({
    required int productId,
    required String itemName,
    required int quantity,
    required double unitPrice,
    required double subtotal,
    required String specialInstructions,
  }) = _PreviewItem;

  factory PreviewItem.fromJson(Map<String, dynamic> json) =>
      _$PreviewItemFromJson(json);
}

@freezed
abstract class OrderSummary with _$OrderSummary {
  const factory OrderSummary({
    required int orderID,
    required int tableID,
    String? invoiceNo,
    required String tableNumber,
    String? customerName,
    required double subTotal,
    required double tax,
    required double discount,
    required double totalAmount,
    String? paymentMode,
  }) = _OrderSummary;

  factory OrderSummary.fromJson(Map<String, dynamic> json) =>
      _$OrderSummaryFromJson(json);
}
