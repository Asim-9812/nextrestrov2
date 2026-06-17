// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) =>
    _OrderDetailModel(
      orderID: (json['orderID'] as num?)?.toInt(),
      tableNumber: json['tableNumber'] as String?,
      customerName: json['customerName'] as String?,
      floorName: json['floorName'] as String?,
      productName: json['productName'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      productId: (json['productId'] as num?)?.toInt(),
      orderStatus: json['orderStatus'] as String?,
      itemStatus: json['itemStatus'] as String?,
      specialInstructions: json['specialInstructions'] as String?,
      orderDate: json['orderDate'] as String?,
    );

Map<String, dynamic> _$OrderDetailModelToJson(_OrderDetailModel instance) =>
    <String, dynamic>{
      'orderID': instance.orderID,
      'tableNumber': instance.tableNumber,
      'customerName': instance.customerName,
      'floorName': instance.floorName,
      'productName': instance.productName,
      'quantity': instance.quantity,
      'productId': instance.productId,
      'orderStatus': instance.orderStatus,
      'itemStatus': instance.itemStatus,
      'specialInstructions': instance.specialInstructions,
      'orderDate': instance.orderDate,
    };
