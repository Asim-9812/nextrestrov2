import '../../domain/entities/cod_order_response_entity.dart';

class CODOrderResponseModel extends CODOrderResponseEntity {
  const CODOrderResponseModel({
    required super.orderId,
    required super.paymentId,
    required super.paymentAttemptId,
    required super.totalAmount,
    required super.orderStatus,
    required super.paymentStatus,
    required super.transactionReference,
    required super.message,
  });

  factory CODOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return CODOrderResponseModel(
      orderId: (json['orderId'] as num?)?.toInt() ?? 0,
      paymentId: (json['paymentId'] as num?)?.toInt() ?? 0,
      paymentAttemptId: (json['paymentAttemptId'] as num?)?.toInt() ?? 0,
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
      orderStatus: (json['orderStatus'] as num?)?.toInt() ?? 0,
      paymentStatus: (json['paymentStatus'] as num?)?.toInt() ?? 0,
      transactionReference: json['transactionReference'] ?? '',
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'paymentId': paymentId,
      'paymentAttemptId': paymentAttemptId,
      'totalAmount': totalAmount,
      'orderStatus': orderStatus,
      'paymentStatus': paymentStatus,
      'transactionReference': transactionReference,
      'message': message,
    };
  }
}
