import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failure.dart';
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
}
