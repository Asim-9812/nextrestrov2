// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_preview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderPreviewResponse _$OrderPreviewResponseFromJson(
  Map<String, dynamic> json,
) => _OrderPreviewResponse(
  items: (json['items'] as List<dynamic>)
      .map((e) => PreviewItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  summary: OrderSummary.fromJson(json['summary'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderPreviewResponseToJson(
  _OrderPreviewResponse instance,
) => <String, dynamic>{'items': instance.items, 'summary': instance.summary};

_PreviewItem _$PreviewItemFromJson(Map<String, dynamic> json) => _PreviewItem(
  productId: (json['productId'] as num).toInt(),
  itemName: json['itemName'] as String,
  quantity: (json['quantity'] as num).toInt(),
  unitPrice: (json['unitPrice'] as num).toDouble(),
  subtotal: (json['subtotal'] as num).toDouble(),
  specialInstructions: json['specialInstructions'] as String,
);

Map<String, dynamic> _$PreviewItemToJson(_PreviewItem instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'itemName': instance.itemName,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'subtotal': instance.subtotal,
      'specialInstructions': instance.specialInstructions,
    };

_OrderSummary _$OrderSummaryFromJson(Map<String, dynamic> json) =>
    _OrderSummary(
      orderID: (json['orderID'] as num).toInt(),
      tableID: (json['tableID'] as num).toInt(),
      invoiceNo: json['invoiceNo'] as String?,
      tableNumber: json['tableNumber'] as String,
      customerName: json['customerName'] as String?,
      subTotal: (json['subTotal'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      paymentMode: json['paymentMode'] as String?,
    );

Map<String, dynamic> _$OrderSummaryToJson(_OrderSummary instance) =>
    <String, dynamic>{
      'orderID': instance.orderID,
      'tableID': instance.tableID,
      'invoiceNo': instance.invoiceNo,
      'tableNumber': instance.tableNumber,
      'customerName': instance.customerName,
      'subTotal': instance.subTotal,
      'tax': instance.tax,
      'discount': instance.discount,
      'totalAmount': instance.totalAmount,
      'paymentMode': instance.paymentMode,
    };
