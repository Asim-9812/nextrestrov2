import 'package:equatable/equatable.dart';

enum OrderStatus {
  pending,    // 1
  confirmed,  // 2
  shipped,    // 3
  cancelled,  // 4
  delivered,  // 5
}

class OrderEntity extends Equatable {
  final int orderId;
  final String orderNumber;
  final DateTime orderDate;
  final OrderStatus status;
  final double totalAmount;
  final String? paymentMethod;
  final String? deliveryAddress;
  final DateTime? deliveryDate;
  final List<OrderItemEntity> items;

  const OrderEntity({
    required this.orderId,
    required this.orderNumber,
    required this.orderDate,
    required this.status,
    required this.totalAmount,
    this.paymentMethod,
    this.deliveryAddress,
    this.deliveryDate,
    required this.items,
  });

  @override
  List<Object?> get props => [
        orderId,
        orderNumber,
        orderDate,
        status,
        totalAmount,
        paymentMethod,
        deliveryAddress,
        deliveryDate,
        items,
      ];
}

class OrderItemEntity extends Equatable {
  final int productId;
  final String productName;
  final String? productCode;
  final String? imageUrl;
  final int quantity;
  final double unitPrice;

  const OrderItemEntity({
    required this.productId,
    required this.productName,
    this.productCode,
    this.imageUrl,
    required this.quantity,
    required this.unitPrice,
  });

  @override
  List<Object?> get props => [
        productId,
        productName,
        productCode,
        imageUrl,
        quantity,
        unitPrice,
      ];
}
