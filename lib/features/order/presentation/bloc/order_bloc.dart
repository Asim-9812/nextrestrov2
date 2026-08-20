import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/order_repository.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc({required this.orderRepository}) : super(OrderInitial()) {
    on<FetchOrdersEvent>(_onFetchOrders);
    on<CreateCODOrderEvent>(_onCreateCODOrder);
    on<FetchOrderDetailsEvent>(_onFetchOrderDetails);
  }

  Future<void> _onFetchOrders(FetchOrdersEvent event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    final result = await orderRepository.getAllOrders(event.customerId);
    result.fold(
      (failure) => emit(OrderError(failure.message)),
      (orders) => emit(OrderLoaded(orders)),
    );
  }

  Future<void> _onFetchOrderDetails(FetchOrderDetailsEvent event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    final result = await orderRepository.getOrderById(event.orderId);
    result.fold(
      (failure) => emit(OrderError(failure.message)),
      (order) => emit(OrderDetailsLoaded(order)),
    );
  }

  Future<void> _onCreateCODOrder(CreateCODOrderEvent event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    final result = await orderRepository.createCODOrder(
      customerId: event.customerId,
      voucherTypeId: event.voucherTypeId,
      createdBy: event.createdBy,
      remarks: event.remarks,
      details: event.details,
    );
    result.fold(
      (failure) => emit(OrderError(failure.message)),
      (response) => emit(CODOrderSuccess(response)),
    );
  }
}
