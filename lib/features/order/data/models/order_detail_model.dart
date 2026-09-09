import '../../domain/entities/order_detail_entity.dart';
import '../../domain/entities/order_entity.dart';

class OrderDetailModel extends OrderDetailEntity {
  const OrderDetailModel({
    required super.orderId,
    required super.customerId,
    required super.orderDate,
    required super.orderStatus,
    required super.totalAmount,
    required super.createdDate,
    required super.createdBy,
    super.updatedDate,
    super.updatedBy,
    required super.details,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailModel(
      orderId: (json['orderId'] as num?)?.toInt() ?? 0,
      customerId: (json['customerId'] as num?)?.toInt() ?? 0,
      orderDate: DateTime.tryParse(json['orderDate'] ?? json['voucherDate'] ?? '') ?? DateTime.now(),
      orderStatus: _mapStatus(json['orderStatus']),
      totalAmount: (json['totalAmount'] as num? ?? json['grandTotal'] as num?)?.toDouble() ?? 0.0,
      createdDate: DateTime.tryParse(json['createdDate'] ?? '') ?? DateTime.now(),
      createdBy: (json['createdBy'] as num?)?.toInt() ?? 0,
      updatedDate: json['updatedDate'] != null ? DateTime.tryParse(json['updatedDate']) : null,
      updatedBy: (json['updatedBy'] as num?)?.toInt(),
      details: (json['details'] as List? ?? [])
          .map((item) => OrderItemDetailModel.fromJson(item))
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
    return OrderStatus.pending;
  }
}

class OrderItemDetailModel extends OrderItemDetailEntity {
  const OrderItemDetailModel({
    required super.orderDetailId,
    required super.orderId,
    required super.productId,
    required super.productName,
    required super.productCode,
    super.productImage,
    required super.quantity,
    required super.unitPrice,
    required super.discountAmount,
    required super.totalAmount,
    required super.createdDate,
    required super.createdBy,
  });

  factory OrderItemDetailModel.fromJson(Map<String, dynamic> json) {
    String? productImage = json['productImage'];
    if (productImage != null && productImage.isNotEmpty) {
      if (!productImage.startsWith('http')) {
        final cleanPath = productImage.startsWith('/') ? productImage.substring(1) : productImage;
        productImage = 'https://pets.codeinfinitynepal.com/$cleanPath';
      }
    }

    return OrderItemDetailModel(
      orderDetailId: (json['orderDetailId'] as num?)?.toInt() ?? 0,
      orderId: (json['orderId'] as num?)?.toInt() ?? 0,
      productId: (json['productId'] as num?)?.toInt() ?? 0,
      productName: json['productName'] ?? '',
      productCode: json['productCode'] ?? '',
      productImage: productImage,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0.0,
      discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
      createdDate: DateTime.tryParse(json['createdDate'] ?? '') ?? DateTime.now(),
      createdBy: (json['createdBy'] as num?)?.toInt() ?? 0,
    );
  }
}
