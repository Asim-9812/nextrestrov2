import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import 'package:nextrestro/features/orders/data/data_sources/order_remote_data_source.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/features/orders/data/models/place_order_request.dart';
import 'package:nextrestro/features/orders/data/models/place_order_response.dart';
import 'package:nextrestro/features/orders/data/models/order_preview_response.dart';
import 'package:nextrestro/features/orders/data/models/order_checkout_request.dart';
import 'package:nextrestro/features/orders/domain/repositories/order_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/providers/order_dashboard_state.dart';

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return OrderRepositoryImpl(ref.read(orderRemoteDataSourceProvider));
});

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource _remoteDataSource;

  OrderRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<OrderDetailModel>>> getOrdersByStatus(String status) async {
    try {
      final response = await _remoteDataSource.getOrderDetails(status);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GroupedOrder>>> getAllOrdersGrouped() async {
    try {
      final statuses = ["Pending", "Confirmed", "Completed"];
      final List<OrderDetailModel> allItems = [];

      for (final status in statuses) {
        final items = await _remoteDataSource.getOrderDetails(status);
        allItems.addAll(items);
      }

      final Map<int, List<OrderDetailModel>> groupedMap = {};
      for (final item in allItems) {
        if (item.orderID != null) {
          groupedMap.putIfAbsent(item.orderID!, () => []).add(item);
        }
      }

      final List<GroupedOrder> groupedOrders = groupedMap.entries.map((entry) {
        final items = entry.value;
        final firstItem = items.first;
        return GroupedOrder(
          orderId: entry.key,
          tableNumber: firstItem.tableNumber ?? 'N/A',
          customerName: firstItem.customerName ?? 'Unknown',
          status: firstItem.orderStatus ?? 'Unknown',
          date: DateTime.tryParse(firstItem.orderDate ?? '') ?? DateTime(0),
          itemCount: items.length,
          items: items,
        );
      }).toList();

      // Sort by date descending (latest first)
      groupedOrders.sort((a, b) => b.date.compareTo(a.date));

      return Right(groupedOrders);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PlaceOrderResponse>> createOrder(PlaceOrderRequest request) async {
    try {
      final response = await _remoteDataSource.createOrder(request);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrderStatus(int orderId, String status) async {
    try {
      await _remoteDataSource.updateOrderStatus(orderId, status);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrderItemStatus(int orderItemId, int orderId, String status) async {
    try {
      await _remoteDataSource.updateOrderItemStatus(orderItemId, orderId, status);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderDetailModel>>> getOrderById(int orderId) async {
    try {
      final response = await _remoteDataSource.getOrderById(orderId);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, OrderDashboardState>> getOrderDashboardStream() async* {
    while (true) {
      try {
        final pendingResult = await getOrdersByStatus('Pending');
        final confirmedResult = await getOrdersByStatus('Confirmed');
        final completedResult = await getOrdersByStatus('Completed');
        final cancelledResult = await getOrdersByStatus('Cancelled');

        final state = OrderDashboardState(
          pendingOrders: pendingResult.getOrElse((_) => []),
          confirmedOrders: confirmedResult.getOrElse((_) => []),
          completedOrders: completedResult.getOrElse((_) => []),
          cancelledOrders: cancelledResult.getOrElse((_) => []),
        );

        yield Right(state);
      } catch (e) {
        yield Left(UnknownFailure(e.toString()));
      }
      await Future.delayed(const Duration(seconds: 10));
    }
  }

  @override
  Future<Either<Failure, OrderPreviewResponse>> getOrderPreview(int orderId, double discount) async {
    try {
      final response = await _remoteDataSource.getOrderPreview(orderId, discount);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> checkoutOrder(OrderCheckoutRequest request) async {
    try {
      await _remoteDataSource.checkoutOrder(request);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
