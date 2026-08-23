import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/cod_order_response_entity.dart';
import '../entities/delivery_entity.dart';
import '../entities/order_detail_entity.dart';
import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderEntity>>> getAllOrders(int customerId);
  
  Future<Either<Failure, OrderDetailEntity>> getOrderById(int orderId);

  Future<Either<Failure, CODOrderResponseEntity>> createCODOrder({
    required int customerId,
    required int voucherTypeId,
    int? createdBy,
    String? remarks,
    required DeliveryEntity delivery,
    required List<Map<String, dynamic>> details,
  });
}
