import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/cod_order_response_entity.dart';
import '../../domain/entities/order_detail_entity.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<OrderEntity>>> getAllOrders(int customerId) async {
    try {
      final orders = await remoteDataSource.getAllOrders(customerId);
      return Right(orders);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to fetch orders'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderDetailEntity>> getOrderById(int orderId) async {
    try {
      final order = await remoteDataSource.getOrderById(orderId);
      return Right(order);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to fetch order details'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CODOrderResponseEntity>> createCODOrder({
    required int customerId,
    required int voucherTypeId,
    int? createdBy,
    String? remarks,
    required List<Map<String, dynamic>> details,
  }) async {
    try {
      final response = await remoteDataSource.createCODOrder(
        customerId: customerId,
        voucherTypeId: voucherTypeId,
        createdBy: createdBy,
        remarks: remarks,
        details: details,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to create COD order'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }
}
