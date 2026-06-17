import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_detail_model.freezed.dart';
part 'order_detail_model.g.dart';

@freezed
abstract class OrderDetailModel with _$OrderDetailModel {
  const factory OrderDetailModel({
    int? orderID,
    String? tableNumber,
    String? customerName,
    String? floorName,
    String? productName,
    int? quantity,
    int? productId,
    String? orderStatus,
    String? itemStatus,
    String? specialInstructions,
    String? orderDate,
  }) = _OrderDetailModel;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailModelFromJson(json);
}

class GroupedOrder {
  final int orderId;
  final String tableNumber;
  final String customerName;
  final String status;
  final DateTime date;
  final int itemCount;
  final List<OrderDetailModel> items;

  GroupedOrder({
    required this.orderId,
    required this.tableNumber,
    required this.customerName,
    required this.status,
    required this.date,
    required this.itemCount,
    required this.items,
  });
}
