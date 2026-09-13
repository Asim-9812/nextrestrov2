import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasources/notification_remote_data_source.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications(int userId) async {
    try {
      final notifications = await remoteDataSource.getNotifications(userId);
      return Right(notifications);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to fetch notifications'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getUnreadCount(int userId) async {
    try {
      final count = await remoteDataSource.getUnreadCount(userId);
      return Right(count);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to fetch unread count'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markAsRead(int notificationId) async {
    try {
      await remoteDataSource.markAsRead(notificationId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to mark notification as read'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markAllAsRead(int userId) async {
    try {
      await remoteDataSource.markAllAsRead(userId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to mark all notifications as read'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }
}
