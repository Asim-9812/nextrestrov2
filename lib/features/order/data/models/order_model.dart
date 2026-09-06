import '../../domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.orderId,
    required super.orderNumber,
    required super.orderDate,
    required super.status,
    required super.totalAmount,
    super.paymentMethod,
    super.deliveryAddress,
    super.deliveryDate,
    required super.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: (json['orderId'] as num?)?.toInt() ?? 0,
      orderNumber: json['orderNumber'] ?? json['voucherNo'] ?? '',
      orderDate: DateTime.tryParse(json['orderDate'] ?? json['voucherDate'] ?? '') ?? DateTime.now(),
      status: _mapStatus(json['status'] ?? json['orderStatus']),
      totalAmount: (json['totalAmount'] as num? ?? json['grandTotal'] as num?)?.toDouble() ?? 0.0,
      paymentMethod: json['paymentMethod'],
      deliveryAddress: json['deliveryAddress'],
      deliveryDate: json['deliveryDate'] != null
          ? DateTime.tryParse(json['deliveryDate'])
          : null,
      items: (json['items'] as List? ?? json['details'] as List? ?? [])
          .map((item) => OrderItemModel.fromJson(item))
          .toList(),
    );
  }

  static OrderStatus _mapStatus(dynamic status) {
    if (status is int) {
      switch (status) {
        case 0: return OrderStatus.toPay;
        case 1: return OrderStatus.processing;
        case 2: return OrderStatus.shipped;
        case 3: return OrderStatus.delivered;
        case 4: return OrderStatus.cancelled;
        default: return OrderStatus.processing;
      }
    }
    final statusStr = status?.toString().toLowerCase() ?? '';
    switch (statusStr) {
      case 'topay':
      case 'to pay':
        return OrderStatus.toPay;
      case 'processing':
        return OrderStatus.processing;
      case 'shipped':
        return OrderStatus.shipped;
      case 'delivered':
        return OrderStatus.delivered;
      case 'cancelled':
        return OrderStatus.cancelled;
      default:
        return OrderStatus.processing;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'orderNumber': orderNumber,
      'orderDate': orderDate.toIso8601String(),
      'status': status.index,
      'totalAmount': totalAmount,
      'paymentMethod': paymentMethod,
      'deliveryAddress': deliveryAddress,
      'deliveryDate': deliveryDate?.toIso8601String(),
      'items': items.map((item) => (item as OrderItemModel).toJson()).toList(),
    };
  }
}

class OrderItemModel extends OrderItemEntity {
  const OrderItemModel({
    required super.productId,
    required super.productName,
    super.productCode,
    super.imageUrl,
    required super.quantity,
    required super.unitPrice,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      productId: (json['productId'] as num?)?.toInt() ?? 0,
      productName: json['productName'] ?? '',
      productCode: json['productCode'],
      imageUrl: json['imageUrl'],
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'productCode': productCode,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'unitPrice': unitPrice,
    };
  }
}
