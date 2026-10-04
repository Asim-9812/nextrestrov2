import 'package:flutter/material.dart';

class AdminOrderModel {
  final int orderId;
  final int customerId;
  final String customerName;
  final String phone;
  final String email;
  final DateTime orderDate;
  final int orderStatus;
  final double totalAmount;
  final String? address;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? landmark;
  final String? deliveryNotes;
  final String? invoiceNo;

  const AdminOrderModel({
    required this.orderId,
    required this.customerId,
    required this.customerName,
    required this.phone,
    required this.email,
    required this.orderDate,
    required this.orderStatus,
    required this.totalAmount,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.landmark,
    this.deliveryNotes,
    this.invoiceNo,
  });

  factory AdminOrderModel.fromJson(Map<String, dynamic> json) {
    return AdminOrderModel(
      orderId: (json['orderId'] as num? ?? 0).toInt(),
      customerId: (json['customerId'] as num? ?? 0).toInt(),
      customerName: json['customerName'] ?? 'N/A',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      orderDate: DateTime.tryParse(json['orderDate'] ?? '') ?? DateTime.now(),
      orderStatus: (json['orderStatus'] as num? ?? 1).toInt(),
      totalAmount: (json['totalAmount'] as num? ?? 0).toDouble(),
      address: json['address'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
      landmark: json['landmark'],
      deliveryNotes: json['deliveryNotes'],
      invoiceNo: json['invoiceNo'],
    );
  }

  String get statusLabel {
    switch (orderStatus) {
      case 1:
        return 'Pending';
      case 2:
        return 'Confirmed';
      case 3:
        return 'Out for Delivery';
      case 4:
        return 'Cancelled';
      case 5:
        return 'Delivered';
      default:
        return 'Pending';
    }
  }

  Color get statusColor {
    switch (orderStatus) {
      case 1:
        return Colors.orange; // Pending (1)
      case 2:
        return Colors.blue; // Confirmed (2)
      case 3:
        return Colors.purple; // Out for Delivery (3)
      case 4:
        return Colors.red; // Cancelled (4)
      case 5:
        return Colors.green; // Delivered (5)
      default:
        return Colors.orange;
    }
  }
}
