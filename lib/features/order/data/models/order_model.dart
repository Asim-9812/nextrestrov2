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
        case 1: return OrderStatus.pending;
        case 2: return OrderStatus.confirmed;
        case 3: return OrderStatus.shipped;
        case 4: return OrderStatus.cancelled;
        case 5: return OrderStatus.delivered;
        default: return OrderStatus.pending;
      }
    }
    final statusStr = status?.toString().toLowerCase() ?? '';
    switch (statusStr) {
      case 'pending':
        return OrderStatus.pending;
      case 'confirmed':
        return OrderStatus.confirmed;
      case 'shipped':
      case 'shipped / out for delivery':
        return OrderStatus.shipped;
      case 'cancelled':
        return OrderStatus.cancelled;
      case 'delivered':
        return OrderStatus.delivered;
      default:
        return OrderStatus.pending;
    }
  }

  Map<String, dynamic> toJson() {
    int statusId = 1;
    switch (status) {
      case OrderStatus.pending: statusId = 1; break;
      case OrderStatus.confirmed: statusId = 2; break;
      case OrderStatus.shipped: statusId = 3; break;
      case OrderStatus.cancelled: statusId = 4; break;
      case OrderStatus.delivered: statusId = 5; break;
    }
    return {
      'orderId': orderId,
      'orderNumber': orderNumber,
      'orderDate': orderDate.toIso8601String(),
      'status': statusId,
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
