import 'package:equatable/equatable.dart';
import 'order_entity.dart';

class OrderDetailEntity extends Equatable {
  final int orderId;
  final int customerId;
  final DateTime orderDate;
  final OrderStatus orderStatus;
  final double totalAmount;
  final DateTime createdDate;
  final int createdBy;
  final DateTime? updatedDate;
  final int? updatedBy;
  final List<OrderItemDetailEntity> details;

  const OrderDetailEntity({
    required this.orderId,
    required this.customerId,
    required this.orderDate,
    required this.orderStatus,
    required this.totalAmount,
    required this.createdDate,
    required this.createdBy,
    this.updatedDate,
    this.updatedBy,
    required this.details,
  });

  @override
  List<Object?> get props => [
        orderId,
        customerId,
        orderDate,
        orderStatus,
        totalAmount,
        createdDate,
        createdBy,
        updatedDate,
        updatedBy,
        details,
      ];
}

class OrderItemDetailEntity extends Equatable {
  final int orderDetailId;
  final int orderId;
  final int productId;
  final String productName;
  final String productCode;
  final String? productImage;
  final int quantity;
  final double unitPrice;
  final double discountAmount;
  final double totalAmount;
  final DateTime createdDate;
  final int createdBy;

  const OrderItemDetailEntity({
    required this.orderDetailId,
    required this.orderId,
    required this.productId,
    required this.productName,
    required this.productCode,
    this.productImage,
    required this.quantity,
    required this.unitPrice,
    required this.discountAmount,
    required this.totalAmount,
    required this.createdDate,
    required this.createdBy,
  });

  @override
  List<Object?> get props => [
        orderDetailId,
        orderId,
        productId,
        productName,
        productCode,
        productImage,
        quantity,
        unitPrice,
        discountAmount,
        totalAmount,
        createdDate,
        createdBy,
      ];
}
