import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationEntity>>> getNotifications(int userId);
  Future<Either<Failure, int>> getUnreadCount(int userId);
  Future<Either<Failure, void>> markAsRead(int notificationId);
  Future<Either<Failure, void>> markAllAsRead(int userId);
}
