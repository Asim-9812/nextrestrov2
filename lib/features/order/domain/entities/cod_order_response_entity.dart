import 'package:equatable/equatable.dart';

class CODOrderResponseEntity extends Equatable {
  final int orderId;
  final int paymentId;
  final int paymentAttemptId;
  final double totalAmount;
  final int orderStatus;
  final int paymentStatus;
  final String transactionReference;
  final String message;

  const CODOrderResponseEntity({
    required this.orderId,
    required this.paymentId,
    required this.paymentAttemptId,
    required this.totalAmount,
    required this.orderStatus,
    required this.paymentStatus,
    required this.transactionReference,
    required this.message,
  });

  @override
  List<Object?> get props => [
        orderId,
        paymentId,
        paymentAttemptId,
        totalAmount,
        orderStatus,
        paymentStatus,
        transactionReference,
        message,
      ];
}
