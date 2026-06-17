// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceOrderRequest _$PlaceOrderRequestFromJson(Map<String, dynamic> json) =>
    _PlaceOrderRequest(
      customerId: (json['customerId'] as num).toInt(),
      tableId: (json['tableId'] as num).toInt(),
      waiterId: (json['waiterId'] as num).toInt(),
      orderType: json['orderType'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => PlaceOrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlaceOrderRequestToJson(_PlaceOrderRequest instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'tableId': instance.tableId,
      'waiterId': instance.waiterId,
      'orderType': instance.orderType,
      'items': instance.items,
    };

_PlaceOrderItem _$PlaceOrderItemFromJson(Map<String, dynamic> json) =>
    _PlaceOrderItem(
      productId: (json['productId'] as num).toInt(),
      itemName: json['itemName'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      subtotal: (json['subtotal'] as num).toDouble(),
      specialInstructions: json['specialInstructions'] as String,
    );

Map<String, dynamic> _$PlaceOrderItemToJson(_PlaceOrderItem instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'itemName': instance.itemName,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'subtotal': instance.subtotal,
      'specialInstructions': instance.specialInstructions,
    };
