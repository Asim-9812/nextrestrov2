import 'package:equatable/equatable.dart';

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
