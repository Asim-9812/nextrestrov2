import 'package:equatable/equatable.dart';

import '../../domain/entities/delivery_entity.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class FetchOrdersEvent extends OrderEvent {
  final int customerId;
  const FetchOrdersEvent(this.customerId);

  @override
  List<Object?> get props => [customerId];
}

class CreateCODOrderEvent extends OrderEvent {
  final int customerId;
  final int voucherTypeId;
  final int? createdBy;
  final String? remarks;
  final DeliveryEntity delivery;
  final List<Map<String, dynamic>> details;

  const CreateCODOrderEvent({
    required this.customerId,
    required this.voucherTypeId,
    this.createdBy,
    this.remarks,
    required this.delivery,
    required this.details,
  });

  @override
  List<Object?> get props => [customerId, voucherTypeId, createdBy, remarks, delivery, details];
}

class FetchOrderDetailsEvent extends OrderEvent {
  final int orderId;
  const FetchOrderDetailsEvent(this.orderId);

  @override
  List<Object?> get props => [orderId];
}
