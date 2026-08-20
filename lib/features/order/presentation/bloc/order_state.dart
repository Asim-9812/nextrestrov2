import 'package:equatable/equatable.dart';
import '../../domain/entities/cod_order_response_entity.dart';
import '../../domain/entities/order_detail_entity.dart';
import '../../domain/entities/order_entity.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final List<OrderEntity> orders;
  const OrderLoaded(this.orders);

  @override
  List<Object?> get props => [orders];
}

class OrderDetailsLoaded extends OrderState {
  final OrderDetailEntity order;
  const OrderDetailsLoaded(this.order);

  @override
  List<Object?> get props => [order];
}

class CODOrderSuccess extends OrderState {
  final CODOrderResponseEntity response;
  const CODOrderSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class OrderError extends OrderState {
  final String message;
  const OrderError(this.message);

  @override
  List<Object?> get props => [message];
}
